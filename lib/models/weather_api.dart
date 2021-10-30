// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.city,
    required this.state,
    required this.country,
    required this.location,
    required this.current,
  });

  String city;
  String state;
  String country;
  Location location;
  Current current;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    city: json["city"],
    state: json["state"],
    country: json["country"],
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "country": country,
    "location": location.toJson(),
    "current": current.toJson(),
  };
}

class Current {
  Current({
    required this.weather,
    required this.pollution,
  });

  WeatherClass weather;
  Pollution pollution;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    weather: WeatherClass.fromJson(json["weather"]),
    pollution: Pollution.fromJson(json["pollution"]),
  );

  Map<String, dynamic> toJson() => {
    "weather": weather.toJson(),
    "pollution": pollution.toJson(),
  };
}

class Pollution {
  Pollution({
    required this.ts,
    required this.aqius,
    required this.mainus,
    required this.aqicn,
    required this.maincn,
  });

  DateTime ts;
  int aqius;
  String mainus;
  int aqicn;
  String maincn;

  factory Pollution.fromJson(Map<String, dynamic> json) => Pollution(
    ts: DateTime.parse(json["ts"]),
    aqius: json["aqius"],
    mainus: json["mainus"],
    aqicn: json["aqicn"],
    maincn: json["maincn"],
  );

  Map<String, dynamic> toJson() => {
    "ts": ts.toIso8601String(),
    "aqius": aqius,
    "mainus": mainus,
    "aqicn": aqicn,
    "maincn": maincn,
  };
}

class WeatherClass {
  WeatherClass({
    required this.ts,
    required this.tp,
    required this.pr,
    required this.hu,
    required this.ws,
    required this.wd,
    required this.ic,
  });

  DateTime ts;
  int tp;
  int pr;
  int hu;
  double ws;
  int wd;
  String ic;

  factory WeatherClass.fromJson(Map<String, dynamic> json) => WeatherClass(
    ts: DateTime.parse(json["ts"]),
    tp: json["tp"],
    pr: json["pr"],
    hu: json["hu"],
    ws: json["ws"].toDouble(),
    wd: json["wd"],
    ic: json["ic"],
  );

  Map<String, dynamic> toJson() => {
    "ts": ts.toIso8601String(),
    "tp": tp,
    "pr": pr,
    "hu": hu,
    "ws": ws,
    "wd": wd,
    "ic": ic,
  };
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}
