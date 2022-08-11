part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie>? movies;
  final int? page;

  MoviesLoaded({required this.movies, required this.page});
}

class MoviesLoading extends MoviesState {}
