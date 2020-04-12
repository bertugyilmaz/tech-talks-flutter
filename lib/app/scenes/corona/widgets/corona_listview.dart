import 'package:flutter/material.dart';
import 'package:tech_talks_flutter/app/scenes/corona_detail/index.dart';
import '../index.dart';

class CoronaListView extends StatelessWidget {
  final List<CoronaModel> coronaCountries;

  CoronaListView({
    Key key,
    @required this.coronaCountries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coronaCountries.length,
      itemBuilder: (context, index) {
        CoronaModel item = coronaCountries[index];

        return CoronaRow(
          title: item.country,
          description: item.totalDeaths,
          onTap: () {
            this.navigateToDetail(context: context, item: item);
          },
        );
      },
    );
  }

  void navigateToDetail({BuildContext context, CoronaModel item}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return CoronaDetailPage(
          coronaModel: item,
        );
      }),
    );
  }
}
