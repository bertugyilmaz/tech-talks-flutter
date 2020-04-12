import 'package:equatable/equatable.dart';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';

abstract class CoronaState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  CoronaState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  CoronaState getStateCopy();

  CoronaState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}


/// UnInitialized
class UnCoronaState extends CoronaState {

  UnCoronaState(int version) : super(version);

  @override
  String toString() => 'UnCoronaState';

  @override
  UnCoronaState getStateCopy() {
    return UnCoronaState(0);
  }

  @override
  UnCoronaState getNewVersion() {
    return UnCoronaState(version+1);
  }
}

/// Initialized
class InCoronaState extends CoronaState {
  final List<CoronaModel> coronaList;

  InCoronaState(int version, this.coronaList) : super(version, [coronaList]);

  @override
  String toString() => 'InCoronaState $coronaList';

  @override
  InCoronaState getStateCopy() {
    return InCoronaState(this.version, this.coronaList);
  }

  @override
  InCoronaState getNewVersion() {
    return InCoronaState(version+1, this.coronaList);
  }
}

class ErrorCoronaState extends CoronaState {
  final String errorMessage;

  ErrorCoronaState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorCoronaState';

  @override
  ErrorCoronaState getStateCopy() {
    return ErrorCoronaState(this.version, this.errorMessage);
  }

  @override
  ErrorCoronaState getNewVersion() {
    return ErrorCoronaState(version+1, this.errorMessage);
  }
}
