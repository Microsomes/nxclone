import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class TicketInfoPage extends StatelessWidget {

  List infos;

  TicketInfoPage({@required this.infos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(168, 27, 28, 1),
        body: Center(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 80,
                color: Color.fromRGBO(185, 0, 9, 1),
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      right: -50,
                      top: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              
                              SizedBox(
                                width: 2,
                              ),
                              Icon(Icons.close,
                              color: Colors.white,)
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    top: 50,
                    child: Text("Info",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Expanded(
              child:Container(
                color: Colors.white,
              )
            )
          ],
        )));
  }

}