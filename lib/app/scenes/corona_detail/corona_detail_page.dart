import 'package:flutter/material.dart';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';
import 'package:tech_talks_flutter/app/scenes/corona_detail/index.dart';

class CoronaDetailPage extends StatefulWidget {
  static const String routeName = '/coronaDetail';

  final CoronaModel coronaModel;

  CoronaDetailPage({
    Key key,
    @required this.coronaModel,
  }) : super(key: key);

  @override
  _CoronaDetailPageState createState() => _CoronaDetailPageState();
}

class _CoronaDetailPageState extends State<CoronaDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Corona Detail'),
        ),
        body: Container(
          color: Colors.white,
          child: CoronaDetailScreen(
            coronaModel: widget.coronaModel,
          ),
        ));
  }
}
