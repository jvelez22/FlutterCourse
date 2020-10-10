import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/src/models/characters_model.dart';
import 'package:movies/src/models/pelicula_model.dart';

class MoviesProvider {
  String _apikey = '4543fb4e80c484b01b668b6cfd4f23f6';
  String _url = 'api.themoviedb.org';
  String _language = 'es-MEX';
  int _popularsPage = 0;
  bool isLoading = false;
  List<Movie> _populars = List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;
  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    return await _processResponse(url);
  }

  void getPopular() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    _popularsPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularsPage.toString()
    });

    final response = await _processResponse(url);
    _populars.addAll(response);
    popularsSink(_populars);
    isLoading = false;
  }

  Future<List<Character>> getCast(String movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key': _apikey,
      'language': _language,
    });

    final response = await get(url);
    final decodeData = json.decode(response.body);
    final cast = Cast.fromJsonList(decodeData['cast']);

    return cast.characters;
  }

  Future<List<Movie>> _processResponse(Uri url) async {
    final response = await get(url);
    final decodeData = json.decode(response.body);
    final results = Movies.fromJsonList(decodeData['results']);

    return results.movies;
  }

  void dispose() {
    _popularsStreamController.close();
  }
}
