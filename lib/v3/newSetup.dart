import 'package:BubbleGum/v2/pages/setupflow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'advancedSetup.dart';

class NewSetupv3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BubbleGum Clone App",
          style: GoogleFonts.roboto(),
        ),
      ),
      backgroundColor: Color.fromRGBO(38, 38, 38, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Center(
                      child: RaisedButton(
                        color: Color.fromRGBO(38, 38, 38, 1).withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          //load the new flow
                          // SetupFlow
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetupFlow()));
                        },
                        child: Text(
                          "Enter Basic Setup",
                          style: GoogleFonts.roboto(),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Basic Setup ^ the same old setup as before.",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
              Text("OR",style: GoogleFonts.roboto(
                fontSize: 30,
                color: Colors.white70
              ),),
              SizedBox(height: 10,),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Advanced Setup",
                        style: GoogleFonts.roboto(fontSize: 30),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left:30),
                    alignment: Alignment.topLeft,
                    child: Text(
                        "Setup with a brand new intuitive layout, set the default ticket, ejection mode and much more.",
                        style: GoogleFonts.roboto(fontSize: 12,
                        color: Colors.black
                        ),
                      ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
