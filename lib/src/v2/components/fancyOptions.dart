import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//ignore: must_be_immutable
class FancyOptions extends StatefulWidget{

   String title;
   bool isSelected;
   String assetRoute;
   Function clicked;
   BoxFit boxFitt;

    FancyOptions({
      @required this.title,
      @required this.isSelected,
      @required this.assetRoute,
      @required this.clicked,
      @required this.boxFitt
    });

  @override
  State<StatefulWidget> createState() {
    return FancyOptionsState();
  }
}

class FancyOptionsState extends State<FancyOptions>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.clicked();
      },
          child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width/1.2,
        decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
         
            boxShadow: [
             widget.isSelected== true ? BoxShadow(
                color: Colors.black,
                offset: new Offset(0.0, 0.0),
            ): BoxShadow(),
            ]
        ),
          child:Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(20),
                   child: Container(
                     height: 20,
                     width: 20,
                    decoration: new BoxDecoration(
                    color: widget.isSelected== true ? Colors.white : Colors.transparent,
                    shape: BoxShape.circle,
                    
                ),
                   ),
                 ),
                widget.title.length!=0? Container(
                   decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)
                   ),
                   padding: EdgeInsets.all(4),
                   child: Text(widget.title,textAlign: TextAlign.center,style:GoogleFonts.acme(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),),
                 ):Container()
                ],
              )
            ],
          ),
      ),
    );
  }
}