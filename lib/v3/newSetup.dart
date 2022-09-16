import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'advancedSetupC/advancedSetupPage.dart';

class NewSetupv3 extends StatefulWidget {


  final bool hideDetails;

  NewSetupv3({
    this.hideDetails=false
  });

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
            "BubbleGum 2022",
            style: GoogleFonts.roboto(),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
              SizedBox(height: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: AdvancedSetupPage(
                hideDetails: widget.hideDetails,
              ),
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
