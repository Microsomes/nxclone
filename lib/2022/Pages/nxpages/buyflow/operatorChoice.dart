import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase1.dart';
import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase2.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../front.dart';

class OperatorChoice extends StatefulWidget {
  @override
  State<OperatorChoice> createState() => _MyProfileState();
}

class _MyProfileState extends State<OperatorChoice> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 80,
              color: Color.fromRGBO(168, 28, 25, 1),
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NxPagesFront()),
                        );
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
                                style: GoogleFonts.roboto(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top: 50,
                  child: Text("Operator choice",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                           onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyFlowPhase1(
                              subtitle: 'Multi Operator 1 Week and 4 Week',
                            )));
                          },
                          leading: Image.asset(
                            "images/front/header.png",
                            width: 100,
                          ),
                          title: Text("Multi Operator 1 Week and 4 Week"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                         ListTile(
                           onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyFlowPhase1(
                              subtitle: 'NX 1 Week and 4 Week',
                            )));
                          },
                          leading: Image.asset(
                            "images/front/header.png",
                            width: 100,
                          ),
                          title: Text("NX 1 Week and 4 Week"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                         ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyFlowPhase1(
                              subtitle: 'Singles & Daysavers',
                            )));
                          },
                          leading: Image.asset(
                            "images/front/header.png",
                            width: 100,
                          ),
                          title: Text("Singles & Daysavers"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
