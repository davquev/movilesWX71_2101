class Movie {
  int id;
  String overview;
  String posterPath;
  String title;

  Movie({this.id, this.overview, this.posterPath, this.title});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    return data;
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'title': title,
    };
  }
}
