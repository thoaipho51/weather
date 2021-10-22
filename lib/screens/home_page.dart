import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/models/weather_locations.dart';
import 'package:flutter_weather_camau/widgets/buildin_transform.dart';
import 'package:flutter_weather_camau/widgets/single_weather.dart';
import 'package:flutter_weather_camau/widgets/slider_dot.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  late String bgImg;
  _onPageChanged(int index){
    setState((){
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(locationList[_currentPage].weatherType == 'Sunny'){
      bgImg = 'assets/sunny.jpg';
    }else if(locationList[_currentPage].weatherType == 'Night'){
      bgImg = 'assets/night.jpg';
    }else if(locationList[_currentPage].weatherType == 'Cloud'){
      bgImg = 'assets/cloudy.jpeg';
    }else if(locationList[_currentPage].weatherType == 'Rain'){
      bgImg = 'assets/rainy.jpg';
    }

    return Container(
      child: Stack(
        children: [
          Image.asset(
            bgImg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black38),
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 15),
            child: Row(
              children: [
                for(int i=0; i<locationList.length; i++)
                  if( i == _currentPage)
                    SliderDot(true)
                  else
                    SliderDot(false)
              ],
            ),
          ),
          TransformerPageView(
            scrollDirection: Axis.horizontal,
            transformer: ScaleAndFadeTransformer(),
            viewportFraction: 0.8,
            onPageChanged: _onPageChanged,
            itemCount: locationList.length,
            itemBuilder: (ctx, i) => SingleWeather(i),
          ),
        ],
      ),
    );
  }
}
