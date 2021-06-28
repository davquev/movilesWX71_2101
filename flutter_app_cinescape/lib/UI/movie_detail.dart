import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcinescape/models/movie.dart';
import 'package:flutterappcinescape/utils/db_helper.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;
  MovieDetail(this.movie);

  @override
  _MovieDetailState createState() => _MovieDetailState(movie);
}

class _MovieDetailState extends State<MovieDetail> {
  final Movie movie;
  DbHelper dbHelper;
  String path;

  _MovieDetailState(this.movie);

  @override
  void initState(){
    dbHelper = DbHelper();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              child: Hero(
                tag: 'poster_' + movie.id.toString(),
                child: Image.network('https://image.tmdb.org/t/p/w500'+movie.posterPath,
                height: height / 1.5,)
              ),
            )

          ],),
        ),
      ),
    );
  }
}
