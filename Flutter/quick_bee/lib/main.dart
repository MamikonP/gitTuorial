import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'login.dart';

void main()=>runApp(MaterialApp(
  title: 'Quick Bee',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Roboto'),
  home: HomePage(),
  routes: <String, WidgetBuilder>{
    "/LoginPage":(BuildContext context)=>LoginPage(),
  },
));

class HomePage extends StatefulWidget{
  State createState()=>HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  void dispose(){
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.3, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController,
        ),
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Containers circulars in Stack
                Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                        child: Container(
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
                      ),
                      Transform(
                        transform: Matrix4.translationValues(animation.value * width * 4, 0.0, 0.0),
                        child: Container(
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
                      ),
                      Transform(
                        transform: Matrix4.translationValues(animation.value * width * 8, 0.0, 0.0),
                        child: Container(
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
                      ),
                      Transform(
                        transform: Matrix4.translationValues(animation.value * width * 12, 0.0, 0.0),
                        child: Container(
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
                      ),
                      // *************************
                    ],
                  ),
                ),
                // Quick Bee text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Qucik Bee", style: TextStyle(fontSize: 30.0),),
                    )
                  ],
                ),
                // Sign in with email
                Row(
                  children: <Widget>[
                    Expanded(
                        child:Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 80.0),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed("/LoginPage");
                              },
                              child:Container(
                                alignment: Alignment.center,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xFF18D191),
                                ),
                                child: Text("Sign in with Email", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                              )
                          ),
                        )
                    )
                  ],
                ),
                // Sign in with Facebook or Google
                Row(
                  children: <Widget>[
                    Expanded(
                        child:Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 5.0, bottom: 10.0, top: 10),
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFF45E0EC),
                            ),
                            child: Text("FaceBook", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                          ),
                        )
                    ),
                    Expanded(
                        child:Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 10.0, bottom: 10.0, top: 10),
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFFFC6A7F),
                            ),
                            child: Text("Google", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                          ),
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Containers circulars in Stack
            Stack(
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
            ),
            // Quick Bee text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Qucik Bee", style: TextStyle(fontSize: 30.0),),
                )
              ],
            ),
            // Sign in with email
            Row(
              children: <Widget>[
                Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 80.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed("/LoginPage");
                        },
                        child:Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF18D191),
                          ),
                          child: Text("Sign in with Email", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                        )
                      ),
                    )
                )
              ],
            ),
            // Sign in with Facebook or Google
            Row(
              children: <Widget>[
                Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 5.0, bottom: 10.0, top: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF45E0EC),
                        ),
                        child: Text("FaceBook", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      ),
                    )
                ),
                Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 10.0, bottom: 10.0, top: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFFC6A7F),
                        ),
                        child: Text("Google", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}