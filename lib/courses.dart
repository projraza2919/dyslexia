import 'package:dyslexia/card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'const.dart' as baby;
import 'package:easy_search_bar/easy_search_bar.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);
  @override
  State<Courses> createState() => _Courses();
}

class _Courses extends State<Courses> {
  bool loadnow=false;
  Map<String, dynamic> maindata=baby.allAssets;
  List boolValues=[];
  List courseValues=[];
  List tempCourseValues=[];
  final searchController = TextEditingController();
  setBoolValues(){
    for(var i=0; i<maindata['Courses'].length; i++){
      boolValues.add(true);
      courseValues.add(maindata['Courses'][i]);
    }
    setState(() {
      tempCourseValues=courseValues;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    setBoolValues();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.90,
                height: 50,
                child: TextField(
                  onChanged: (search){
                    //print(courseValues);
                    //print(search.length);
                    for(var i=0; i<maindata['Courses'].length; i++){
                      if(search.isNotEmpty && search.length>0){
                        var mainString=(maindata['Courses'][i]['name']);
                       if(mainString.contains(search)==true){
                         setState(() {
                           boolValues[i]=true;
                         });
                       }else{
                         setState(() {
                           boolValues[i]=false;
                         });
                       }
                      }else{
                        boolValues=[];
                        for(var i=0; i<maindata['Courses'].length; i++){
                          boolValues.add(true);
                        }
                      }
                    }

                    setState(() {

                    });
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.search_rounded),
                      border: InputBorder.none,
                      hintText: 'Search',
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-(kBottomNavigationBarHeight+80+AppBar().preferredSize.height),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //maxCrossAxisExtent: 200,
                    childAspectRatio: 4 / 6,
                    crossAxisSpacing: 10,
                    //mainAxisSpacing: 100
                    ),
                itemCount: maindata['Courses'].length,
                itemBuilder: (BuildContext ctx, index) {
                  if(boolValues[index]==true){
                    return Container(
                        child: InkWell(
                          onTap:() async{
                            var url = '${maindata['Courses'][index]['url']}';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: ObjectCard(height: MediaQuery.of(context).size.width*0.7, width: MediaQuery.of(context).size.width*0.45, image: maindata['Courses'][index]['picture'], content: maindata['Courses'][index]['name']),
                        )
                    );
                  }else{
                    return Container(height: 0,);
                  }

                }),
          )
        ],
      ),
    );
  }
}
