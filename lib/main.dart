import 'package:flutter/material.dart';
import 'package:flutterappmovieslist/movies_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(primary: Colors.green),
      //   ),
      // ),
      initialRoute: MoviesListPage.id,
      routes: {MoviesListPage.id: (context) => MoviesListPage()},
    );
  }
}
