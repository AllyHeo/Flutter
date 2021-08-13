import 'package:flutter/material.dart';

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
                    Icon(Icons.favorite, size: 50),
                    SizedBox(width: 10, height: 40),
                    Text(
                      '위치: 남부권 경기',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '단계:  주의보',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '미세먼지농도: 76',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '발령일: 2020-10-28',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '발령시간: 03:00',
                      style: TextStyle(fontSize: 20),
                    ),
                  ])),
        ),
      ),
    );
  }
}
