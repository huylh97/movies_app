import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:movies_app/cubit/movies/movies_cubit.dart';
import 'package:movies_app/data/models/movies/movie.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';

void main() {
  group('Movies Cubit Testing', () {
    late MoviesCubit moviesCubit;

    setUp(() {
      moviesCubit = MoviesCubit(movieRepository: MovieRepository());
    });

    tearDown(() {
      moviesCubit.close();
    });

    test('Initial State', () {
      expect(moviesCubit.state, MoviesInitial());
    });

    blocTest<MoviesCubit, MoviesState>(
      'Test fetchMovies(): emits MoviesLoaded(movies: movies, page: 1)',
      build: () => moviesCubit,
      act: (cubit) => cubit.fetchMovies(),
      expect: () => [MoviesLoading(), MoviesLoaded(movies: List<Movie>.generate(20, (int index) => Movie(), growable: true), page: 1)],
    );
  });
}
