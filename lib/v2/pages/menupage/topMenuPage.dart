import 'package:BubbleGum/2022/Pages/nxpages/myprofile_loggedin.dart';
import 'package:BubbleGum/v2/pages/menupage/socialMediaPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SocialMediaPage()));
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
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          child: Positioned(
                            top: 4,
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

class UtilitiesList extends StatelessWidget {
  final SpacingTop ;
   UtilitiesList({
    Key key,
    @required this.sections,
    @required this.SpacingTop,
  }) : super(key: key);

  final List<Map<String, Object>> sections;

  final Box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
         SpacingTop == true ? SizedBox(height: 30,):Container(),
          for (var i = 0; i < sections.length; i++)
            Builder(builder: (ctx) {
              List links = sections[i]['links'];

              return Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: i ==0 ? 0 :20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sections[i]['section'],
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    for (var l = 0; l < links.length; l++)
                      GestureDetector(
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
                                      // color: links[i]['iconColor'],
                                      height: 25,
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
                      )
                  ],
                ),
              );
            })
        ],
      ),
    );
  }
}

