import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'const.dart' as baby;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => _Test();
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
bool isURl(String url){
  return  RegExp(r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
      .hasMatch(url);  }
class _Test extends State<Test> {
  bool loadnow=false;
  Map<String, dynamic> maindata=baby.allAssets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    /*return  GridView.builder(
        gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width*0.45,
            childAspectRatio: 1/1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: maindata['Tests'].length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              child: InkWell(
                onTap:() async{
                  var url = '${maindata['Tests'][index]['url']}';
                  if(isURl(url)){
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url),mode: LaunchMode.platformDefault);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Sorry, You can\'t access this'),
                    ));
                  }

                },
                child:Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: HexColor(maindata['Tests'][index]['color']),
                    child: Text('${maindata['Tests'][index]['name']}',style: TextStyle(fontSize: 20),),
                  ),
                ),
              )
          );
        });*/
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()async{
              String url='https://ph1tjhovt1h.typeform.com/to/MDxTkFST';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),mode: LaunchMode.platformDefault);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Sorry, Unable to Open this'),
                ));
              }
            },

            child: Card(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                //color: Colors.red,
                padding: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                child: Text('Dyslexia Screening for \n Adults',style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Card(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              child: Text('Dyslexia Screening for \nKids (coming soon)',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
