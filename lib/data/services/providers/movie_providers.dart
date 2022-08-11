import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/models/movie_response.dart';
import 'package:movies_app/data/services/api_client.dart';

import '../api_constant.dart';

class MovieProviders {
  ApiClient _client = ApiClient();

  MovieProviders();

  Future<List<Movie>> fetchMovies() async {
    try {
      Response response = await _client.dio.get(
        ApiConstant.GET_NOW_PLAYING_MOVIE,
        queryParameters: {
          "api_key": ApiConstant.API_KEY,
        },
      );
      return MovieResponse.fromJson(response.data).results!;
    } on DioError catch (e) {
      log("fetchMovies : ${e.message}");
      return [];
    }
  }
}
