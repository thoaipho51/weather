import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget additionalInfomation(String wind, String humidity, String  pr, String feels_like){

  TextStyle titleFont = TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white);
  TextStyle descFont = TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0,color: Colors.white);

  return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sức Gió: ",
                      style: titleFont
                  ),
                  SizedBox(height:18.0),
                  Text("Sức Ép",
                    style: titleFont,
                  ),
                ],

              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$wind",
                      style: descFont
                  ),
                  SizedBox(height:18.0),
                  Text("$pr",
                    style: descFont,
                  ),
                ],

              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Độ Ẩm: ",
                      style: titleFont
                  ),
                  SizedBox(height:18.0),
                  Text("Cảm giác như: ",
                    style: titleFont,
                  ),
                ],

              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$humidity",
                      style: descFont
                  ),
                  SizedBox(height:18.0),
                  Text("$feels_like",
                    style: descFont,
                  ),
                ],

              )
            ],
          )

        ],
      )
  );
}