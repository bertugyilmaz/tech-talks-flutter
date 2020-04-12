import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';

class CoronaScreen extends StatefulWidget {
  const CoronaScreen({
    Key key,
    @required CoronaBloc coronaBloc,
  })  : _coronaBloc = coronaBloc,
        super(key: key);

  final CoronaBloc _coronaBloc;

  @override
  CoronaScreenState createState() {
    return CoronaScreenState();
  }
}

class CoronaScreenState extends State<CoronaScreen> {
  CoronaScreenState();

  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoronaBloc, CoronaState>(
        bloc: widget._coronaBloc,
        builder: (
          BuildContext context,
          CoronaState currentState,
        ) {
          if (currentState is UnCoronaState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorCoronaState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: () => this._load(),
                  ),
                ),
              ],
            ));
          }
          if (currentState is InCoronaState) {
            return CoronaListView(
              coronaCountries: currentState.coronaList,
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._coronaBloc.add(LoadCoronaEvent());
  }
}
