import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage()
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // series for chart
  List<chart.Series<Task, String>> _seriesPieData;
  List<chart.Series<Pollution, String>> _seriesData;
  List<chart.Series<Sales, int>> _seriesLineData;

  @override
  void initState() {
    super.initState();
    _seriesData = List<chart.Series<Pollution, String>>();
    _seriesPieData = List<chart.Series<Task,String>>();
    _seriesLineData = List<chart.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ]
            ),
            title: Text('Flutter charts'),
          ),
          body: TabBarView(
            children: <Widget>[
              // first chart
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('SO₂ emissions by world region (in million tones)', style:TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: chart.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: chart.BarGroupingType.grouped,
                            animationDuration: Duration(seconds: 3),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // second chart
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text("Time spent on daily task", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: chart.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 3),
                            behaviors: [
                              chart.DatumLegend(
                                outsideJustification: chart.OutsideJustification.endDrawArea,
                                horizontalFirst: false,
                                desiredMaxRows: 2,
                                cellPadding: EdgeInsets.only(right:4.0, bottom: 4.0),
                                entryTextStyle: chart.TextStyleSpec(
                                  color: chart.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11
                                )
                              )
                            ],
                            defaultRenderer: chart.ArcRendererConfig(
                              arcWidth: 100,
                              arcRendererDecorators: [
                                chart.ArcLabelDecorator(
                                  labelPosition: chart.ArcLabelPosition.inside
                                )
                              ]
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Sales for the first 5 years', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        SizedBox(height:10),
                        Expanded(
                          child: chart.LineChart(
                            _seriesLineData,
                            defaultRenderer: chart.LineRendererConfig(
                              includeArea: true,
                              stacked: true
                            ),
                            animate: true,
                            animationDuration: Duration(seconds: 3),
                            behaviors: [
                              chart.ChartTitle(
                                'Years', behaviorPosition: chart.BehaviorPosition.bottom,
                                titleOutsideJustification: chart.OutsideJustification.middleDrawArea
                              ),
                              chart.ChartTitle(
                                'Sales', behaviorPosition: chart.BehaviorPosition.bottom,
                                titleOutsideJustification: chart.OutsideJustification.middleDrawArea
                              ),
                              chart.ChartTitle(
                                'Departments', behaviorPosition: chart.BehaviorPosition.bottom,
                                titleOutsideJustification: chart.OutsideJustification.middleDrawArea
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),      
    );
  }

  // pie data
  void _generateData() {
    // Bar chart data
    var data1 = [
      Pollution('USA', 1980, 30),
      Pollution('Asia', 1980, 40),
      Pollution('Europe', 1980, 10),
    ];

    var data2 = [
      Pollution('USA', 1985, 100),
      Pollution('Asia', 1980, 150),
      Pollution('Europe', 1985, 80),
    ];

    var data3 = [
      Pollution('USA', 1985, 200),
      Pollution('Asia', 1980, 300),
      Pollution('Europe', 1985, 180),
    ];

    _seriesData.add(
      chart.Series(
        data: data1,
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        fillPatternFn: (_, __) => chart.FillPatternType.forwardHatch,
        fillColorFn: (Pollution pollution, _) => chart.ColorUtil.fromDartColor(Color(0xff990099))
      )
    );

    _seriesData.add(
      chart.Series(
        data: data2,
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        fillPatternFn: (_, __) => chart.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) => chart.ColorUtil.fromDartColor(Color(0xff109618))
      )
    );

    _seriesData.add(
      chart.Series(
        data: data3,
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2020',
        fillPatternFn: (_, __) => chart.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) => chart.ColorUtil.fromDartColor(Color(0xffff9900))
      )
    );
    // Pie chart data
    var piedata = [
      new Task("Work", 35.8, Colors.blue),
      new Task("Eat", 8.3, Colors.red),
      new Task("Commute", 10.8, Colors.orange),
      new Task("TV", 15.6, Colors.green),
      new Task("Sleep", 19.2, Colors.purple),
      new Task("Other", 10.3, Colors.yellow),
    ];

    _seriesPieData.add(
      chart.Series(
        data: piedata,
        // y axis detail
        domainFn: (Task task, _) => task.task,
        // x axis detail
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) => chart.ColorUtil.fromDartColor(task.color),
        id: "Daily Rask",
        labelAccessorFn: (Task row, _) => '${row.taskValue}',

      )
    );

    // Line chart data
    var lineSalesData = [
      Sales(0, 45),
      Sales(1, 56),
      Sales(2, 55),
      Sales(3, 60),
      Sales(4, 61),
      Sales(5, 70),
    ];

    var lineSalesData1 = [
      Sales(0, 35),
      Sales(1, 46),
      Sales(2, 45),
      Sales(3, 50),
      Sales(4, 51),
      Sales(5, 60),
    ];

    var lineSalesData2 = [
      Sales(0, 20),
      Sales(1, 24),
      Sales(2, 25),
      Sales(3, 40),
      Sales(4, 45),
      Sales(5, 60),
    ];

    _seriesLineData.add(
      chart.Series(
        data: lineSalesData,
        colorFn: (__, _) => chart.ColorUtil.fromDartColor(Color(0xff990099)),
        id: "Air Pollution",
        domainFn: (Sales sales, _ ) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      )
    );

    _seriesLineData.add(
      chart.Series(
        data: lineSalesData1,
        colorFn: (__, _) => chart.ColorUtil.fromDartColor(Color(0xff109618)),
        id: "Air Pollution",
        domainFn: (Sales sales, _ ) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      )
    );

    _seriesLineData.add(
      chart.Series(
        data: lineSalesData2,
        colorFn: (__, _) => chart.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: "Air Pollution",
        domainFn: (Sales sales, _ ) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      )
    );
  }
}

class Task{
  String task;
  double taskValue;
  Color color;

  Task(this.task, this.taskValue, this.color);
}

class Pollution{
  String place;
  int year;
  int quantity;

  Pollution(this.place, this.year, this.quantity);
}

class Sales{
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}