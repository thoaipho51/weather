import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_camau/models/weather_locations.dart';
import 'package:flutter_weather_camau/screens/home_page.dart';
import 'package:flutter_weather_camau/screens/tabbar_views/air_home.dart';
import 'package:flutter_weather_camau/screens/tabbar_views/figma_weather.dart';
import 'package:flutter_weather_camau/widgets/sidebar.dart';
import 'package:flutter_weather_camau/widgets/single_weather.dart';
import 'package:flutter_weather_camau/widgets/slider_dot.dart';

import 'search_weather.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}
  
class _WeatherAppState extends State<WeatherApp> {

  //Tham số Animation
  double xOffset =0;
  double yOffset =0;
  bool isDrawerOpen = false;

  int _selectedIndex = 0;

  final tabs = [
    Container(
      child: HomePage(),
    ),
    Container(
      child: Container(
        color: Colors.red
      ),
    ),
    Container(
      child: Container(
          color: Colors.teal
      ),
    )
  ];


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    //   bottomNavigationBar: BottomNavigationBar(
    //     fixedColor: Colors.red,
    //     type: BottomNavigationBarType.fixed,
    //     currentIndex: _selectedIndex,
    //     iconSize: 25,
    //     //selectedIconTheme: IconThemeData(color: Colors.red, size: 30,),
    //     onTap: (index){
    //       setState(() {
    //         _selectedIndex = index;
    //       });
    //     },
    //     items: [
    //         BottomNavigationBarItem(
    //           icon:Icon(Icons.home),
    //           title:Text('Home'),
    //         ),
    //         BottomNavigationBarItem(
    //           icon:Icon(Icons.description),
    //           title:Text('Description'),
    //         ),
    //         BottomNavigationBarItem(
    //           icon:Icon(Icons.search),
    //           title:Text('Search'),
    //         ),
    //     ],
    //   ),
    //
    // );

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
    transform: Matrix4.translationValues(xOffset, yOffset, 0)
    ..scale(isDrawerOpen ? 0.90 : 1.00),
    //..rotateZ(isDrawerOpen ? pi/20 : 0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius:  isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
    ),
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Text(''),
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  if(isDrawerOpen){
                    setState(() {
                      xOffset =0;
                      yOffset = 0;
                      isDrawerOpen = false;
                    });
                  }else{
                    setState(() {
                      xOffset = _size.width -120;
                      yOffset = _size.height/5;
                      isDrawerOpen = true;
                    });
                  }
                },
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>AirScreen()
                      ));
                     // Navigator.push(context,MaterialPageRoute search_weather)
                      //AirScreen()
                    },
                    child: SvgPicture.asset(
                      'assets/Search.svg',
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.wb_sunny_rounded)),
                  Tab(icon: Icon(Icons.map)),

                ],

              ),

            ),
            body: TabBarView(
              children: [
                HomePage(),
                FigmaWeather()
              ],
            ),
          ),
        )
      ),
    );
  }

}



