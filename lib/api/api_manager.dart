import 'dart:convert';

import 'package:flutter_weather_camau/constants/string.dart';
import 'package:flutter_weather_camau/models/weather_api.dart';
import 'package:http/http.dart' as http;


class GetData{
  Future<Weather> getCurrentWeather(String location) async {
    var urlApi = Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=da1d665b6e0143f39be85704210211&q=$location&days=7&aqi=yes&alerts=no');
    var request = await http.get(urlApi);
    var body = jsonDecode(request.body);

    return Weather.fromJson(body);
  }
}


//======================
// class API_Manager {
//
//   Future<Weather> getWeather() async {
//
//     var client = http.Client();
//     var weatherModel = null;
//
//     try {
//       var response = await client.get(Uri.parse(Strings.weather_url));
//
//       if(response.statusCode == 200) { //Kiểm tra kết nối nếu đúng
//         var jsonString = response.body; //lấy toàn bộ json của api
//
//         var jsonMap = json.decode(jsonString); //Phân rã ra thành dạng json
//
//        weatherModel = Weather.fromJson(jsonMap);
//       }
//     }
//     catch (Exception) {
//       return weatherModel;
//     }
//
//     return weatherModel;
//
//   }
// }