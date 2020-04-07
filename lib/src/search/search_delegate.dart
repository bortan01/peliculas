import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculas = ['spiderman', 'batman', 'golden boy', 'lala', 'luffy', 'zorro'];
  final peliculasRecientes =[
    'spiderman','capitan america '
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: las acciones de nuestro appBar
    return [
      new IconButton(
          icon: new Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: icono a la izquierda del appBar
    return new IconButton(
        icon: new AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
         // print("cargando icono prerss");
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: crea los resultados que vamos a mostrar
    return new Center(
      child: new Container(
        height:  100.0,
        color: Colors.orange,
        child: new Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: son las sugerencias que aparecen cuando las personas escriben

    final listaSugerida = (query.isEmpty)?
    peliculasRecientes : peliculas.where((p){
      return p.toLowerCase().startsWith(query.toLowerCase());
    }).toList();

    return new ListView.builder(
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.movie),
            title: new Text(listaSugerida[index]),
            onTap: (){
              seleccion =listaSugerida[index];
              showResults(context);
            },
          );
        },
        itemCount: listaSugerida.length,


    );
  }
}
