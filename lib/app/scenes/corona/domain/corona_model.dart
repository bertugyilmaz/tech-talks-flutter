import 'package:equatable/equatable.dart';

class CoronaResponse {
  final bool status;
  final List<CoronaModel> data;

  CoronaResponse(this.status, this.data);

  @override
  List<Object> get props => [
      this.status,
      this.data,
      ];

  factory CoronaResponse.fromJson(Map<String, dynamic> json) {
    return CoronaResponse(
      json['success'],
      json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = this.status;
    data['result'] = this.data.toString();
    return data;
  }
}

class CoronaModel extends Equatable {
  final String country;
  final String totalCases;
  final String newCases;
  final String totalDeaths;
  final String newDeaths;
  final String totalRecovered;
  final String activeCases;

  CoronaModel(
    this.country,
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
  );

  @override
  List<Object> get props => [
        country,
        totalCases,
        newCases,
        totalDeaths,
        newDeaths,
        totalRecovered,
        activeCases
      ];

  factory CoronaModel.fromJson(Map<String, dynamic> json) {
    return CoronaModel(
      json['country'],
      json['totalCases'],
      json['newCases'],
      json['totalDeaths'],
      json['newDeaths'],
      json['totalRecovered'],
      json['activeCases'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['country'] = this.country;
    data['totalCases'] = this.totalCases;
    data['newCases'] = this.newCases;
    data['totalDeaths'] = this.totalDeaths;
    data['newDeaths'] = this.newDeaths;
    data['totalRecovered'] = this.totalRecovered;
    data['activeCases'] = this.activeCases;

    return data;
  }
}
