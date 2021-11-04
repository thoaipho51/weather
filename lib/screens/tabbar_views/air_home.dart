
import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/widgets/widgets_tabbar/current_weather.dart';
import 'package:flutter_weather_camau/widgets/widgets_tabbar/additional_infomation.dart';

class AirHome extends StatefulWidget {
  const AirHome({Key? key}) : super(key: key);

  @override
  _AirHomeState createState() => _AirHomeState();
}

class _AirHomeState extends State<AirHome> {

  // OpenWeatherApi client = OpenWeatherApi();
  // Weather? weatherDisplay;
  //
  // Future<void> getData()async{
  //   weatherDisplay = await client.getCurrentWeather("Hanoi");
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Image.asset(
              'assets/night.jpg',
              fit: BoxFit.cover,
              height:double.infinity,
              width: double.infinity,

            ),
            Container(decoration: BoxDecoration(color: Colors.black38),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, "20", "Cà Mau"),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  "Thông Tin Thời Tiết",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:  Colors.white,
                  ),
                ),
                Divider(color: Colors.white,),
                SizedBox(
                  height: 20.0,
                ),
                // Thông tin thời tiết
                additionalInfomation("24", "2", "1013", "24,6"),
                SizedBox(height: 60.0),
                Container(
                  width: 1000,
                  child: TextField(
                    onSubmitted: (String input){
                      print("${input}");
                    },
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Điền thành phố tìm kiếm...',
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),
                      prefixIcon:
                      Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ]
      );
  }
}

