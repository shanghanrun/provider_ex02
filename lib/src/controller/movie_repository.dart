import 'package:dio/dio.dart';
import 'package:provider_ex02/src/model/movie.dart';

class MovieRepository {
  late var _dio;
  MovieRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org",
        queryParameters: {
          'api_key': '45dfb0ff4a22c1a95d0041615999de56',
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> loadGenre() async {
    var response = await _dio.get('/3/genre/movie/list');
    if (response.data != null) {
      // http는 jsonDecode( .body)로 접근, dio는 .data로 접근한다. fetch는 .json()으로
      var data = response.data['genres'] as List;
      print(data);
      return data.map((genre) => genre as Map<String, dynamic>).toList();
    } else {
      return [];
    }
  }

  Future<List<Movie>> loadMovieListWithGenre(int activeGenreId) async {
    var response = await _dio.get('/3/discover/movie',
        queryParameters: {'with_genres': activeGenreId});
    if (response.data != null && response.data['results'] != null) {
      var data = response.data['results'] as List;
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      return [];
    }
  }
}
