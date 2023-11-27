import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex02/src/controller/movie_controller.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late MovieController _movieController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieController = Provider.of<MovieController>(context, listen: false);
  }

  Widget _genreTag(Map<String, dynamic> genre) {
    return GestureDetector(
      onTap: () {
        // _movieController.changeCategory(genre);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Colors.white,
        ),
        child: Text(
          genre['name'],
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Category')),
      body: Column(children: [
        FutureBuilder(
          future: _movieController.loadGenre(),
          // initialData: ,
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(snapshot.data!.length,
                      (index) => _genreTag(snapshot.data![index])),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
      ]),
    );
  }
}
