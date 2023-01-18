import 'package:appeliculas/providers/movie_providers.dart';
import 'package:appeliculas/search/search_delegate.dart';
import 'package:appeliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Peliculas de cines')
            ),
        actions:[
          IconButton(
            onPressed: (){
              showSearch(context: context, delegate: MovieSearchDelegate());
            } ,
            icon:const Icon(Icons.search))
        ],          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Card de peliculas
            CardSwiper(movies:moviesProvider.onDisplayMovie),

            SliderMovie(
              movies:moviesProvider.onPopularMovie,
              onNextPage: ()=> moviesProvider.getPopularMovies(),
              ),

            
            //listado horizontal de peliculas
          ],
        ),
      )
    );
  }
}
