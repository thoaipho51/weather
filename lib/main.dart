import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/screens/weather_app.dart';
import 'package:flutter_weather_camau/widgets/homepage_animation.dart';
import 'package:flutter_weather_camau/widgets/sidebar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: Stack(
          children: [
            SideBar(),
            WeatherApp()
        ],
      ),
    ));
  }
}
