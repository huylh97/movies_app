import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MovieRepository movieRepository;

  MoviesCubit({required this.movieRepository}) : super(MoviesInitial());

  Future<void> fetchMovies() async {
    emit(MoviesLoading());
    final movies = await movieRepository.fetchMovies(page: 1);
    emit(MoviesLoaded(movies: movies, page: 1));
  }

  Future<void> loadMore() async {
    print((state as MoviesLoaded).page!);
    final movies = await movieRepository.fetchMovies(page: (state as MoviesLoaded).page! + 1);
    if (movies.isNotEmpty) {
      emit(MoviesLoaded(movies: (state as MoviesLoaded).movies! + movies, page: (state as MoviesLoaded).page! + 1));
    }
    print((state as MoviesLoaded).page!);
  }
}
