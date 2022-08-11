import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movies_app/modules/movies/cubit/movies_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/movie_list_item.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  _MoviesViewState createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  late final MoviesCubit cubit;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    cubit = BlocProvider.of<MoviesCubit>(context);
    cubit.fetchMovies();
    super.initState();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    await cubit.fetchMovies();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    await cubit.loadMore();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Now Playing Movies')),
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: BlocBuilder<MoviesCubit, MoviesState>(builder: (BuildContext context, MoviesState state) {
          if (state is! MoviesLoaded)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          return state.movies == null || state.movies!.isEmpty
              ? Center(child: Container(child: Text("Data is empty!")))
              : SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    children: state.movies!
                        .map((movie) => MovieListItem(
                              movie: movie,
                              onTapFunction: () {},
                            ))
                        .toList(),
                  ),
                );
        }),
      ),
    );
  }
}
