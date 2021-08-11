import 'package:flutter/material.dart';
import 'package:flutter_application_1/airresult.dart';
//import 'package:flutter_application_1/widget_test.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  late AirResult _result;

  Future<AirResult> fetchData() async {
    var response = await http.get(
      Uri.parse(
          'http://api.airvisual.com/v2/nearest_city?key=95056979-70f4-48e0-b41d-ff9af8613029'),
    );

    AirResult result = AirResult.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();

    fetchData().then((airResult) {
      setState(() {
        _result = airResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '현재 위치 미세먼지',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('얼굴사진'),
                          Text(
                            '${_result.data!.current!.pollution!.aqius}',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            '보통',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('이미지'),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                '${_result.data!.current!.weather!.tp}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Text('습도 ${_result.data!.current!.weather!.hu}%'),
                          Text('풍속 ${_result.data!.current!.weather!.ws}m/s'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 50),
                  color: Colors.orange,
                  child: Icon(Icons.refresh, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
