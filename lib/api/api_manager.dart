import 'dart:convert';

import 'package:flutter_weather_camau/constants/string.dart';
import 'package:flutter_weather_camau/models/weather_api.dart';
import 'package:http/http.dart' as http;





class API_Manager {

  Future<Weather> getWeather() async {

    var client = http.Client();
    var weatherModel = null;

    try {
      var response = await client.get(Uri.parse(Strings.weather_url));

      if(response.statusCode == 200) { //Kiểm tra kết nối nếu đúng
        var jsonString = response.body; //lấy toàn bộ json của api

        var jsonMap = json.decode(jsonString); //Convert thanh kdl map

        weatherModel = Weather.fromJson(jsonMap);
      }
    }
    catch (Exception) {
      return weatherModel;
    }

    return weatherModel;

  }
}