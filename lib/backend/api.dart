import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Society {
  List<Flats> flats;
  List<Payments> payments;

  Society({this.flats, this.payments});

  Society.fromJson(Map<String, dynamic> json) {
    if (json['flats'] != null) {
      flats = new List<Flats>();
      json['flats'].forEach((v) {
        flats.add(new Flats.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = new List<Payments>();
      json['payments'].forEach((v) {
        payments.add(new Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flats != null) {
      data['flats'] = this.flats.map((v) => v.toJson()).toList();
    }
    if (this.payments != null) {
      data['payments'] = this.payments.map((v) => v.toJson()).toList();
    }
    return data;
  }


}

class Flats {
  String flat;
  String owner;

  Flats({this.flat, this.owner});

  Flats.fromJson(Map<String, dynamic> json) {
    flat = json['flat'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flat'] = this.flat;
    data['owner'] = this.owner;
    return data;
  }
}

class Payments {
  String flat;
  String status;

  Payments({this.flat, this.status});

  Payments.fromJson(Map<String, dynamic> json) {
    flat = json['flat'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flat'] = this.flat;
    data['status'] = this.status;
    return data;
  }
}

Future<Society> fetchAlbum() async {

  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  final response = await http.get(
    'https://json-serialization.firebaseio.com/.json',
  );
  if (response.statusCode == 200 ) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final jsonresponse = json.decode(response.body);
    return Society.fromJson(jsonresponse);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album 1');
  }
}

Future<Society> createAlbum(String title) async {
  final http.Response response = await http.post(
    'https://json-serialization.firebaseio.com/.json',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Society.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}