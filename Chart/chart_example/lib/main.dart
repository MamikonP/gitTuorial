import 'package:chart_example/DataBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chart_example/Home.dart';

void main()
{
  List<String> data = ["0,37.7",
    "1,28.7",
    "2,24.3",
    "3,21.9",
    "4,22.6",
    "5,18.0",
    "6,16.5",
    "7,20.6",
    "8,18.1",
    "9,13.2",
    "10,15.6",
    "11,17.6",
    "12,14.4",
    "13,15.8",
    "14,19.6",
    "15,15.3",
    "16,14.7",
    "17,17.3",
    "18,12.6",
    "19,11.1"];
  runApp(MaterialApp(
    home: BlocProvider(
      create: (BuildContext context) => DataBloc(data),
      child: Home()
    )
  ));
}
