import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_serialization/backend/api.dart';
import 'package:json_serialization/screens/newPost.dart';

class Home extends StatefulWidget {
  @override
  createState() => AppLayout();
}

class AppLayout extends State<Home> {
  Future futureAlbum;
  int index=0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JSON Serialization",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPost()),
          );
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
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
      body: FutureBuilder(
        future: futureAlbum,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    itemCount: index=snapshot.data.count,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading:
                            Icon(Icons.person_outline, color: Colors.amber),
                        title: Text(snapshot.data.flat[index] +
                            ' ' +
                            snapshot.data.owner[index]),
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
      ),
    );
  }
}
