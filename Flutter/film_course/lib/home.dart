import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, dynamic> movies;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getFilms();
  }

  Future<void> getFilms() async{
    var jsonText = await rootBundle.loadString('lib/films.json');
    setState(() {
      movies = json.decode(jsonText);
      if(movies != null)
        isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Films", style:TextStyle(color:Colors.white, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginPage()
              ));
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.close),
                Text("Log Out", style: TextStyle(color: Color.fromRGBO(36, 217, 0, 1),),),
              ],
            )
          )
        ],
      ),

      body: isLoaded ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: movies.length,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return FilmList(
            urlImage: movies["film_$index"][0]["image"],
            movieName: movies["film_$index"][0]["name"],
            price: movies["film_$index"][0]["price"],
            comingDate: movies["film_$index"][0]["comingDate"],
            genre: movies["film_$index"][0]["genre"],
            time: movies["film_$index"][0]["time"],
            urlMovie: movies["film_$index"][0]["url"],
          );
        },
      ) : Center(child: CircularProgressIndicator())
    );
  }
}

class FilmList extends StatelessWidget {
  final String urlImage;
  final String movieName;
  final double price;
  final int comingDate;
  final String genre;
  final String time; 
  final String urlMovie;

  FilmList({this.urlImage, this.movieName, this.price, this.comingDate, this.genre, this.time, this.urlMovie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: movieName, 
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => FilmDetail(
                  urlImage: urlImage,
                  movieName: movieName,
                  price: price,
                  comingDate: comingDate,
                  genre: genre,
                  time: time,
                  urlMovie: urlMovie,
                ),
              ));
            },
            child: GridTile(
              child: Image.network(urlImage, fit: BoxFit.cover,),
              footer: Container(
                color: Colors.black.withOpacity(0.7),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(movieName, style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("\$$price", style: TextStyle(color:Color.fromRGBO(36, 217, 0, 1), fontWeight: FontWeight.bold, fontSize: 17),)
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}

class FilmDetail extends StatelessWidget {
  final String urlImage;
  final String movieName;
  final double price;
  final int comingDate;
  final String genre;
  final String time;
  final String urlMovie;

  FilmDetail({
    this.urlImage, this.movieName, this.price, this.comingDate, this.genre, this.time, this.urlMovie
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$movieName", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context, true);
          }
        ),
      ),

      body: Container(
        height: 300,
        child: GridTile(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                  child: Image.network(urlImage, fit: BoxFit.fill,),
              ),
              InkWell(
                onTap: () => _launchMovie(urlMovie),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Icon( Icons.play_circle_outline, color: Colors.grey, size: 50.0,),
                      
                  ),
                ),
              ),
            ],
          ),
          footer: Container(
            color: Colors.black38,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(urlImage),
              ),
              trailing: Text("\$$price", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      isThreeLine: true,
                      title: Text("Date: $comingDate",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Genre: $genre",
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),),
                          Text("Time: $time",
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchMovie(String url) async{
    if(await canLaunch(url)){
      launch(url);
    } else {
      throw("Could not open $url");
    }
  }
}