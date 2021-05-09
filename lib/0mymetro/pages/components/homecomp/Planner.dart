import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Planner extends StatefulWidget{
  @override
  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left:10,right:10),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Planner",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 27
            ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: TextInputPlanner(
                      hintText: "Departing from",
                    ),
                  ),
                  Expanded(
                    child: TextInputPlanner(
                      hintText: "Arriving at",
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextInputPlanner extends StatelessWidget {
  final String  hintText;
  final Function onTextUpdate;
  const TextInputPlanner({
    @required this.hintText,
    this.onTextUpdate,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(10),
      child: Theme(
        data: ThemeData(
            primaryColor: Colors.black.withOpacity(0.7),
            accentColor: Colors.orange,
            hintColor: Colors.green
        ),
        child: TextField(
          onChanged: (ff){
            if(this.onTextUpdate!=null){
              this.onTextUpdate(ff);
            }
          },
          decoration: InputDecoration(
            border: UnderlineInputBorder(

            ),
            hintText: "$hintText",
            hintStyle: GoogleFonts.roboto(
              color: Colors.black
            )
          ),
        ),
      ),
    );
  }
}