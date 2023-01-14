import 'package:appeliculas/providers/movie_providers.dart';
import 'package:appeliculas/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => MoviesProvider(),lazy: false,),
      ],
      child:const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas en cines',
      initialRoute: 'home',
      routes: {

        'home': (context) =>const HomeScreen(),
        'details': (context) =>const detailsScreen(),

      },
      theme: ThemeData.light().copyWith(
        appBarTheme:const AppBarTheme(
          color: Colors.green
        )
      ),
    );
  }
}