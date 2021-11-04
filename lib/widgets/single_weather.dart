import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/api/api_manager.dart';
import 'package:flutter_weather_camau/models/weather_api.dart';
import 'package:flutter_weather_camau/models/weather_locations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleWeather extends StatefulWidget {

  final int index;
  SingleWeather(this.index);

  @override
  State<SingleWeather> createState() => _SingleWeatherState();
}

class _SingleWeatherState extends State<SingleWeather> {

String _location = 'Brazil';

Weather? _weatherDisplay;
GetData client = GetData();


Future<void> getData()async{
  _weatherDisplay = await client.getCurrentWeather(_location);
}


  @override
  Widget build(BuildContext context) {
    if(widget.index == 0){
      _location ='Ca-mau';
    }else if(widget.index == 1){
      _location ='Ha-noi';
    }
    else if(widget.index == 2){
      _location ='Bac-lieu';
    }else if(widget.index == 3){
      _location ='Ho-chi-minh';
    }

    return Container(
      child: FutureBuilder(
          future: getData(),
          //BuildContext context, AsyncSnapshot<Weather> snapshot
          builder: (context, snapshot)
          {
            if(snapshot.connectionState == ConnectionState.done){
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 130,
                              ),
                              Text(
                                _weatherDisplay!.name,
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                _weatherDisplay!.localtime.toString(),
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height:5),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white38,
                              ),
                              child: Center(child: Text('Dự Báo 7 ngày',style: GoogleFonts.robotoSlab(color: Colors.white,fontSize: 20),))),
                          SizedBox(height:5),
                          Container(
                            width: double.infinity,
                            height: 200,
                           child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                    borderRadius:  BorderRadius.circular(30),
                                    color: Colors.white38,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text('Thứ ${index+2}', style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                          )),
                                        ),
                                        SizedBox(height:10),
                                        Image.network('https:'+_weatherDisplay!.icon, height: 55,),
                                        SizedBox(width: 2,),
                                        Text(formatText(_weatherDisplay!.text),
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blueAccent,
                                        ),),
                                        SizedBox(height: 2,),
                                        Text('Nhiệt Độ Trung Bình', style: GoogleFonts.robotoSlab(fontSize: 15, color: Colors.orange)),
                                        Text(_weatherDisplay!.temp_c.toString() +'\u2103',
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ))

                                      ],
                                    ),
                                  );
                                }
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _weatherDisplay!.temp_c.toString() +'\u2103',
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 80,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Image.network('https:'+_weatherDisplay!.icon, height: 55,),
                                  //SizedBox(width: 10,),
                                  SizedBox(width: 10,),
                                  Text(
                                    formatText(_weatherDisplay!.text),
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white30,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Tốc độ gió',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    _weatherDisplay!.wind.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'km/h',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 50,
                                        color: Colors.white38,
                                      ),
                                      Container(
                                        height: 5,
                                        width: ((50 *  _weatherDisplay!.wind)/100),
                                        color: Colors.greenAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Hướng gió',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    _weatherDisplay!.winddegree.toString() + 'º',
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Độ ẩm',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    _weatherDisplay!.humidity.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '%',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 50,
                                        color: Colors.white38,
                                      ),
                                      Container(
                                        height: 5,
                                        width: ((50 *  _weatherDisplay!.humidity)/100),
                                        color: Colors.redAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );}else
                return CircularProgressIndicator.adaptive();


          }
      )
    );
  }

String formatText(String text) {
  if(text == 'Sunny'){
    return _weatherDisplay!.text.toString().replaceAll('Sunny', 'Nắng đẹp');
  }else if(text == 'Partly cloudy'){
    return _weatherDisplay!.text.toString().replaceAll('Partly cloudy', 'Nhều Mây');
  }else if(text == 'Patchy rain possible'){
    return _weatherDisplay!.text.toString().replaceAll('Patchy rain possible', 'Có Thể Mưa');
  }
  return  _weatherDisplay!.text.toString();
}

}
