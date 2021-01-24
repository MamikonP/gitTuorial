import 'dart:async';

import 'package:chart_example/Chart.dart';
import 'package:chart_example/DataBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _timeController = TextEditingController();
  TextEditingController _tempController = TextEditingController();
  bool textFieldFocus = false;
  List<charts.Series<DataModel, int>> _seriesLineData;

  @override
  void initState() {
    super.initState();
    _seriesLineData = [];
  }

  @override
  void dispose() {
    _seriesLineData.clear();
    super.dispose();
  }

  Widget chartField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("$title", style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            width: 50,
            child: Material(
              color: Colors.grey[200],
              elevation: 1.0,
              child: TextField (
                keyboardType: TextInputType.number,
                onTap: (){
                  setState(() {
                    textFieldFocus = true;
                  });
                },
                // focusNode: _focusNode,
                controller: controller,
                onSubmitted: (value) {
                  Timer(Duration(milliseconds: 500), (){
                    if(textFieldFocus) {
                      setState(() {
                        textFieldFocus = false;
                      });
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chartFieldsP(var dataBloc) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          chartField("Time", _timeController),
          chartField("Tmpr", _tempController),
          RaisedButton(
            child: Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            color: Colors.redAccent,
            onPressed: () => saveValues(dataBloc),
          )
        ],
      ),
    );
  }

  Widget chartFieldsL(var dataBloc) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          chartField("Time", _timeController),
          chartField("Tmpr", _tempController),
          RaisedButton(
            child: Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            color: Colors.redAccent,
            onPressed: () => saveValues(dataBloc),
          )
        ],
      ),
    );
  }

  dismissFocus() {
    if (textFieldFocus) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
    setState(() {
      _timeController.clear();
      _tempController.clear();
    });
    Timer(Duration(milliseconds: 500), (){
      if(textFieldFocus) {
        setState(() {
          textFieldFocus = false;
        });
      }
    });
  }

  Widget loading() {
    return Center(
      child: Text("Loading..."),
    );
  }

  Widget lineChart(List<String> data)
  {
    if (_seriesLineData.length > 0) {
      _seriesLineData.clear();
    }
    setSeriesLine(data);
    return charts.LineChart(
      _seriesLineData,
      animate: true,
      animationDuration: Duration(milliseconds: 500),
      defaultRenderer: charts.LineRendererConfig(
        includeArea: true,
        stacked: true,
        includePoints: true,
        // includeLine: true,
      ),
      behaviors: [
        charts.ChartTitle(
          "Temprature",
          behaviorPosition: charts.BehaviorPosition.start,
          titleOutsideJustification: charts.OutsideJustification.middleDrawArea
        ),
        charts.ChartTitle(
          "Time",
          behaviorPosition: charts.BehaviorPosition.bottom,
          titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
        ),          
      ],
    );
  }

  Widget portrait(var dataBloc) {
    return Column(
      children: [
        chartFieldsP(dataBloc),
        Expanded(
          child: SafeArea(
            child: textFieldFocus ? loading() : BlocBuilder<DataBloc, List<String>>(
              builder: (BuildContext context, List<String> state) {
                return lineChart(state);
              }
            )
          )
        )
      ],
    );
  }

   Widget landscape(var dataBloc) {
    return Row(
      children: [
        chartFieldsL(dataBloc),
        Expanded(
          child: SafeArea(
            child: textFieldFocus ? loading() : BlocBuilder<DataBloc, List<String>>(
              builder: (BuildContext context, List<String> state) {
                return lineChart(state);
              }
            )
          )
        )
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final _dataBloc = BlocProvider.of<DataBloc>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title:Text("Simple Line Chart"),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait) {
            return portrait(_dataBloc);
          } else {
            return landscape(_dataBloc);
          }
        },
      ),
    );
  }

  saveValues(var dataBloc) {
    // if (int.parse(_timeController.text) < int.parse(data[data.length - 1].split(",")[0])) {
      dataBloc.changeData(int.parse(_timeController.text), _timeController.text + "," + _tempController.text);
      dataBloc.add(DataEvent.save);
      dismissFocus();
      // setState(() {
      //   data[int.parse(_timeController.text)] = _timeController.text + "," + _tempController.text;
      // });
    // }
  }


  void setSeriesLine(List<String> data)
  {
    List<DataModel> _list1 = []..length = data.length;
    for (var i = 0; i < _list1.length; i++) {
      _list1[i] = DataModel(
        time: int.parse(data[i].split(",")[0]),
        temprature: double.parse(data[i].split(",")[1])
      );
    }
    _seriesLineData.add(
      charts.Series(
        data: _list1,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff478956)),
        id: 'Room temp',
        domainFn: (DataModel model, _) => model.time,
        measureFn: (DataModel model, _) => model.temprature,
      )
    );
  }
}

class DataModel {
  int time;
  double temprature;
  DataModel({this.time, this.temprature});
}