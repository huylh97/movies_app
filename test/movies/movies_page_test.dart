import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/cubit/movies/movies_cubit.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';
import 'package:movies_app/injection.dart';
import 'package:movies_app/presentation/pages.dart';

import 'package:integration_test/integration_test.dart';
import 'package:movies_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test moview render 20 movie Card Item after load app', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsNWidgets(1));
    expect(find.byType(Card), findsNWidgets(20));
  });
}
