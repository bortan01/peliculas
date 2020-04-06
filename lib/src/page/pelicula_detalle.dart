import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_models.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: CustomScrollView(
          slivers: <Widget>[
            _crearAppbar(pelicula),
            new SliverList(
                delegate: new SliverChildListDelegate([
              new SizedBox(
                height: 10.0,
              ),
              _posterTitulo(pelicula, context),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
            ]))
          ],
        ));
  }

  Widget _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),

        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroudImage()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(microseconds: 150000),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _posterTitulo(Pelicula pelicula, BuildContext context) {
    print(pelicula.originalTitle);
    return new Container(

      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            child: new Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150,
            ),
            borderRadius: new BorderRadius.circular(20.0),
          ),
          new SizedBox(
            width: 20.0,
          ),
          new Flexible(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                pelicula.title,
                style: Theme.of(context).textTheme.title,
                overflow:
                    TextOverflow.ellipsis, //por si el titulo es muy grande
              ),
              new Text(pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subtitle,
                  overflow: TextOverflow.ellipsis),
              new Row(
                children: <Widget>[
                  new Icon(Icons.star_border),
                  new Text(
                    pelicula.voteAverage.toString(),
                    style: Theme.of(context).textTheme.title,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  _descripcion(Pelicula pelicula) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: new Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
