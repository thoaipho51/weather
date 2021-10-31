import 'package:flutter/material.dart';

class MessengerPage extends StatelessWidget {
  const MessengerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messenger')),
      body:Container(
        color: Colors.blue,
        child: Center(
            child:Text('Messenger Page', style: TextStyle(
                fontSize: 30,
                color: Colors.white
            ),)
        ),
      ),

    );
  }
}
