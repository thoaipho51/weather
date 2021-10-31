import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_weather_camau/screens/home_page.dart';

class HomePageA extends StatefulWidget {
  const HomePageA({Key? key}) : super(key: key);

  @override
  _HomePageAState createState() => _HomePageAState();
}

class _HomePageAState extends State<HomePageA> {
  double xOffset =0;
  double yOffset =0;
  bool isDrawerOpen = false;
  //List



  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.90 : 1.00)
        ..rotateZ(isDrawerOpen ? pi/20 : 0),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.menu),
                        onTap: (){
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
                      ),
                      Text('Home', style: TextStyle(
                        fontSize:20,
                        color: Colors.black,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 20,),


              ],
            ),
          ),

        ),
      )

    );
  }
}
