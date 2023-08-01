import 'dart:async';
import 'dart:convert';
import 'package:dyslexia/courses.dart';
import 'package:dyslexia/free_courses.dart';
import 'package:dyslexia/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'const.dart' as baby;
import 'home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sept Dyslexia',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(title: 'Sept Dyslexia',),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Widget mainHome=Scaffold(
    body: Center(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splashscreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        )
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
  bool loadnow=false;
  Map<String, dynamic> maindata=<String,dynamic>{};
  fetchAlbum() async {
    //final response = await http.get(Uri.parse('https://sept.digital/admin/result.json'));
    var result = await http.get(Uri.parse("https://sept.digital/admin/result.json"));
    if(result.statusCode==200){
      maindata=jsonDecode(result.body);
      loadnow=true;
      setState(() {
        baby.allAssets=maindata;
      });
      Timer(Duration(seconds: 3),
          (){
            setState(() {
              mainHome=MyHomePage(title: widget.title,);
            });;
          }
          );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchAlbum();
    super.initState();

  }
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return mainHome;
  }
}


