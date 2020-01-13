import 'package:flutter/material.dart';

class StackIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            child: Icon(
              Icons.local_offer,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFF18D191)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:60.0, right: 50.0),
            width: 60.0,
            height: 60.0,
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFFC6A7F)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, top: 60.0),
            width: 60.0,
            height: 60.0,
            child: Icon(
              Icons.local_car_wash,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFFFCE56)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 110.0, top: 40.0),
            width: 60.0,
            height: 60.0,
            child: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFF45E0EC)
            ),
          ),
          // *************************

        ],
      );
  }
}
