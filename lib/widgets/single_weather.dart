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


  late Future<Weather> _weatherDisplay;

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
                                snapshot.data!.data.city,
                                style: GoogleFonts.lato(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                snapshot.data!.data.current.pollution.ts.toString(),
                                // locationList[widget.index].dateTime,
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.data.current.weather.tp.toString() +'\u2103',
                                style: GoogleFonts.lato(
                                    fontSize: 66,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  // Image.network(snapshot.data!.data.current.weather.ic+'.png',
                                  // height:28,
                                  // width: 28,
                                  // ),
                                  SvgPicture.asset(
                                    locationList[widget.index].iconUrl,
                                    height: 28,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    locationList[widget.index].weatherType,
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
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
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                                    snapshot.data!.data.current.weather.ws.toString(),
                                    // locationList[widget.index].wind.toString(),
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
                                        width: ((50 * snapshot.data!.data.current.weather.ws)/100),
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
                                  Text(
                                    locationList[widget.index].rain.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'độ',
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
                                        width: ((50 * locationList[widget.index].rain)/100),
                                        color: Colors.purpleAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Humidy',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data!.data.current.weather.hu.toString(),
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
                                        width: ((50 * snapshot.data!.data.current.weather.hu)/100),
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

    // return Container(
    //   padding: EdgeInsets.all(20),
    //   child: Column(
    //     mainAxisAlignment:  MainAxisAlignment.spaceBetween,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         child: Column(
    //           mainAxisAlignment:  MainAxisAlignment.spaceBetween,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 SizedBox(
    //                   height: 100,
    //                 ),
    //                 Text(
    //                   locationList[widget.index].city,
    //                   style: GoogleFonts.lato(
    //                       fontSize: 35,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white),
    //                 ),
    //                 SizedBox(height: 5,),
    //                 Text(
    //                   locationList[widget.index].dateTime,
    //                   style: GoogleFonts.lato(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   locationList[widget.index].temperature,
    //                   style: GoogleFonts.lato(
    //                       fontSize: 66,
    //                       fontWeight: FontWeight.w300,
    //                       color: Colors.white),
    //                 ),
    //                 Row(
    //                   children: [
    //                     SvgPicture.asset(
    //                       locationList[widget.index].iconUrl,
    //                       height: 28,
    //                       color: Colors.white,
    //                     ),
    //                     SizedBox(width: 20,),
    //                     Text(
    //                       locationList[widget.index].weatherType,
    //                       style: GoogleFonts.lato(
    //                         fontSize: 22,
    //                         fontWeight: FontWeight.w500,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //       Column(
    //         children: [
    //           Container(
    //             margin: EdgeInsets.symmetric(vertical: 40),
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.white30,
    //                 )),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Column(
    //                   children: [
    //                     Text(
    //                       'Wind',
    //                       style: GoogleFonts.lato(
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.white),
    //                     ),
    //                     Text(
    //                       locationList[widget.index].wind.toString(),
    //                       style: GoogleFonts.lato(
    //                         fontSize: 22,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Text(
    //                       'km/h',
    //                       style: GoogleFonts.lato(
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Stack(
    //                       children: [
    //                         Container(
    //                           height: 5,
    //                           width: 50,
    //                           color: Colors.white38,
    //                         ),
    //                         Container(
    //                           height: 5,
    //                           width: ((50 * locationList[widget.index].wind)/100),
    //                           color: Colors.greenAccent,
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       'Rain',
    //                       style: GoogleFonts.lato(
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.white),
    //                     ),
    //                     Text(
    //                       locationList[widget.index].rain.toString(),
    //                       style: GoogleFonts.lato(
    //                         fontSize: 22,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Text(
    //                       '%',
    //                       style: GoogleFonts.lato(
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Stack(
    //                       children: [
    //                         Container(
    //                           height: 5,
    //                           width: 50,
    //                           color: Colors.white38,
    //                         ),
    //                         Container(
    //                           height: 5,
    //                           width: ((50 * locationList[widget.index].rain)/100),
    //                           color: Colors.purpleAccent,
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       'Humidy',
    //                       style: GoogleFonts.lato(
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.white),
    //                     ),
    //                     Text(
    //                       locationList[widget.index].humidity.toString(),
    //                       style: GoogleFonts.lato(
    //                         fontSize: 22,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Text(
    //                       '%',
    //                       style: GoogleFonts.lato(
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Stack(
    //                       children: [
    //                         Container(
    //                           height: 5,
    //                           width: 50,
    //                           color: Colors.white38,
    //                         ),
    //                         Container(
    //                           height: 5,
    //                           width: ((50 * locationList[widget.index].humidity)/100),
    //                           color: Colors.redAccent,
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
