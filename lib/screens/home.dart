import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_serialization/backend/api.dart';

class Home extends StatefulWidget {
  @override
  createState() => AppLayout();
}

class AppLayout extends State<Home> {
  Future futureAlbum;

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
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person_outline, color: Colors.amber),
                      title: Text(snapshot.data.flats[index].flat + snapshot.data.flats[index].owner),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        leading: Icon(Icons.satellite,
                            color: Colors.lightGreenAccent),
                        title: Text(snapshot.data.payments[index].flat),
                      );
                    }),
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