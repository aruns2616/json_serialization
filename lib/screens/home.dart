import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_serialization/backend/api.dart';

class Home extends StatefulWidget {
  @override
  createState() => AppLayout();
}

class AppLayout extends State<Home> {
  Future futureAlbum;
  Future futureAlbum2;

  @override
  void initState() {
    super.initState();
    setUpTimedFetch();
  }

  setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 5000), (timer) {
      setState(() {
        futureAlbum = fetchAlbum();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureAlbum,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          int index=4;
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  itemCount: index,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person_outline, color: Colors.amber),
                      title: Text(snapshot.data.flat[index]+' '+ snapshot.data.owner[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}