import 'package:flutter/material.dart';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';

void main() => runApp(App());

// This widget is the root of your application.
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Talks',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: CoronaPage(),
    );
  }
}
