// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'cubit/movie_details/movie_details_cubit.dart' as _i5;
import 'cubit/movies/movies_cubit.dart' as _i4;
import 'data/repositories/movie_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.MovieRepository>(_i3.MovieRepository());
  gh.singleton<_i4.MoviesCubit>(
      _i4.MoviesCubit(movieRepository: get<_i3.MovieRepository>()));
  gh.lazySingleton<_i5.MovieDetailsCubit>(
      () => _i5.MovieDetailsCubit(movieRepository: get<_i3.MovieRepository>()));
  return get;
}
