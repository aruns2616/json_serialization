import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:json_serialization/screens/home.dart';

void main() {
  runApp(JsonSer());
}

class JsonSer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: "JSON Serialization",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "JSON Serialization",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Text(
                  "JSON Serialization",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Developer information'),
                onTap: () {
                  //launchURL();
                },
              ),
            ],
          ),
        ),
        body: Home(),
      ),
    );
  }
}