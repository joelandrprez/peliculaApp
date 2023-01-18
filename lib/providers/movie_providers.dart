import 'dart:async';

import 'package:appeliculas/helpers/debouncer.dart';
import 'package:appeliculas/models/models.dart';
import 'package:appeliculas/models/search_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier{

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '752d22633ad4037a4da48f1172fcef22';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovie=[];
  List<Movie> onPopularMovie=[];
  Map<int?,List<Cast?>?> moviesCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration:const  Duration(milliseconds: 500),);
    
  final StreamController<List<Movie?>?> _suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie?>?> get suggestionStream => this._suggestionStreamController.stream;
  

  MoviesProvider(){
     getOnDisplayMovies();
     getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint,[int page = 1]) async{
      final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'  
      });
      final response = await http.get(url);
      return response.body;
  }

  Future<List<Cast?>?> getMovieCast(int? movieId) async{

    if(moviesCast.containsKey(movieId)){
      return moviesCast[movieId];
    }

    final jsonData = await this._getJsonData('/3/movie/${movieId}/credits');
    final creditsResponse = CreditResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;

  }

  getOnDisplayMovies() async{

    final json =await this._getJsonData('/3/movie/now_playing');
    final nowPlayResponse =  NowPlayingResponse.fromJson(json);
    onDisplayMovie = nowPlayResponse.results;
    notifyListeners(); // notitica a los widgets    

  }

  getPopularMovies( ) async{
    _popularPage ++;
    final json =await this._getJsonData('/3/movie/popular',_popularPage);
    final popularMovie=  PopularResponse.fromJson(json);
    onPopularMovie = [...onPopularMovie,...popularMovie.results];
    notifyListeners(); // notitica a los widgets
  }

  Future<List<Movie?>?> searchMovie(String query) async{
    final url = Uri.https(_baseUrl, '3/search/movie', {
    'api_key': _apiKey,
    'language': _language,
    'query': query
    });
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body) ;    

    return searchResponse.results;

  }

  void getSuggestionByQuery(String searchTerm){

    debouncer.value = '';
    debouncer.onValue = (value) async {
      final List<Movie?>? result = await this.searchMovie(value);
      this._suggestionStreamController.add(result);

    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (timer) { 
      debouncer.value = searchTerm;
    });
    Future.delayed(const Duration(milliseconds: 301)).then((context)=>timer.cancel());
  }


}