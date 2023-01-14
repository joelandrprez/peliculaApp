import 'package:appeliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Peliculas de cines')
            ),
        actions:[
          IconButton(
            onPressed: (){} ,
            icon:const Icon(Icons.search))
        ],          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Card de peliculas
            CardSwiper(),
            SliderMovie(),

            
            //listado horizontal de peliculas
          ],
        ),
      )
    );
  }
}
