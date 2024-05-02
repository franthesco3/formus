// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String imagePath;
  final double voteAverage;
  // final String backgroung;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.imagePath,
    required this.voteAverage,
    // required this.backgroung,
  });

  Movie.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        overview = map['overview'],
        imagePath = map['poster_path'],
        // backgroung = map['backdrop_path'],
        voteAverage = map['vote_average'].toDouble();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'imagePath': imagePath,
      'voteAverage': voteAverage,
    };
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
