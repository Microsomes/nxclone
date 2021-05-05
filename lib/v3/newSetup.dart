import 'package:BubbleGum/v2/pages/setupflow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'advancedSetup.dart';
import 'advancedSetupC/advancedSetupPage.dart';

class NewSetupv3 extends StatefulWidget {
  @override
  _NewSetupv3State createState() => _NewSetupv3State();
}

class _NewSetupv3State extends State<NewSetupv3> {






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Center(
          child: Text(
            "BubbleGum Clone App",
            style: GoogleFonts.roboto(),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //     padding: EdgeInsets.all(5),
          //     margin: EdgeInsets.all(20),
          //     decoration: BoxDecoration(
          //         color: Colors.redAccent,
          //         borderRadius: BorderRadius.circular(5),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.5),
          //             spreadRadius: 5,
          //             blurRadius: 7,
          //             offset: Offset(0, 3), // changes position of shadow
          //           ),
          //         ]),
          //     child: Column(
          //       children: [
          //         Container(
          //           margin: EdgeInsets.all(20),
          //           child: Center(
          //             child: RaisedButton(
          //               color: Colors.yellowAccent,
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(20)),
          //               onPressed: () {
          //                 //load the new flow
          //                 // SetupFlow
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => SetupFlow()));
          //               },
          //               child: Text(
          //                 "Enter Basic Setup",
          //                 style: GoogleFonts.roboto(
          //                   color: Colors.black
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Text(
          //           "Basic Setup ^ the same old setup as before.",
          //           style: GoogleFonts.roboto(
          //             color: Colors.white,
          //             fontSize: 20,
          //           ),
          //           textAlign: TextAlign.center,
          //         )
          //       ],
          //     )),
          //     Text("OR",style: GoogleFonts.roboto(
          //       fontSize: 30,
          //       color: Colors.white70
          //     ),),
              SizedBox(height: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: AdvancedSetupPage(),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    // topRight: Radius.circular(20),
                    // topLeft: Radius.circular(20),
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
