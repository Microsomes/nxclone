import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../2022helper.dart';

class ViewAllTickets extends StatefulWidget {
  @override
  _ChangeLogsState createState() => _ChangeLogsState();
}

class _ChangeLogsState extends State<ViewAllTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("All Tickets"),
        ),
        body: FutureBuilder(
          future: NXALLRawTickets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data['sections'].length);
              return ListView(
                children: [
                  for (var i = 0; i < snapshot.data['sections'].length; i++)
                    Builder(builder: (ctx) {
                      
                      //get all keys for section
                      var keys = snapshot.data['sections'].keys.toList();
                      var key = keys[i];

                      return Container(
                        child: Center(
                          child: Text(key,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20
                          ),),
                        ),
                        height: 300,
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black87,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent,
                              blurRadius: 2,
                              spreadRadius: 5
                            )
                          ]
                          
                        ),
                      );
                    })
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
