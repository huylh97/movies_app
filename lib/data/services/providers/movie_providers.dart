import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/data/models/movies/movie.dart';
import 'package:movies_app/data/models/movies/movie_details.dart';
import 'package:movies_app/data/models/movies/movie_response.dart';
import 'package:movies_app/data/services/api_client.dart';

import '../api_constant.dart';

class MovieProviders {
  static final MovieProviders movieProvider = MovieProviders._internal();

  factory MovieProviders() {
    return movieProvider;
  }

  MovieProviders._internal();

  static ApiClient _client = ApiClient();

  static Future<List<Movie>> fetchMovies({int? page}) async {
    try {
      Response response = await _client.dio.get(
        ApiConstant.GET_NOW_PLAYING_MOVIE,
        queryParameters: {
          "api_key": ApiConstant.API_KEY,
          "page": page ?? 1,
        },
      );
      return MovieResponse.fromJson(response.data).results!;
    } on DioError catch (e) {
      log("fetchMovies : ${e.message}");
      return [];
    }
  }

  static Future<MovieDetails?> fetchMovieDetails(int movieId) async {
    try {
      Response response = await _client.dio.get(
        ApiConstant.GET_MOVIE_DETAILS + '/' + movieId.toString(),
        queryParameters: {
          "api_key": ApiConstant.API_KEY,
        },
      );
      print(response.data);
      return MovieDetails.fromJson(response.data);
    } on DioError catch (e) {
      log("fetchMovies : ${e.message}");
      return null;
    }
  }
}
