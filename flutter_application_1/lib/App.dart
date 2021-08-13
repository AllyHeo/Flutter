import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Text(
          '미세먼지 경보발령안내',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 10,
          child: Container(
              width: 350,
              height: 600,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite, size: 100, color: getColor(_result)),
                    SizedBox(width: 10, height: 40),
                    Text(
                      ' 국가: ${_result.data!.country}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '지역:${_result.data!.state}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '도시: ${_result.data!.city}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      getString(_result),
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '미세먼지농도: ${_result.data!.current!.pollution!.aqius} ㎍/m³',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '측정시각: ${_result.data!.current!.pollution!.ts}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ])),
        ),
      ),
    );
  }
}

String getString(AirResult _result) {
  if (_result.data!.current!.pollution!.aqius! <= 50) {
    return "수치: 좋음";
  } else if (_result.data!.current!.pollution!.aqius! <= 100) {
    return "수치: 보통";
  } else if (_result.data!.current!.pollution!.aqius! <= 150) {
    return "수치: 나쁨";
  } else {
    return "수치: 매우나쁨";
  }
}

Color getColor(AirResult _result) {
  if (_result.data!.current!.pollution!.aqius! <= 50) {
    return Colors.greenAccent;
  } else if (_result.data!.current!.pollution!.aqius! <= 100) {
    return Colors.yellow;
  } else if (_result.data!.current!.pollution!.aqius! <= 150) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
