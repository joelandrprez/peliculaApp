import 'package:appeliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class detailsScreen extends StatelessWidget {
   
  const detailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'No-movie'; 

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
              const _OverView(),
              const _OverView(),
              const CastingScreen()



            ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
   
  const _CustomAppBar({Key? key}) : super(key: key);
  
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
          child:const Text(
            'Detalle de la pelicula',
            style: TextStyle(
              fontSize: 16
            ),
            ),
        ),
        background:const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://educacion30.b-cdn.net/wp-content/uploads/2019/02/girasoles-978x652.jpg'),
                fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
   
  const _PosterAndTitle({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final fuente = Theme.of(context).textTheme;
    return Container(
      margin:const EdgeInsets.only(top: 20),//separacion
      padding:const EdgeInsets.symmetric(horizontal:20 ),//internamente
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://educacion30.b-cdn.net/wp-content/uploads/2019/02/girasoles-978x652.jpg'),
                height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('titulo',style: fuente.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
               Text('nombre original',style: fuente.subtitle1,overflow: TextOverflow.ellipsis,maxLines: 1,),
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