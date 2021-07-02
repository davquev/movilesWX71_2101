import 'package:flutter/material.dart';
import 'package:pj_mymovie_20210628/ui/movie_list.dart';

void main() {
  runApp(MyMovies());
}

class MyMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My movies",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Movielist(),
    );
  }
}
