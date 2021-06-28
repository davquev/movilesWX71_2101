import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcinescape/utils/db_helper.dart';
import 'package:flutterappcinescape/utils/http_helper.dart';
import 'package:flutterappcinescape/models/movie.dart';
import 'package:flutterappcinescape/UI/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> movies;
  int moviesCount;
  int page = 1;
  bool loading = true;
  HttpHelper helper;
  ScrollController _scrollController;

  Future initialize() async{
    movies = List<Movie>();
    loadMore();
    initScrollController();
  }

  @override
  void initState(){
    super.initState();
    helper = HttpHelper();
    initialize();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Moviesss'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index){
          return MovieRow(movies[index]);
        },
      ),
    );
  }

  void loadMore() {
    helper.getUpcoming(page.toString()).then((value) {
      movies += value;
      setState(() {
        moviesCount = movies.length;
        movies = movies;
        page++;
      });

      if(movies.length % 20 > 0){
        loading = false;
      }
    });
  }

  void initScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if ((_scrollController.position.pixels ==
      _scrollController.position.maxScrollExtent) &&
      loading){
        loadMore();
      }
    });
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
  DbHelper dbHelper;
  //String path;

  @override
  void initState(){
    favorite = false;
    dbHelper = DbHelper();
    isFavorite(movie);
    super.initState();
  }

  @override
  void setState(fn){
    if (mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: Hero(
          tag: 'poster_'+widget.movie.id.toString(),
          child: Image.network('https://image.tmdb.org/t/p/w500'+movie.posterPath),
        ),
        title: Text(widget.movie.title),
        subtitle: Text(widget.movie.overview),
        onTap: (){
          Navigator.push(
              context,
          MaterialPageRoute(
            builder: (BuildContext context) => MovieDetail(widget.movie)
          ),
          ).then((value) {
            isFavorite(movie);
          });
        },
        trailing: IconButton(
          icon: Icon(Icons.favorite),
          color: favorite ? Colors.red : Colors.grey,
          onPressed: (){
            favorite ? dbHelper.deleteMovie(movie) : dbHelper.insertMovie(movie);
            setState(() {
              favorite = !favorite;
              movie.isFavorite = favorite;
            });
          },
        ),
      ),
    );
  }

  Future isFavorite(Movie movie) async {
    await dbHelper.openDb();
    favorite = await dbHelper.isFavorite(movie);
    setState(() {
      movie.isFavorite = favorite;
    });
  }
}

