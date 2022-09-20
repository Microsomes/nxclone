import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class MyProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(169, 26, 25, 1),
      body: Column(
        children: [
           Container(
                width: double.infinity,
                height: 82,
                color: Colors.transparent,
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      right: 0,
                      top: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          child: Positioned(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                ),
                                Icon(Icons.close,
                                size: 25,
                                color: Colors.white.withOpacity(0.95),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 50,
                    child: Text("My profile",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
          Expanded(
            child:Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}