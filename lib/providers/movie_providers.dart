import 'package:appeliculas/models/now_playing__response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProvider extends ChangeNotifier{

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '752d22633ad4037a4da48f1172fcef22';
  final String _language = 'es-ES';


  MoviesProvider(){
     print('Se inicializo');
     this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async{
    //dominio / path / content
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'  
      });

    final response = await http.get(url);

    if (response.statusCode == 200) {
        final nowPlayResponse =  NowPlayingResponse.fromJson(response.body);

        print('respuesta http: ${nowPlayResponse.results?[0]}.');

      } else {
        print('error: ${response.statusCode}.');
      }


  }
}