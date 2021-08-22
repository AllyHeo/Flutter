import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Map.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.room),
            title: Text('지도'),
            trailing: Icon(Icons.navigate_next),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoogleMapScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text('예정'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text('예정'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
