part of 'movies_cubit.dart';

@immutable
abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<dynamic> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie>? movies;
  final int? page;

  MoviesLoaded({required this.movies, required this.page});

  @override
  List<dynamic> get props => [movies, page];
}

class MoviesLoading extends MoviesState {}
