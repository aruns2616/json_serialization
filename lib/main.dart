import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:json_serialization/screens/home.dart';
import 'package:json_serialization/backend/api.dart';
import 'package:json_serialization/screens/newPost.dart';

void main() {
  runApp(JsonSer());
}

class JsonSer extends StatelessWidget {
  Future futureAlbum;
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
      home: Home(),
    );
  }
}