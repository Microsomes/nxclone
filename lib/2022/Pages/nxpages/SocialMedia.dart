import 'package:BubbleGum/2022/Pages/nxpages/tripWallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class SocialMediaPagev2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SocialMediaPageState();
  }
}

class SocialMediaPageState extends State<SocialMediaPagev2> {

  List allSocials = [
    {
      "name": "Facebook",
      "icon":"images/front/facebook.svg",
      "action":(){
        launchURL("https://www.facebook.com/JustRideUK/");
      }
    },
    {
      "name" : "Twitter",
      "icon":"images/front/twitter.svg",
      "action":(){
        launchURL("https://twitter.com/JustRideUK");
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 80,
              color: Colors.white,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              "images/front/back.svg",
                              width: 21,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Back",
                              style: GoogleFonts.roboto(fontSize: 16,
                              color: Colors.black
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 50,
                  child: Text("Social media",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(169, 27, 26, 1),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Column(children: [
                          SizedBox(height: 25,),
                          for(var i=0;i<allSocials.length;i++)
                          Builder(builder: (context){
                            return GestureDetector(
                              onTap: (){
                                allSocials[i]["action"]();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: Row(
                                  
                                  children: [
                                    SizedBox(width:25,),
                                    SvgPicture.asset(allSocials[i]['icon'],
                                    color: Color.fromRGBO(174, 25, 19, 1),
                                    width: 20,
                                    ),
                                    SizedBox(width: 10,),
                                    Text(allSocials[i]['name'],
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                    ),
                                    ),
                                    Expanded(child: Container(),),
                                    Icon(Icons.chevron_right,
                                    size: 40,
                                    color: Color.fromRGBO(174, 25, 19, 1),
                                    ),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                    BoxShadow(
                                  color: Color.fromRGBO(112, 12, 22, 1).withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(-1, 1), // changes position of shadow
                                ),
                                ]
                                ),
                                margin: EdgeInsets.only(
                                  top:  i==0 ? 0 : 20,
                                  left: 10,
                                  right: 10
                                ),
                              ),
                            );
                          })
                        ],),
                      )
                    ],
                  ),
                ),
              )
        ],
      )
    );
  }
}