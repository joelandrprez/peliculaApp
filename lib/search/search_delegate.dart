import 'package:appeliculas/models/models.dart';
import 'package:appeliculas/providers/movie_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar peliculas';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){

      close(context, null);

      }, icon: const Icon(Icons.arrow_back));
  }

  Widget _emptyContainer(){
      return  Container(
        child:const Center(
          child: Icon(
            Icons.movie_creation_outlined,
            color: Colors.black38,
            size: 100,
          ),
        ),
      );
  }


  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if( query.isEmpty) return _emptyContainer();

    print('tenemos valor para buscar');

    final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);
    moviesProvider.getSuggestionByQuery(query);


    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (BuildContext context,AsyncSnapshot<List<Movie?>?> snapshot){
        if(!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder :(context,int index){
            return _MoviesItem(movie:movies[index]!);
          }
          );
      },
    );

  }
  
  
}

class _MoviesItem extends StatelessWidget {

  final Movie movie;
  const _MoviesItem({Key? key,required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    movie.heroID = 'swiper-Delegate-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroID!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      title:Text( movie.title!),
      subtitle: Text(movie.originalTitle!),
      onTap: (){
        Navigator.pushNamed(context,'details', arguments: movie);
      },
    );
  }
}