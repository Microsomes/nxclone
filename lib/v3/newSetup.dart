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
      body: SingleChildScrollView(
              child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              color: Colors.white,
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
                    
            ),
            
          ],
        ),
      ),
    );
  }
}
