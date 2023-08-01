import 'dart:convert';
import 'package:dyslexia/courses.dart';
import 'package:dyslexia/free_courses.dart';
import 'package:dyslexia/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'const.dart' as baby;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchAlbum();
    super.initState();
  }
  int _selectedIndex = 1;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/bg1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                child: Divider(thickness: 3,color: Colors.red,),
              ),
              Container(
                  child: Column(
                    children: [
                      Center(child: Text('SMART SPECIAL \n ASSESMENT SERVICES',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),textAlign: TextAlign.center,),),
                      SizedBox(height: 20,),
                      Center(child: Text('Special needs,Dyslexia,Sign Language,\n German & English',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
                    ],
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                child: Divider(thickness: 3,color: Colors.red,),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 5,),
                child: Text('Sagson Education Placement Test (Sept are designed by Qualifications House UK and powered by LearningOnline.xyz,a partnership model that brings more than 30 Years of Experience and an International teams of experts based in the UK the USA and Canada',style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 5),
                alignment: Alignment.bottomLeft,
                child: Text('SEPT offers five test:',style: TextStyle(fontSize: 17),),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('1- SEPT- Special Needs Screening tool:An effective tools for schools and HEIs',style: TextStyle(fontSize: 17),),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.bottomLeft,
                child: Text('2- SEPT - Dyselexia Screening',style: TextStyle(fontSize: 17),),),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.bottomLeft,
                child: Text('3- SEPT - Sign Language for Teachers',style: TextStyle(fontSize: 17),),),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.bottomLeft,
                child: Text('4- SEPT - English',style: TextStyle(fontSize: 17),),),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.bottomLeft,
                child: Text('4- SEPT - German',style: TextStyle(fontSize: 17),),),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 5),
                      width: MediaQuery.of(context).size.width*0.45,
                      child:  ElevatedButton(onPressed: (){_onItemTapped(1);}, child: Text('Take Test'),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),),
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.45,
                      height: 50,
                      child:  ElevatedButton(onPressed: (){_onItemTapped(2);}, child: Text('Check Courses'),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                color: Colors.grey.withOpacity(0.3),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      alignment: Alignment.bottomLeft,
                      child: Text('Get in Touch',style: TextStyle(color: Colors.red,fontSize: 25,),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.1,
                              child: Icon(Icons.location_on,color: Colors.red,size: 25,)),
                          Container(
                              width: MediaQuery.of(context).size.width*0.87,
                              child: Text('Qualifications House UK Office: 30 5; 1 King Road London, EC2V 8AU',maxLines: 3,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.1,
                              child: Icon(Icons.email,color: Colors.red,size: 25,)),
                          Container(
                              width: MediaQuery.of(context).size.width*0.87,
                              child: Text('Email: info@sept.digital',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.1,
                              child: Icon(Icons.phone,color: Colors.red,size: 25,)),
                          Container(
                              width: MediaQuery.of(context).size.width*0.87,
                              child: Text('Sagson Call Center(UK and Abroad) +971 (0) 450 95918)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.1,
                              child: Icon(Icons.phone,color: Colors.red,size: 25,)),
                          Container(
                              width: MediaQuery.of(context).size.width*0.87,
                              child: Text('Sagson Customer Care(Ouside the UK) +971 (0) 58 591 1858)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Test(),
      Courses(),
      FreeCourses()
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Image.asset('assets/logo3.png',fit: BoxFit.contain,
          height: 50,),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'TEST',
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'COURSES',
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'FREE RESOURCES',
            backgroundColor: Colors.redAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
