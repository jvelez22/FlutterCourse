import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/src/models/pelicula_model.dart';

class MoviesProvider {
  String _apikey = '4543fb4e80c484b01b668b6cfd4f23f6';
  String _url = 'api.themoviedb.org';
  String _language = 'es-MEX';

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final response = await get(url);
    final decodeData = json.decode(response.body);
    final results = Movies.fromJsonList(decodeData['results']);

    return results.movies;
  }
}
