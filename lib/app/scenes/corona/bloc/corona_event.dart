import 'dart:async';
import 'dart:developer' as developer;

import 'package:tech_talks_flutter/app/scenes/corona/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CoronaEvent {
  Stream<CoronaState> applyAsync(
      {CoronaState currentState, CoronaBloc bloc});
  final CoronaRepository _coronaRepository = CoronaRepository();
}

class UnCoronaEvent extends CoronaEvent {
  @override
  Stream<CoronaState> applyAsync({CoronaState currentState, CoronaBloc bloc}) async* {
    yield UnCoronaState(0);
  }
}

class LoadCoronaEvent extends CoronaEvent {
   
  @override
  String toString() => 'LoadCoronaEvent';

  LoadCoronaEvent();

  @override
  Stream<CoronaState> applyAsync(
      {CoronaState currentState, CoronaBloc bloc}) async* {
    try {

      yield UnCoronaState(0);
      await Future.delayed(Duration(seconds: 1));

      var countriesData = await this._coronaRepository.getAllCountriesData();

      yield InCoronaState(0, countriesData);

    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadCoronaEvent', error: _, stackTrace: stackTrace);
      yield ErrorCoronaState(0, _?.toString());
    }
  }
}
