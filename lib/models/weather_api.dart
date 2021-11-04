
// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);
class Weather{
  dynamic name;
  dynamic country;
  dynamic localtime;
  dynamic temp_c;
  dynamic text;
  dynamic icon;
  dynamic wind;
  dynamic winddegree;
  dynamic humidity;
  dynamic cloud;
  dynamic feellike;
  dynamic uv;
  dynamic co;
  dynamic no2;
  dynamic o3;
  dynamic so2;

  Weather({
    this.name,
    this.country,
    this.localtime,
    this.temp_c,
    this.text,
    this.icon,
    this.wind,
    this.winddegree,
    this.humidity,
    this.cloud,
    this.feellike,
    this.uv,
    this.co,
    this.no2,
    this.o3,
    this.so2,
  });

  Weather.fromJson(Map<String, dynamic>json){
    name = json["location"]["name"];
    country = json["location"]["country"];
    localtime = json["location"]["localtime"];
    temp_c = json["current"]["temp_c"];
    text = json["current"]["condition"]["text"];
    icon = json["current"]["condition"]["icon"];
    wind = json["current"]["wind_kph"];
    winddegree = json["current"]["wind_degree"];
    humidity = json["current"]["humidity"];
    cloud = json["current"]["cloud"];
    feellike = json["current"]["feelslike_c"];
    uv = json["current"]["uv"];
    co = json["current"]["air_quality"]["co"];
    no2 = json["current"]["air_quality"]["no2"];
    o3 = json["current"]["air_quality"]["o3"];
    so2 = json["current"]["air_quality"]["so2"];
  }
}



//=================================================
// // To parse this JSON data, do
// //
// //     final weather = weatherFromJson(jsonString);
//
// import 'dart:convert';
//
// Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
//
// String weatherToJson(Weather data) => json.encode(data.toJson());
//
// class Weather {
//   Weather({
//     required this.status,
//     required this.data,
//   });
//
//   String status;
//   Data data;
//
//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//     status: json["status"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     required this.city,
//     required this.state,
//     required this.country,
//     required this.location,
//     required this.current,
//   });
//
//   String city;
//   String state;
//   String country;
//   Location location;
//   Current current;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     city: json["city"],
//     state: json["state"],
//     country: json["country"],
//     location: Location.fromJson(json["location"]),
//     current: Current.fromJson(json["current"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "city": city,
//     "state": state,
//     "country": country,
//     "location": location.toJson(),
//     "current": current.toJson(),
//   };
// }
//
// class Current {
//   Current({
//     required this.weather,
//     required this.pollution,
//   });
//
//   WeatherClass weather;
//   Pollution pollution;
//
//   factory Current.fromJson(Map<String, dynamic> json) => Current(
//     weather: WeatherClass.fromJson(json["weather"]),
//     pollution: Pollution.fromJson(json["pollution"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "weather": weather.toJson(),
//     "pollution": pollution.toJson(),
//   };
// }
//
// class Pollution {
//   Pollution({
//     required this.ts,
//     required this.aqius,
//     required this.mainus,
//     required this.aqicn,
//     required this.maincn,
//   });
//
//   DateTime ts;
//   int aqius;
//   String mainus;
//   int aqicn;
//   String maincn;
//
//   factory Pollution.fromJson(Map<String, dynamic> json) => Pollution(
//     ts: DateTime.parse(json["ts"]),
//     aqius: json["aqius"],
//     mainus: json["mainus"],
//     aqicn: json["aqicn"],
//     maincn: json["maincn"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "ts": ts.toIso8601String(),
//     "aqius": aqius,
//     "mainus": mainus,
//     "aqicn": aqicn,
//     "maincn": maincn,
//   };
// }
//
// class WeatherClass {
//   WeatherClass({
//     required this.ts,
//     required this.tp,
//     required this.pr,
//     required this.hu,
//     required this.ws,
//     required this.wd,
//     required this.ic,
//   });
//
//   DateTime ts;
//   int tp;
//   int pr;
//   int hu;
//   double ws;
//   int wd;
//   String ic;
//
//   factory WeatherClass.fromJson(Map<String, dynamic> json) => WeatherClass(
//     ts: DateTime.parse(json["ts"]),
//     tp: json["tp"],
//     pr: json["pr"],
//     hu: json["hu"],
//     ws: json["ws"].toDouble(),
//     wd: json["wd"],
//     ic: json["ic"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "ts": ts.toIso8601String(),
//     "tp": tp,
//     "pr": pr,
//     "hu": hu,
//     "ws": ws,
//     "wd": wd,
//     "ic": ic,
//   };
// }
//
// class Location {
//   Location({
//     required this.type,
//     required this.coordinates,
//   });
//
//   String type;
//   List<double> coordinates;
//
//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//     type: json["type"],
//     coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": type,
//     "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
//   };
// }
