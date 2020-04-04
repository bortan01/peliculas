import 'dart:convert';

import 'package:peliculas/src/models/pelicula_models.dart';
import 'package:http/http.dart' as http;




class PeliculaProvider {
  String _apikey = '58ece4f5ea5201f6dc37d53153377fe5';
  String _url = "api.themoviedb.org";
  String _languaje = "es-ES";

  Future<List<Pelicula>> getEncines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _languaje,
    } );
    http.get(url);
    final respuesta = await http.get(url);
    final decodeData = json.decode(respuesta.body);

   // print(decodeData['results']);
  final peliculas = new Peliculas.fromJsonList(decodeData['results']);
  print(peliculas.items[1].title);
    return peliculas.items ;
  }


  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _languaje,
    } );
    http.get(url);
    final respuesta = await http.get(url);
    final decodeData = json.decode(respuesta.body);

    // print(decodeData['results']);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);
    print(peliculas.items[1].title);
    return peliculas.items ;
  }

}
