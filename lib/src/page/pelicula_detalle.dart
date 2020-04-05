import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_models.dart';

class PeliculaDetalle  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: new Center(
      child:   new Text(pelicula.title),

      ),
    );
  }
}
