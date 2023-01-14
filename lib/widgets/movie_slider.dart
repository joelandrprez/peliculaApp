import 'package:flutter/material.dart';

class SliderMovie extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context , int index) => const _MoviePoster(),
            ),
          )
        ],

      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
   
  const _MoviePoster({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width:130,
        height: 190,
        margin:const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap:  ()=>{Navigator.pushNamed(context, 'details',arguments: 'movie-instance')},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'), 
                    image: NetworkImage('https://educacion30.b-cdn.net/wp-content/uploads/2019/02/girasoles-978x652.jpg'),
                    width: 130,
                    height: 190,
                    fit: BoxFit.cover,              
                ),
              ),
            ),
            const Text(
              'StarWars:retorno de lorem sdf fsdf sdf sdf sdf sdf sd',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,)
          ],
        ),
      );
  }
}