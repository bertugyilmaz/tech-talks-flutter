import 'package:flutter/material.dart';

class CoronaRow extends StatelessWidget {
  final String title;
  final String description;
  final GestureTapCallback onTap;

  CoronaRow({
    Key key,
    @required this.title,
    @required this.description,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.isEmpty ? "-" : title),
      subtitle: Text(description),
      onTap: this.onTap,
    );
  }
}
