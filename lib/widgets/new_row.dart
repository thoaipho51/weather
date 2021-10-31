import 'package:flutter/material.dart';

class NewRow extends StatelessWidget {

  final IconData icon;
  final String text;
  final double sizeFont;
  final VoidCallback onTap;

  const NewRow({Key? key, required this.icon, required this.text, required this.sizeFont, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.white ),
          SizedBox(width: 20),
          Text(text, style: TextStyle(
            color: Colors.white,
            fontSize: sizeFont,
          ))
        ],
      ),
    );
  }
}
