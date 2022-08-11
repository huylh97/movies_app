import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/services/providers/movie_providers.dart';

class MovieRepository {
  final MovieProviders providers;

  MovieRepository(this.providers);

  Future<List<Movie>> fetchMovies() async {
    return await providers.fetchMovies();
  }
}
