import 'package:flutter/material.dart';


class WeatherLocation {
  final String city;
  final String dateTime;
  final String temperature;
  final String weatherType;
  final String iconUrl;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temperature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
  });
}

final locationList = [
  WeatherLocation(
      city: "TP.Hồ Chí Minh",
      dateTime: '08:00 PM - Friday, 22 Oct 2021',
      temperature: '16\u2103',
      weatherType: 'Night',
      iconUrl: 'assets/moon.svg',
      wind: 10,
      rain: 2,
      humidity: 10),
  WeatherLocation(
      city: 'Ca Mau',
      dateTime: '08:00 PM - Friday, 22 Oct 2021',
      temperature: '24\u2103',
      weatherType: 'Cloud',
      iconUrl: 'assets/cloudy.svg',
      wind: 15,
      rain: 88,
      humidity: 10),
  WeatherLocation(
      city: 'New York',
      dateTime: '06:00 AM - Thusday, 21 Oct 2021',
      temperature: '5\u2103',
      weatherType: 'Rain',
      iconUrl: 'assets/rain.svg',
      wind: 8,
      rain: 1,
      humidity: 9),
  WeatherLocation(
      city: 'London',
      dateTime: '01:00 PM - Friday, 22 Oct 2021',
      temperature: '-2\u2103',
      weatherType: 'Sunny',
      iconUrl: 'assets/sun.svg',
      wind: 5,
      rain: 13,
      humidity: 26),
];

