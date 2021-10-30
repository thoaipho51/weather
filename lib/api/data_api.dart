

import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/models/weather_api.dart';

import 'api_manager.dart';

late Future<Weather> _weatherDisplay;

var _country = null;


class Data extends StatefulWidget {




  const Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {

  @override
  void initState() {
    _weatherDisplay = API_Manager().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Weather>(
          future: _weatherDisplay,
          builder: (BuildContext context, AsyncSnapshot<Weather> snapshot)
          {
              if(snapshot.hasData){
                return Container(

                );
              }
              else
                return Center(child: CircularProgressIndicator());
          }
      )
    );
  }
}
