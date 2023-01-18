import 'package:appeliculas/models/models.dart';
import 'package:appeliculas/providers/movie_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastingScreen extends StatelessWidget {
  final int? movieId ;
  const CastingScreen({Key? key, required this.movieId}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),

      builder: (BuildContext context, AsyncSnapshot<List<Cast?>?> snapshot) {
          if(!snapshot.hasData){
            return Container(
              width: double.infinity,
              height: 180,
              child:const Center(
                child: CircularProgressIndicator(),
              )
            );
          }

          final List<Cast?>? cast =snapshot.data;

          return Container(
            margin:const EdgeInsets.only(bottom: 30),
            height: 180,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,int index)=> _CastCdrd(actor:cast![index]!)
              ),
          );
      },
    );



  }
}

class _CastCdrd extends StatelessWidget {
   final Cast actor;
   const _CastCdrd({Key? key,required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width:110 ,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:FadeInImage(
              placeholder:const AssetImage('assets/no-image.jpg'),  
              image: NetworkImage(actor.fullPosterImg),
              height: 100,
              width: 110,
              fit: BoxFit.cover,
              ),
          ),
          const SizedBox(height: 5),
          Text(
            actor.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}