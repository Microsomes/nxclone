import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";

class NxPagesFront extends StatefulWidget {
  @override
  State<NxPagesFront> createState() => _NxPagesFrontState();
}

class _NxPagesFrontState extends State<NxPagesFront> {


  var message = "We join the nation in mouring the death of Her Majesty Queen Elizabeth. Our heartfelt thoughts and sympathies are with the Royal Family at this time.";

  var options = [
    {
      "label":"Singles & Daysavers"
    },
    {
      "label":"NX 1 Week and 4 Week"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
              color: Colors.white,
              height: 95,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Image.asset(
                          "images/front/header.png",
                          width: 150,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  Positioned(
                    right: -20,
                    bottom: -1,
                    child: Container(
                      child: SizedBox(
                          height: 50,
                          width: 100,
                          child: Icon(
                            Icons.menu,
                            color: Color.fromRGBO(168, 27, 26, 1),
                            size: 30,
                          )),
                    ),
                  )
                ],
              )),
          Expanded(
              child: Container(
            color: Color.fromRGBO(168, 27, 26, 1),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(188, 156, 107, 0.7),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:20),
                        alignment: Alignment.topCenter,
                        color: Colors.transparent,
                        width: 40,
                        child: Icon(Icons.info_outline),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left:0,
                            right: 10
                          ),
                          color: Colors.transparent,
                          child: Text(message,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),
                        ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (ctx,index){
                    return Text(options[index]['label']);
                  
                  }),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
