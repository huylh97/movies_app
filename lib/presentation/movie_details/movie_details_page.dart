import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movie_details/movie_details_cubit.dart';
import 'package:movies_app/data/models/movies/movie.dart';
import 'package:movies_app/injection.dart';
import 'package:movies_app/utils/util_color.dart';
import 'package:movies_app/utils/util_constants.dart';
import 'package:movies_app/utils/util_text.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MovieDetailsCubit cubit = getIt.get<MovieDetailsCubit>();

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    await cubit.fetchMovieDetail(widget.movie.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.movie.title.toString())),
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(builder: (context, state) {
          if (state is! MovieDetailsLoaded)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildHeader(state),
                  Divider(height: 1.0, color: UtilColor.colorWhite),
                  _buildOverview(context, state),
                  Divider(height: 1.0, color: UtilColor.colorWhite),
                  _buildDescription(context, state),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Column _buildDescription(BuildContext context, state) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Description",
              style: UtilText.textStyle20,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              state.movieDetails?.overview ?? "",
              style: UtilText.textStyle16,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildOverview(BuildContext context, state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Overview",
            style: UtilText.textStyle20,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('IMDb RATING', style: UtilText.textStyle16),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    const SizedBox(width: 8),
                    Text("${state.movieDetails?.voteAverage}/10"),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text('VOTE COUNT', style: UtilText.textStyle16),
                const SizedBox(height: 3),
                Text("${state.movieDetails?.voteCount}"),
              ],
            ),
            Column(
              children: [
                Text('POPULARITY', style: UtilText.textStyle16),
                const SizedBox(height: 3),
                Text("${state.movieDetails?.popularity}"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Column _buildHeader(state) {
    return Column(
      children: [
        Container(
          width: 180.0,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              child: state.movieDetails?.posterPath == null
                  ? Icon(Icons.movie)
                  : Image.network(
                      imagePath + state.movieDetails!.posterPath!,
                      fit: BoxFit.fitWidth,
                    ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(state.movieDetails?.title ?? "", style: UtilText.textStyle18No),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text("${state.movieDetails?.releaseDate}", style: UtilText.textStyle16),
        ),
        Container(
          height: 70,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movieDetails?.genres?.length ?? 0,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
                    elevation: 20,
                    padding: EdgeInsets.all(8),
                    backgroundColor: UtilColor.black300,
                    shadowColor: Colors.black,
                    label: Text(
                      state.movieDetails?.genres?[index]['name'],
                      style: TextStyle(fontSize: 16),
                    ), //Text
                  ),
                );
              }),
        ),
      ],
    );
  }
}
