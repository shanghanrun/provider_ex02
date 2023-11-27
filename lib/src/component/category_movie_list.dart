import 'package:flutter/material.dart';

class CategoryMovieList extends StatelessWidget {
  const CategoryMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text('NEW PLAYING'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(),
          ),
        ],
      ),
    );
  }
}
