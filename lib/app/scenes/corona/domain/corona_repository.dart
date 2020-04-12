import 'dart:convert';
import 'dart:io';
import 'package:tech_talks_flutter/app/scenes/corona/index.dart';
import 'package:http/http.dart' as http;
import 'package:tech_talks_flutter/app/utilities/constant.dart';

class CoronaRepository {

  Future<List<CoronaModel>> getAllCountriesData() async {
    final String path = "/countriesData";
    final String url = Constants.coronaBaseURL + path;
    final Map<String,String> headers = {HttpHeaders.contentTypeHeader: "application/json", 
                                        HttpHeaders.authorizationHeader: Constants.apiKey};

    var response = await http.get(url, headers: headers);

    final data = jsonDecode(response.body);
    final result = data["result"] as List;
    final coronaList = result.map<CoronaModel>((value) => CoronaModel.fromJson(value)).toList();
    // return coronaList;
    return coronaList.where((value) => value.country != "Total:" ).toList();
  }
}