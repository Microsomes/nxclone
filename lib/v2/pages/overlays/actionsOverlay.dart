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
                    leading: Icon(Icons.launch),
                    title: Align(
                        alignment: Alignment(-1.5, 0),
                        child: Text("NX Rewards Cashback",
                        style: GoogleFonts.roboto(
                          color: Colors.red
                        ),
                        )),
                  ),
                  ListTile(
                    leading: Transform.rotate(
                        angle: 45 * math.pi / 180, child: Icon(Icons.replay)),
                    title: Align(
                        alignment: Alignment(-1.5, 0),
                        child: Text("   Purchase Again")),
                  ),
                  ListTile(
                    leading: Icon(Icons.send),
                    title: Align(
                        alignment: Alignment(-1.5, 0),
                        child: Text(" Request ticket receipt")),
                  ),
                  ListTile(
                    onTap: (){
                                Navigator.pop(context);
                    },
                      leading: Icon(Icons.close),
                      title: Align(
                          alignment: Alignment(-1.5, 0), child: Text("       Close")),
                    )
                ]))
              ],
            )),
          );
        });
  }
}
