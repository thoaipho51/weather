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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu clicked!'),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: getBody( ) ,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(
          color: Colors.red,
          size: 30,
        ),
        onTap: (int index){
          onTapHandler(index);
        },
        backgroundColor: Colors.transparent,
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
    );
  }
  Widget getBody( )  {
    if(this._selectedIndex == 0) {
      return HomePage();
    } else if(this._selectedIndex==1) {
      return Container(
        color: Colors.blue
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }
  void onTapHandler( int index) {
    this.setState(() {
      this._selectedIndex = index;
    });
  }
}



