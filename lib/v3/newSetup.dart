import 'package:BubbleGum/v2/pages/setupflow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'advancedSetup.dart';

class NewSetupv3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("(Setup)"),
      ),
      backgroundColor: Color.fromRGBO(38, 38, 38, 1),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
               width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("BASIC SETUP",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("This is the same setup your used too. This is highly recommended for those that need something simple.",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                     ),
                     textAlign: TextAlign.center,
                     ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: RaisedButton(
                          color: Color.fromRGBO(38, 38, 38, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ) ,
                          onPressed: (){
                            //load the new flow
                           // SetupFlow
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetupFlow()));
                          },
                          child: Text("Enter Basic Setup",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], color: Colors.black, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Expanded(
            child: Container(
               width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("ADVANCED SETUP",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Advanced users only, You can tweak things such as animation speeds and other things, this may make the app more realistic but its subjective, the basic one passes just fine. ALthough educational purposes only!!!",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                     ),
                     textAlign: TextAlign.center,
                     ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: RaisedButton(
                          color: Color.fromRGBO(38, 38, 38, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ) ,
                          onPressed: (){
                            //load the new flow
                           // SetupFlow
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdvancedSetup()));
                          },
                          child: Text("Enter Advanced Setup",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], color: Colors.black, borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
