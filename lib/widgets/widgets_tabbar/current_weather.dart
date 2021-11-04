import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location){
  return Center(
    child: Column(
      children: [
        SizedBox(height: 130),
        Icon(
          icon,
          color: Colors.deepOrange,
          size: 64.0,
        ),
        SizedBox(
          height: 10.0
        ),
        Text(
          "$temp",
          style: TextStyle(
            fontSize: 46,
            color: Colors.white,

          )
        ),
        SizedBox(height: 10),
        Text(
            "$location",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,

            )
        )
      ],
    ),
  );
}