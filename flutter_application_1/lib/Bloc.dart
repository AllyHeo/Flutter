import 'package:flutter_application_1/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class AirBloc {
  final _airSubject = BehaviorSubject<AirResult>();

  Future<AirResult> fetchData() async {
    var response = await http.get(
      Uri.parse(
          'http://api.airvisual.com/v2/nearest_city?key=95056979-70f4-48e0-b41d-ff9af8613029'),
    );

    AirResult result = AirResult.fromJson(json.decode(response.body));

    return result;
  }

  AirBloc() {
    fetch();
  }

  void fetch() async {
    var airResult = await fetchData();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult => _airSubject.stream;
}
