import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';



class TripTools extends StatefulWidget {
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

class UtilitiesMenuState extends State<TripTools> {
  var sections = [
    {
      "section": "Departure Information",
      "links": [
        {
          "type": "link",
          "label": "Timetables",
          "icon": "images/front/clock.svg",
          "action": (BuildContext ctx){
            print("timetables");
            launchURL("http://nxbus.co.uk/west-midlands/plan-your-journey#");
          }
        }
      ]
    },
    {
      "section": "Service changes",
      "links": [
        {
          "type": "link",
          "label": "Service changes",
          "icon": "images/front/customer-alerts.svg",
          "action": (BuildContext ctx){
           launchURL("http://nxbus.co.uk/west-midlands/information/service-changes");
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
                    child: Text("Trip tools",
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
                    child:  UtilitiesList(sections: sections),
                  )
                ],
              )
            )
          ],
        )));
  }
}

class UtilitiesList extends StatelessWidget {
  const UtilitiesList({
    Key key,
    @required this.sections,
  }) : super(key: key);

  final List<Map<String, Object>> sections;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(height: 30,),
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
                          links[l]['action'](context);
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
                                      height: 22,
                                      color: Color.fromRGBO(169, 26, 25, 1),
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

