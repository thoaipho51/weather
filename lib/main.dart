import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/screens/search.dart';
import 'package:flutter_weather_camau/screens/weather_app.dart';
import 'package:flutter_weather_camau/widgets/sidebar.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: AnimatedSplashScreen(
            splash: Image.network(
              'https://uxwing.com/wp-content/themes/uxwing/download/27-weather/weather.png',
              width:1000,
            ),
            nextScreen: Stack(
              children: [
                SideBar(),
                //WeatherApp(),
                SearchScreen()
              ],
            ),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.blue
          )
    ));
  }
}
