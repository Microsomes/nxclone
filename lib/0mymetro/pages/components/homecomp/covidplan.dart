import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CovidPlanner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Coronavirus: Plan When To Travel",
            style: GoogleFonts.roboto(
              fontSize: 25
            ),
            ),
          ),
          SizedBox(height:5),
          Container(
              padding: EdgeInsets.only(left:10,right:10),
              child: Text("Let us know when you will be travelling by tram, to support our efforts in delivering the best possible service.",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
                fontSize: 17
              ),
              )),
          SizedBox(height:15),
          Container(
              padding: EdgeInsets.only(left:10,right:10),
              child: Text("The information you provide helps us to plan for future journeys.",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                  fontSize: 17
                ),
              )),

            Expanded(child: Container(),),
          Container(
            margin: EdgeInsets.only(left:20,right:20,bottom: 10),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
               child: ElevatedButton(
                style: ButtonStyle(
                  
                ),
              
                onPressed: (){

                },
                child: Text("Travel Plans & Quieter Periods",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700
                ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
  
}