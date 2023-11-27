import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex02/src/controller/movie_controller.dart';
import 'package:provider_ex02/src/model/movie.dart';

class CategoryMovieList extends StatefulWidget {
  const CategoryMovieList({super.key});

  @override
  State<CategoryMovieList> createState() => _CategoryMovieListState();
}

class _CategoryMovieListState extends State<CategoryMovieList> {
  @override
  Widget build(BuildContext context) {
    var movieController = Provider.of<MovieController>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('NEW PLAYING'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(movieController.movies.length,
                  (index) => _movieWidget(movieController.movies[index])),
            ),
          ),
        ],
      ),
    );
  }

  Widget _movieWidget(Movie movie) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(right: 10),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(movie.posterUrl)),
          const SizedBox(height: 10),
          Text(
            movie.title!,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            movie.voteAverage!.toString(),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
