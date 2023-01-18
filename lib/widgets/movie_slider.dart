import 'package:appeliculas/models/movie.dart';
import 'package:flutter/material.dart';

class SliderMovie extends StatefulWidget {
  final List<Movie> movies;
  final Function onNextPage;

  const SliderMovie({Key? key,required this.movies,required this.onNextPage}) : super(key: key);

  @override
  State<SliderMovie> createState() => _SliderMovieState();
}

class _SliderMovieState extends State<SliderMovie> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent-500){

        widget.onNextPage();

      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    if(this.widget.movies.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child:const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Popular',style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),))
          ,Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context , int index){
                final movie = widget.movies[index];
                return _MoviePoster(movie: movie);
              } 
                
            ),
          )
        ],

      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
   
  final Movie movie;

  const _MoviePoster({Key? key,required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    movie.heroID = 'swiper-Data-${movie.id}';

    return Container(
        width:130,
        height: 190,
        margin:const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap:  ()=>{Navigator.pushNamed(context, 'details',arguments: movie)},
              child: Hero(
                tag: movie.heroID!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder:const AssetImage('assets/no-image.jpg'), 
                      image: NetworkImage(movie.fullPosterImg!),
                      width: 130,
                      height: 190,
                      fit: BoxFit.cover,              
                  ),
                ),
              ),
            ),
            Text(
              movie.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,)
          ],
        ),
      );
  }
}