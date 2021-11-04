import 'package:flutter/material.dart';
import 'package:flutter_weather_camau/screens/sidebar_views/sidebar_messenger_page.dart';

import 'new_row.dart';


class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.indigo.shade700,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person, color:Colors.white),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Soup', style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800
                  )),
                  Text('thoaipho51@gmail.com',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ],

              ),
            ),
            Column(
              children: [
                NewRow(
                  text: 'Messenger',
                  icon: Icons.message,
                  sizeFont: 22,
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>MessengerPage()
                        ));
                    },
                ),
                SizedBox(height: 20,),
                NewRow(
                  text: 'Groups',
                  icon: Icons.group,
                  sizeFont: 22,
                  onTap: (){

                  },
                ),
                SizedBox(height: 20,),
                NewRow(
                  text: 'Favorites',
                  icon: Icons.favorite_border,
                  sizeFont: 22,
                  onTap: (){

                  },
                ),
                SizedBox(height: 20,),
                NewRow(
                  text: 'Saved',
                  icon: Icons.save,
                  sizeFont: 22,
                  onTap: (){

                  },
                ),
                SizedBox(height: 20,),
                NewRow(
                  text: 'Profile',
                  icon: Icons.person_outline,
                  sizeFont: 22,
                  onTap: (){

                  },
                ),
                SizedBox(height: 20,),
                NewRow(
                  text: 'Setting',
                  icon: Icons.settings,
                  sizeFont: 22,
                  onTap: (){
                      print("Setting");
                  },
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.cancel, color: Colors.white.withOpacity(0.5)),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    print("Đã Đăng Xuất");
                  },
                  child: Text('Logout', style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  )),
                )
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
