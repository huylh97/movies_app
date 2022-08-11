import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movies/movie.dart';
import 'package:movies_app/data/models/movies/movie_details.dart';
import 'package:movies_app/data/services/providers/movie_providers.dart';

@singleton
class MovieRepository {
  MovieRepository();

  Future<List<Movie>> fetchMovies({int? page}) async {
    return await MovieProviders.fetchMovies(page: page);
  }

  Future<MovieDetails?> fetchMovieDetail(int movieId) async {
    return await MovieProviders.fetchMovieDetails(movieId);
  }
}
