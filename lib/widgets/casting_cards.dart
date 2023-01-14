import 'package:flutter/material.dart';

class CastingScreen extends StatelessWidget {
   
  const CastingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 30),
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,int index)=> _CastCdrd()
        ),
    );
  }
}

class _CastCdrd extends StatelessWidget {
   
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
            child:const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),  
              image: NetworkImage('https://educacion30.b-cdn.net/wp-content/uploads/2019/02/girasoles-978x652.jpg'),
              height: 100,
              width: 110,
              fit: BoxFit.cover,
              ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Actor name asdas asd asasd asd',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}