import 'package:flutter/material.dart';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';

class CoronaPage extends StatefulWidget {
  static const String routeName = '/corona';

  @override
  _CoronaPageState createState() => _CoronaPageState();
}

class _CoronaPageState extends State<CoronaPage> {
  final _coronaBloc = CoronaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corona'),
      ),
      body: CoronaScreen(coronaBloc: _coronaBloc),
    );
  }
}
