import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_camau/models/weather_locations.dart';
import 'package:flutter_weather_camau/screens/home_page.dart';
import 'package:flutter_weather_camau/widgets/single_weather.dart';
import 'package:flutter_weather_camau/widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}
  
class _WeatherAppState extends State<WeatherApp> {

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.search,
        //     size: 30,
        //     color: Colors.white,
        //   ),
        // ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Search Clicked'),
              child: SvgPicture.asset(
                'assets/Search.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: tabs[_selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        iconSize: 25,
        //selectedIconTheme: IconThemeData(color: Colors.red, size: 30,),
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title:Text('Home'),
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.description),
              title:Text('Description'),
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.search),
              title:Text('Search'),
            ),
        ],
      ),
      drawer: Drawer(

        child: SafeArea(
          child: Container(
            color: Colors.white70,
            child: Column(
              children: [
                ListTile(
                  hoverColor: Colors.red,
                  leading: Icon(Icons.build),
                  title: Text('Setting', style: TextStyle(fontSize:20)),
                  onTap: (){
                    print("Tapped Setting");
                  }
                ),
                ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email'),
                    onTap: (){
                      print("Tapped Email");
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }




}



