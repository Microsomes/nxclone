import 'dart:async';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class MyCards extends StatefulWidget {
  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {


  @override
  void initState() {
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
            Container(
              width: double.infinity,
              height: 80,
              color: Color.fromRGBO(169, 27, 26, 1),
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
                    )),
                Positioned(
                  top: 50,
                  child: Text("My cards",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height*0.25),
                  Image.asset("images/front/mycards.png",
                  width: 120,
                  ),
                  SizedBox(height: 60,),
                  Text("Saved cards will appear here",style: GoogleFonts.roboto(
                    fontSize: 16,
                    color:Colors.black.withOpacity(0.6),
                  ))
                ],
              )
            ),
          )
        ],
      )
    );
  }
}