import 'package:get_it/get_it.dart';
import 'package:movies_app/cubit/movie_details/movie_details_cubit.dart';
import 'package:movies_app/cubit/movies/movies_cubit.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';
import 'package:movies_app/data/services/providers/movie_providers.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  getIt.registerSingleton<MoviesCubit>(MoviesCubit(movieRepository: MovieRepository(MovieProviders())));
  getIt.registerLazySingleton<MovieDetailsCubit>(() => MovieDetailsCubit(movieRepository: MovieRepository(MovieProviders())));
}
