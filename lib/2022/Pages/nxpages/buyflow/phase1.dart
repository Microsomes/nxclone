
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class BuyFlowPhase1 extends StatefulWidget {


  String subtitle;

  BuyFlowPhase1({@required this.subtitle});


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

class UtilitiesMenuState extends State<BuyFlowPhase1> {


  @override
  void initState() {
    super.initState();

    //load json assets/ticket.json


  }

  var sections = [
    {
      "section": "Departure Information",
      "links": [
        {
          "type": "link",
          "label": "Timetables",
          "icon": "images/front/clock.svg",
          "action": (){}
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
          "action": (){}
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromRGBO(168, 0, 0, 1),
        body: Center(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 80,
                color: Colors.transparent,
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
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Back",
                                  style: GoogleFonts.roboto(fontSize: 16,
                                  color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 50,
                    child: Text("Select ticket type",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              color: Color.fromRGBO(141, 0, 7,1),
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left:10),
                child: Text(widget.subtitle,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 15
                ),
                ),
              ),
            ),
            Expanded(
              child:Container(
                color: Colors.white,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child:  UtilitiesList(sections: sections),
                    )
                  ],
                ),
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
                      Container(
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

