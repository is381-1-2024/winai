
import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150.0,
            child: Image.asset(
              'assets/images/AvatarMe.jpg',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Winai Nadee'),
              Text('DOB: xxx Month 2000'),
            ],
          ),
        ],
      ),
    );
  }
}