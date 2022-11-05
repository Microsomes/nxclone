import 'package:BubbleGum/2022/Pages/nxpages/myprofile_loggedin.dart';
import 'package:BubbleGum/v2/pages/menupage/socialMediaPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../2022/Pages/nxpages/SocialMedia.dart';
import '../../../2022/Pages/nxpages/front.dart';
import '../../../2022/Pages/nxpages/myprofile.dart';


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

  final Box = GetStorage();

  bool isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var sections = [
    {
      "section": "Account",
      "links": [
        {
          "type": "link",
          "label": "My Profile",
          "icon": "images/front/account.svg",
          "action": (BuildContext ctx, bool isLoggedIn){

            if(isLoggedIn){
             Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfileLoggedIn()));
            }else{
              Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfile()));
            }
          }
        },
         {
          "onlyLoggedIn": true,
          "type": "link",
          "label": "Marketing Preferences",
          "icon": "images/front/app-info.svg",
          "action": (BuildContext ctx, bool isLoggedIn){

            launchURL("https://nxbus.co.uk");
            
          }
        }
      ]
    },
    {
      "section": "Tools",
      "links": [
        {
          "type": "link",
          "label": "nxbus.co.uk",
          "icon": "images/front/website.svg",
          "action": (BuildContext ctx, bool isLoggedIn){
            var url = "https://nxbus.co.uk";
            launchURL(url);
          }
        },
        {
          "type": "link",
          "label": "Social media",
          "icon": "images/front/social-media.svg",
          "action": (BuildContext context, bool isLoggedIn){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SocialMediaPagev2()));
          }
        },
        {
          "type": "link",
          "label": "Payzone Barcode",
          "icon": "images/front/DBarcode.svg",
          "action": (BuildContext context, bool isLoggedIn){
            Navigator.push(context,MaterialPageRoute(builder: (ctx)=> MyProfile()));
          }
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromRGBO(168, 27, 28, 1),
        body: Center(
            child: Column(
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
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> NxPagesFront()));
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
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    top: 50,
                    child: Text("Utilities",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Expanded(
              child:CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child:  UtilitiesList(
                      SpacingTop: true,
                      sections: sections),
                  )
                ],
              )
            )
          ],
        )));
  }
}

class UtilitiesList extends StatefulWidget {
  final SpacingTop ;
   UtilitiesList({
    Key key,
    @required this.sections,
    @required this.SpacingTop,
  }) : super(key: key);

  final List<Map<String, Object>> sections;

  @override
  State<UtilitiesList> createState() => _UtilitiesListState();
}

class _UtilitiesListState extends State<UtilitiesList> {
  final Box = GetStorage();

  bool isLoggedIn = false;

@override
  void initState() {
    super.initState();

    if(Box.read("isLoggedIn") != null){
      setState(() {
        isLoggedIn = Box.read("isLoggedIn");
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
         widget.SpacingTop == true ? SizedBox(height: 30,):Container(),
          for (var i = 0; i < widget.sections.length; i++)
            Builder(builder: (ctx) {
              List links = widget.sections[i]['links'];
              

              return Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: i ==0 ? 0 :20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.sections[i]['section'],
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    for (var l = 0; l < links.length; l++)
                   Builder(builder: (ctx){

                    if(links[l]['onlyLoggedIn'] == true  && isLoggedIn == false){
                      return Container();
                    }

                    return  GestureDetector(
                        onTap: (){

                         var isLoggedIn =  Box.read("isLoggedIn");

                          links[l]['action'](ctx,isLoggedIn == null ? false : isLoggedIn);
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0),
                                    child: SvgPicture.asset(
                                      links[l]['icon'],
                                      color: Color.fromRGBO(147, 24, 23, 1),
                                      // color: links[i]['iconColor'],
                                      height: 22,
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    links[l]['label'],
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 35,
                                  color: Color.fromRGBO(172, 22, 32, 1),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(158, 25, 26, 1),
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  offset: Offset(0,
                                      1), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          height: 45,
                          margin: EdgeInsets.only(
                              top: l == 0 ? 0 : 20,
                              left: 0,
                              right: 10),
                        ),
                      );

                   })
                     
                  ],
                ),
              );
            })
        ],
      ),
    );
  }
}

