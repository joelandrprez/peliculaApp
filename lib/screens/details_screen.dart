import 'package:appeliculas/models/models.dart';
import 'package:appeliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class detailsScreen extends StatelessWidget {
   
  const detailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie; 
    print(movie);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie:movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie:movie),
              const _OverView(),
              const _OverView(),
              CastingScreen(movieId:movie.id)



            ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
   
  final Movie movie;   
   
  const _CustomAppBar({Key? key,required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child:Text(
            movie.title!,
            style:const TextStyle(
              fontSize: 16
            ),
            ),
        ),
        background: FadeInImage(
                placeholder:const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullbackdropPathImg),
                fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
   
  final Movie movie;   
  const _PosterAndTitle({Key? key,required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final fuente = Theme.of(context).textTheme;
    return Container(
      margin:const EdgeInsets.only(top: 20),//separacion
      padding:const EdgeInsets.symmetric(horizontal:20 ),//internamente
      child: Row(
        children: [
          Hero(
            tag: movie.heroID!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:FadeInImage(
                  placeholder:const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPosterImg),
                  height: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                    movie.title!,
                    style: fuente.headline5,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 2),
              ),
              Text(movie.originalTitle!,style: fuente.subtitle1,overflow: TextOverflow.ellipsis,maxLines: 1,),
              Row(
                    children:const [
                      Icon(Icons.star_rate_outlined,size: 15,color: Colors.grey,),
                      SizedBox(width: 5),
                      Text('Botos')
                    ],
                  )
            ],
            
          )
        ],
        
      )
    );
  }
}

class _OverView extends StatelessWidget {
   
  const _OverView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child:Text(
        'Labore aliquip mollit labore commodo culpa ex cillum velit non et dolor eu proident. Anim duis Lorem incididunt nulla commodo laborum tempor magna aute ullamco amet. Qui consequat anim duis nulla ea irure deserunt dolor est.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}