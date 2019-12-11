import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Icon(Icons.favorite, size: 100.0, color: Colors.redAccent)
      ),
    );
  }
}