import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Flats {
  String flat;
  String owner;

  Flats({this.flat, this.owner});

  Flats.fromJson(Map<String, dynamic> json) {
    flat = json['flat'];
    owner = json['owner'];
  }
}


Future<Flats> fetchAlbum() async {

  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  http.Response response = await http.get(
    'https://json-serialization.firebaseio.com/flats/.json',
  );
  if (response.statusCode == 200 ) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final jsonresponse = json.decode(response.body);
    return Flats.fromJson(jsonresponse);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album 1');
  }
}

/*Future<Flats> createAlbum() async {
  final http.Response response = await http.post(
    'https://json-serialization.firebaseio.com/flats/.json',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
               'flat' : 'A101',
               'owner' : 'KK Singh'
             }),

  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Flats.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
*/
