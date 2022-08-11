import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';
import 'package:movies_app/data/services/providers/movie_providers.dart';
import 'package:movies_app/modules/movies/cubit/movies_cubit.dart';

import 'movies_view.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoviesCubit(movieRepository: MovieRepository(MovieProviders())),
      child: const MoviesView(),
    );
  }
}
