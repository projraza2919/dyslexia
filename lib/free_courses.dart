import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';
import 'card.dart';
import 'const.dart' as baby;

class FreeCourses extends StatefulWidget {
  const FreeCourses({Key? key}) : super(key: key);

  @override
  State<FreeCourses> createState() => _FreeCourses();
}

class _FreeCourses extends State<FreeCourses> {
  Map<String, dynamic> maindata=baby.allAssets;
  @override
  void initState() {
    //fetchAlbum();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            //maxCrossAxisExtent: 200,
            childAspectRatio: 4 / 6,
            crossAxisSpacing: 10,
          crossAxisCount: 2,
            //mainAxisSpacing: 10
        ),
        itemCount: maindata['free'].length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              child: InkWell(
                onTap:() async{
                  var url = '${maindata['free'][index]['url']}';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: ObjectCard(height: MediaQuery.of(context).size.width*0.7, width: MediaQuery.of(context).size.width*0.45, image: maindata['free'][index]['picture'], content: maindata['free'][index]['name']),
              )
          );
        });
  }
}
