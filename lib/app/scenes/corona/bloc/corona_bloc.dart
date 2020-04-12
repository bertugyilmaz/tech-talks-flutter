import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState> {
  
  @override
  Future<void> close() async{
    await super.close();
  }

  @override
  CoronaState get initialState => UnCoronaState(0);

  @override
  Stream<CoronaState> mapEventToState(
    CoronaEvent event,
  ) async* {
    try {
      yield* await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'CoronaBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
