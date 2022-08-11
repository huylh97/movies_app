import 'package:flutter/material.dart';
import 'package:movies_app/data/models/movies/movie.dart';
import 'package:movies_app/utils/util_color.dart';
import 'package:movies_app/utils/util_constants.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final Function onTapFunction;

  const MovieListItem({
    Key? key,
    required this.movie,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: movie.posterPath == null
                      ? Icon(Icons.movie)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: NetworkImage(
                              imagePath + movie.posterPath!,
                            ),
                          ),
                        )),
              const SizedBox(height: 8),
              Text(movie.title ?? ''),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 18),
                  const SizedBox(width: 8),
                  Text(movie.releaseDate ?? ''),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
