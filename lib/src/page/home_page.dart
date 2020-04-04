import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widget/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  PeliculaProvider peliculaProvider = new PeliculaProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("peliculas de cine"),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _swiperTarjetas(),
          ],
        ),
      ),
    );
  }

  _swiperTarjetas() {
    return FutureBuilder(
        future: peliculaProvider.getEncines(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          /// si snatshop tiene datos
          if (snapshot.hasData) {
            return new CardSwiper(peliculas: snapshot.data);
          } else {
            return Container(
              height: 400.0,
                child: Center(
                    child: new CircularProgressIndicator()
                )
            );
          }
        });
  }
}
