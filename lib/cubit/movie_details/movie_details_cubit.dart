import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movies/movie_details.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';

part 'movie_details_state.dart';

@lazySingleton
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieRepository movieRepository;

  MovieDetailsCubit({required this.movieRepository}) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetail(int movieId) async {
    print('dfadfadf');
    emit(MovieDetailsLoading());
    final movieDetails = await movieRepository.fetchMovieDetail(movieId);
    emit(MovieDetailsLoaded(movieDetails: movieDetails));
  }
}
