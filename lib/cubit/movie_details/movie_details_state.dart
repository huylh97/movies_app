part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails? movieDetails;

  MovieDetailsLoaded({required this.movieDetails});
}

class MovieDetailsLoading extends MovieDetailsState {}
