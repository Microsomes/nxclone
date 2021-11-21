import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

class ActionOverlay {
  void display(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            height: MediaQuery.of(context).size.height * 0.37,
            child: Center(
                child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.launch,color: Color.fromRGBO(40, 128, 105, 1),),
                    title: Align(
                        alignment: Alignment(-1.5, 0),
                        child: Text("NX Rewards Cashback",
                        style: GoogleFonts.roboto(
                          color: Color.fromRGBO(44, 115, 148, 1),
                          fontWeight: FontWeight.bold
                        ),
                        )),
                  ),
                  ListTile(
                    leading: Transform.rotate(
                        angle: 45 * math.pi / 180, child: Icon(Icons.replay,color: Color.fromRGBO(40, 128, 105, 1),)),
                    title: Align(
                        alignment: Alignment(-1.5, 0),
                        child: Text("   Purchase Again",
                        style: GoogleFonts.roboto(
                          color: Color.fromRGBO(44, 115, 148, 1),
                          fontWeight: FontWeight.bold
                        ),
                        )),
                  ),
                  ListTile(
                    leading: Icon(Icons.send,color: Color.fromRGBO(40, 128, 105, 1),),
                    title: Align(
                        alignment: Alignment(-1.5, 0),
                        child: Text(" Request ticket receipt",
                        style: GoogleFonts.roboto(
                          color: Color.fromRGBO(44, 115, 148, 1),
                          fontWeight: FontWeight.bold
                        ),
                        )),
                  ),
                  ListTile(
                    onTap: (){
                                Navigator.pop(context);
                    },
                      leading: Icon(Icons.close,color: Color.fromRGBO(40, 128, 105, 1),),
                      title: Align(
                          alignment: Alignment(-1.5, 0), child: Text("       Close",style: GoogleFonts.roboto(
                          color: Color.fromRGBO(44, 115, 148, 1),
                          fontWeight: FontWeight.bold
                        ),)),
                    )
                ]))
              ],
            )),
          );
        });
  }
}
