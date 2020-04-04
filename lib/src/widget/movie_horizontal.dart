import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_models.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});
  @override
  Widget build(BuildContext context) {
    final _scrimSize = MediaQuery.of(context).size;
    return Container(
      height: _scrimSize.height * 0.33,
      child: new PageView(
        pageSnapping: false,
        controller: new PageController(initialPage: 1, viewportFraction: 0.3),
        children: _tarjetas(),
      ),
    );
  }

  List<Widget> _tarjetas() {
    return peliculas.map((peli) {
      //  return Container
      return new Container(
        color: Colors.red,
        margin: const EdgeInsets.only(right: 15.0),
        child: new Column(
          children: <Widget>[
            ClipRRect(
              child: new FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 200.0,
                  image: NetworkImage(
                    peli.getPosterImg(),
                  )),
              borderRadius: BorderRadius.circular(20.0),
            ),
            new Text(
              peli.title,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
    }).toList();
  }
}
