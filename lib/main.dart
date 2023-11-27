import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex02/src/app.dart';
import 'package:provider_ex02/src/controller/movie_controller.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MovieController(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Provider example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const App());
  }
}
