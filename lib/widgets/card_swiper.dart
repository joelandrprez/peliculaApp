import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: ()=>{Navigator.pushNamed(context, 'details',arguments: 'movie-instance')},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://educacion30.b-cdn.net/wp-content/uploads/2019/02/girasoles-978x652.jpg'),
                fit: BoxFit.cover,),
            ),
          );
        },
      ),
    );
  }
}