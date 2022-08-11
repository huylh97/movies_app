class Movie {
  int? id;
  String? posterPath;
  String? releaseDate;
  String? title;

  Movie({
    this.id,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    return map;
  }
}
