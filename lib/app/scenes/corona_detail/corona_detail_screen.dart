import 'package:flutter/material.dart';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';

class CoronaDetailScreen extends StatelessWidget {
  final CoronaModel coronaModel;

  CoronaDetailScreen({
    Key key,
    @required this.coronaModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = this.coronaModel;

    return Column(
      children: <Widget>[
        this._getRowWidget(label: "New cases", value: data.newCases),
        this._getRowWidget(label: "New death", value: data.newDeaths),
        this._getRowWidget(label: "Total cases", value: data.totalCases),
        this._getRowWidget(label: "Total Death", value: data.totalDeaths),
        this._getRowWidget(label: "Total Recovered", value: data.totalRecovered),
      ],
    );
  }

  Widget _getRowWidget({String label, String value}) {
    return Padding(
      padding: EdgeInsets.all(16
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$label : ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(value.isEmpty ? "-" : value),
        ],
      ),
    );
  }
}
