import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import './socialMediaPage.dart';

import 'profile/LoginIn.dart';

class UtilitiesMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UtilitiesMenuState();
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class UtilitiesMenuState extends State<UtilitiesMenu> {


  var sections = [
    {
      "section":"Account",
      "links":[
        {
          "type":"link",
          "label":"My Profile",
          "icon":"images/front/account.svg"
        }
      ]
    },
    {
      "section":"Tools",
      "links":[
        {
          "type":"link",
          "label":"nxbus.co.uk",
          "icon":"images/front/website.svg"
        },
         {
          "type":"link",
          "label":"Social media",
          "icon":"images/front/social-media.svg"
        },
        {
          "type":"link",
          "label":"Payzone Barcode",
          "icon":"images/front/DBarcode.svg"
        }
      ]
    }
  ];


  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      
        body: Container(
          
      height: double.infinity,
      width: sizeW,
      color: Colors.white,
      child: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              PhysicalModel(
                  elevation: 0,
                  color: Colors.black,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        child: Center(
                          child: Text("Utilities",
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)),
                        ),
                        height: 55,
                        color: Colors.white,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: 90,
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(width: 5,),
                                SvgPicture.asset("images/front/back.svg",
                                width: 18,
                                ),
                                SizedBox(width: 2,),
                                Text("Back",
                                style: GoogleFonts.roboto(
                                  fontSize: 16
                                ),
                                )
                              ],
                            ),
                          )),
                    ],
                  )),
               SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(168, 27, 26, 1),
                  child: CustomScrollView(
                    slivers: [
                      
                    ],
                  ),
                ),
              )    
            ])
          
        ),
      ),
    ));
  }
}

class NavItem extends StatelessWidget {
  final String name;
  final Function onTap;
  final Widget image;

  const NavItem({
    @required this.name,
    @required this.image,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: 380,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(215, 216, 218, 1),
                  offset: new Offset(0, 3))
            ]),
        child: Row(children: <Widget>[
          SizedBox(
            width: 10,
          ),
          // Icon(
          //   Icons.account_circle,
          //   color: Colors.black,
          //   size: 30,
          // ),
          image,
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "$name",
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          Image.asset("images/rightarrow.png", width: 35),
          SizedBox(
            width: 4,
          )
        ]),
      ),
    );
  }
}
