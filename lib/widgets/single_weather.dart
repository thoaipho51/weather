import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/models/weather_locations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleWeather extends StatelessWidget {

  final int index;
  SingleWeather(this.index);

  @override
  Widget build(BuildContext context) {
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
                      height: 110,
                    ),
                    Text(
                      locationList[index].city,
                      style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      locationList[index].dateTime,
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
                      locationList[index].temperature,
                      style: GoogleFonts.lato(
                          fontSize: 66,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          locationList[index].iconUrl,
                          height: 28,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          locationList[index].weatherType,
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
                          'Wind',
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          locationList[index].wind.toString(),
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
                              width: ((50 * locationList[index].wind)/100),
                              color: Colors.greenAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Rain',
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          locationList[index].rain.toString(),
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
                              width: ((50 * locationList[index].rain)/100),
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
                          locationList[index].humidity.toString(),
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
                              width: ((50 * locationList[index].humidity)/100),
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
    );
  }
}
