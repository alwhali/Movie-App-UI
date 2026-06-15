import 'package:flutter/material.dart';
import 'package:movie_app_ui/data/movie.dart';
import 'package:movie_app_ui/screens/details_screen.dart';
import 'package:movie_app_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MovieModel movieModel = popularImages[0];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      title: "Movie App",
    );
  }
}
