import 'package:BubbleGum/v2/pages/menupage/topMenuPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaPage extends StatefulWidget {
  @override
  _SocialMediaPageState createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {



void launchURL(String url) async {
   if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(167, 27, 26, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Image.asset("images/leftarrow.png", width: 2))),
          title: Center(
            child: Text(
              "Social media",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
        ),
        body: Container(
            height: double.infinity,
            width: sizeW,
            color: Color.fromRGBO(167, 27, 26, 1),
            child: Column(
              children: <Widget>[
                SizedBox(height: 17),
                NavItem(
                  onTap: (){
                    launchURL("https://m.facebook.com/nxwestmidlands/");
                  },
                    name: "Facebook", image: Image.asset("images/v3/facebook.png",width: 20,)),
                SizedBox(height: 8),
                NavItem(
                  onTap: (){
                    launchURL("https://twitter.com/nxwestmidlands");
                  },
                    name: "Twitter", image: Image.asset("images/v3/twitter.png",width: 20,))
              ],
            )));
  }
}
