import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/api/api_manager.dart';
import 'package:flutter_weather_camau/models/weather_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(AirScreen());

class AirScreen extends StatefulWidget {
  @override
  _AirScreenState createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {

  Weather? _weatherDisplay;
  GetData client = GetData();


  Future<void> getData()async{
    _weatherDisplay = await client.getCurrentWeather("VietNam");
  }


  void onTextFieldSubmitted(String input) {
    //fetchSearch(input);
    //fetchLocation();
    print("$input");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Location')),
      body: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sunny.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                _weatherDisplay!.temp_c.toString() + ' °C',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 60.0),
                              ),
                            ),
                            Center(
                              child: Text(
                                _weatherDisplay!.country.toString(),
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 40.0),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              child: TextField(
                                onSubmitted: (String input) {
                                  onTextFieldSubmitted(input);
                                },
                                style:
                                TextStyle(color: Colors.black38, fontSize: 25),
                                decoration: InputDecoration(
                                  hintText: 'Search another location...',
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 18.0),
                                  prefixIcon:
                                  Icon(Icons.search, color: Colors.black38),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
            }else{
              return CircularProgressIndicator();
            }
          }

        ),
      ),
    );
  }
}
