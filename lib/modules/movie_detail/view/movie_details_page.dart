import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movies/movie.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';
import 'package:movies_app/data/services/providers/movie_providers.dart';
import 'package:movies_app/modules/movie_detail/cubit/movie_details_cubit.dart';
import 'package:movies_app/modules/movie_detail/view/movie_details_view.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit(movieRepository: MovieRepository(MovieProviders())),
      child: MovieDetailsView(movie: movie),
    );
  }
}
