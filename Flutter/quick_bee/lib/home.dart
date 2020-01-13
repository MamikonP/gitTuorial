import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Color(0xFF18D191)),
          title:Text("Login")
      ),
      body: MainContent(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomIndex,
        fixedColor: Color(0xFF18D191),
        onTap: (int index){
          setState(() {
            _bottomIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.local_offer),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.beenhere),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.account_balance),
          ),
        ]
      ),
    );
  }
}

class MainContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Column(
              children: <Widget>[
                // Explore Containers
                Row(
                 children: <Widget>[
                   Text("Explore",style: TextStyle(fontSize: 30.0),textAlign: TextAlign.left,),
                 ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    //Motor icons
                    Expanded(
                      child:Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFFFD7384),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.drive_eta, color: Colors.white,),
                              Text("Motor", style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      )
                    ),
                    // first containers 2 by column
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 2.5),
                        child: Container(
                          height: 100.0,
                          child: Column(
                            children: <Widget>[
                              // classified
                              Expanded(
                                child:Padding(
                                  padding: EdgeInsets.only(bottom: 2.5,),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child:Icon(Icons.local_offer, color: Colors.white,),
                                        ),
                                        Text('Classified', style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Color(0xFF2BD093),
                                    ),
                                  ),
                                )
                              ),
                              // service
                              Expanded(
                                child:Padding(
                                  padding: EdgeInsets.only(top: 2.5,),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child:Icon(Icons.beenhere, color: Colors.white,),
                                        ),
                                        Text('Service', style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Color(0xFFFC7840),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                    // second containers 2 by column
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.5),
                        child: Container(
                          height: 100.0,
                          child: Column(
                            children: <Widget>[
                              // classified
                              Expanded(
                                child:Padding(
                                  padding: EdgeInsets.only(bottom: 2.5,),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child:Icon(Icons.account_balance, color: Colors.white,),
                                        ),
                                        Text('Properties', style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Color(0xFF53CED8),
                                    ),
                                  ),
                                ),
                              ),
                              // Jobs
                              Expanded(
                                child:Padding(
                                  padding: EdgeInsets.only(top: 2.5,),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child:Icon(Icons.art_track, color: Colors.white,),
                                        ),
                                        Text('Jobs', style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Color(0xFFF18069),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // popular  trending
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Popular', style: TextStyle(fontSize: 20.0),),
                    ),
                    Expanded(
                      child: Text('View all', style: TextStyle(color: Color(0xFF2BD093)), textAlign: TextAlign.end,),
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: <Widget>[
                    // play station
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage('https://www.howtogeek.com/wp-content/uploads/2016/01/15259823076_c20add36c7_h.jpg'),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                            Text('Play Station', style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                    // jewerly and wathces
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.howtogeek.com/wp-content/uploads/2018/09/ximg_5b996757261ae.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.Tblp9R12ic.png'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Jewerly and watches', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                    // electronics
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.howtogeek.com/wp-content/uploads/2011/01/recon-goggles.png'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Electronics', style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // popular  trending-2
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Popular trending', style: TextStyle(fontSize: 20.0),),
                    ),
                    Expanded(
                      child: Text('View all', style: TextStyle(color: Color(0xFF2BD093)), textAlign: TextAlign.end,),
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: <Widget>[
                    // play station
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.reviewgeek.com/thumbcache/0/0/97f4fc462f0338a58b5065801a0faab6/p/uploads/2018/08/186add80.jpg'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Motors', style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                    // jewerly and wathces
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.lifesavvy.com/thumbcache/0/0/d27eeff93f0e1f75690aa07452dd9659/p/uploads/2019/08/d1657369.jpg'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Jobs', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                    // electronics
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.howtogeek.com/wp-content/uploads/2015/01/ximg_54c944c58a982.jpg.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.TuMhQ0-XeD.jpg'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Electronics', style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // popular and trending-3
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Popular', style: TextStyle(fontSize: 20.0),),
                    ),
                    Expanded(
                      child: Text('View all', style: TextStyle(color: Color(0xFF2BD093)), textAlign: TextAlign.end,),
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: <Widget>[
                    // play station
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.howtogeek.com/wp-content/uploads/2016/01/15259823076_c20add36c7_h.jpg'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Play Station', style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                    // jewerly and wathces
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.howtogeek.com/wp-content/uploads/2018/09/ximg_5b996757261ae.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.Tblp9R12ic.png'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Jewerly and watches', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                    // electronics
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 140.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.howtogeek.com/wp-content/uploads/2011/01/recon-goggles.png'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Text('Electronics', style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}