import 'package:flutter/material.dart';
import 'package:provider_ex02/src/model/movie.dart';
import 'movie_repository.dart';

class MovieController extends ChangeNotifier {
  final _movieRepository = MovieRepository();
  var activeGenreId = -1;
  var movies = <Movie>[];

  Future<List<Map<String, dynamic>>> loadGenre() async {
    var genreList = await _movieRepository.loadGenre();
    if (genreList.isNotEmpty) {
      activeGenreId = genreList.first['id'].toInt();
      _loadMovieListWithGenre();
    }
    return genreList;
  }

  void _loadMovieListWithGenre() async {
    movies = await _movieRepository.loadMovieListWithGenre(activeGenreId);
    print(movies);
    notifyListeners();
  }
}
