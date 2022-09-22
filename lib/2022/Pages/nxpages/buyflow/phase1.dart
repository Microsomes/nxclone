
import 'dart:convert';

import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future readTicketFile() async {
    final String response = await rootBundle.loadString("assets/tickets.json");
    final data = await jsonDecode(response);

    final sections = data['sections'];

    final pickedOne = sections[widget.subtitle];

    return pickedOne;
  }


  @override
  void initState() {
    super.initState();
  }

  

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
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: FutureBuilder(
                      future: readTicketFile(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Container(
                            height: 100,
                            child: Center(child: CircularProgressIndicator(
                              color: Color.fromRGBO(168, 25, 26, 1),
                            )),
                          );
                        }

                        Map sections = snapshot.data['sections'];

                        var niceSections = [];

                        for(var key in sections.keys){
                          niceSections.add({
                            "name":key
                          });
                        }                    

                        return Column(
                      children: [
                        SizedBox(height: 10,),
                       for(var i=0;i<niceSections.length;i++)
                       Builder(builder: (ctx){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> BuyFlowPhase2(
                              title: widget.subtitle,
                              subtitle: niceSections[i]['name']) ));
                          },
                          child: Container(
                            height: 68,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    child: Text(niceSections[i]['name'],
                                    style: GoogleFonts.roboto(
                                      fontSize: 17
                                    ),
                                    ),
                                  ),
                                ),
                                Divider()
                              ],
                            ),
                                ),
                                Container(
                                  width: 40,
                                  child: Center(
                                    child: RotatedBox(
                                      child: SvgPicture.asset("images/front/back.svg",
                                      color: Color.fromRGBO(168, 0, 8, 1),
                                      ),
                                      quarterTurns: 2,
                                      ),
                                  ),
                                )
                              ],
                            )
                          ),
                        );
                       })
                      ],
                    );
                      },
                    )
                  ),
                )
              )
            )
          ],
        )));
  }
}


