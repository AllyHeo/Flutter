import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Search_Location.dart';

class FineDustAlertList extends StatefulWidget {
  @override
  _FineDustAlertListState createState() => _FineDustAlertListState();
}

class _FineDustAlertListState extends State<FineDustAlertList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('미세먼지 경보 검색')),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Location(),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
