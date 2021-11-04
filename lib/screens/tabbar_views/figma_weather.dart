
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_weather_camau/widgets/widgets_tabbar/widget_containerweather.dart';


class FigmaWeather extends StatelessWidget {
  const FigmaWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/sunny.jpg',
                fit: BoxFit.cover,
                height:double.infinity,
                width: double.infinity),
            Container(
              color: Colors.black26,
            ),
            Column(
              children: [
                Container(
                    child: Column(
                      children: [
                        SizedBox(height: 130,),
                        Text('Cà Mau', style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoSlab',
                        )),
                        SizedBox(height: 10,),
                        Text('Thứ 5, ngày 3/11/2021', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                        ))

                      ],
                    )
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      Image.network('https://cdn-icons-png.flaticon.com/512/2451/2451309.png', width: 150,),
                      SizedBox(height: 20,),
                      Text('CHỈ SỐ AQI TRỰC TIẾP', style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'RobotoSlab'
                      )),
                      SizedBox(height: 10,),
                      Text('TRUNG BÌNH', style: TextStyle(
                          fontSize:50,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'RobotoSlab'
                      ))

                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Co', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),),
                          SizedBox(height: 10),
                          Text('26 ppm', style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Text('No2', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),),
                          SizedBox(height: 10),
                          Text('10 ppm', style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Text('O3', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),),
                          SizedBox(height: 10),
                          Text('26 ppm', style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),)
                        ],
                      )

                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Hôm nay', style: TextStyle(
                            fontSize:20, fontWeight: FontWeight.w400, color: Colors.white
                        )),
                        SizedBox(width: 220,),
                        Text('View report', style: TextStyle(
                            fontSize:20, fontWeight: FontWeight.w400, color: Colors.white
                        ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ContainerWeather('https://cdn-icons-png.flaticon.com/512/2580/2580627.png', '10:00 AM', '24 ppm');
                          }
                      ),
                    ),


                  ],
                ),

              ],

            ),
          ],
        ),
      ),
    );

  }
}
