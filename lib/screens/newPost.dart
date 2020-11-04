import 'package:flutter/material.dart';
import 'package:json_serialization/backend/api.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController flatNo = new TextEditingController();
  TextEditingController ownerName = new TextEditingController();

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
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                    right: 10,
                    left: 5,
                  ),
                  child: TextField(
                    controller: ownerName,
                    decoration: InputDecoration(
                      hintText: "Owner",
                      labelText: 'Owner',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                    right: 10,
                    left: 5,
                  ),
                  child: TextField(
                    controller: flatNo,
                    decoration: InputDecoration(
                      hintText: "Flat",
                      labelText: 'Flat',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ],
          ),
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                          elevation: 5,
                          child: Text("Back"),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }),
                      RaisedButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                          elevation: 5,
                          child: Text("ADD"),
                          onPressed: () {
                            setState(() {
                              createAlbum(flatNo, ownerName);
                            });
                          }),
                    ],
                  ),
                ),
              ])

        ],
      ),
    );
  }
}
