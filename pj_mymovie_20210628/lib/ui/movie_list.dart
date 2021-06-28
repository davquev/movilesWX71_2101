import 'package:flutter/material.dart';
import 'package:pj_mymovie_20210628/models/movie.dart';
import 'package:pj_mymovie_20210628/util/http_helper.dart';

class Movielist extends StatefulWidget {
  @override
  _MovielistState createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  List movies;
  int moviesCount;

  HttpHelper helper;

  Future initialize() async{
    movies = List();
    movies = await helper.getUpcoming();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState(){
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My movies!!!"),
      ),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
            return MovieRow(movies[index]);
          }),
    );
  }
}

class MovieRow extends StatefulWidget {
  final Movie movie;
  MovieRow(this.movie);

  @override
  _MovieRowState createState() => _MovieRowState(movie);
}

class _MovieRowState extends State<MovieRow> {
  final Movie movie;
  _MovieRowState(this.movie);

  bool favorite;

  @override
  void initState(){
    favorite = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        title: Text(widget.movie.title),
        subtitle: Text(widget.movie.overview),
        trailing: IconButton(
          icon: Icon(Icons.favorite),
          color: favorite ? Colors.red : Colors.black26,
          onPressed: (){
            setState(() {
              favorite = !favorite;
            });
          },
        ),
      ),
    );
  }
}
