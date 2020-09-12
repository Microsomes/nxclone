import 'package:flutter/material.dart';

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
        height: 150,
        width: MediaQuery.of(context).size.width/1.2,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(widget.assetRoute),
              fit:widget.boxFitt
            ),
            boxShadow: [
             widget.isSelected== true ? BoxShadow(
                color: Colors.black,
                offset: new Offset(3.0, 3.0),
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
                    color: widget.isSelected== true ? Colors.black : Colors.transparent,
                    shape: BoxShape.circle,
                    
                ),
                   ),
                 ),
                widget.title.length!=0? Container(
                   decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                   ),
                   padding: EdgeInsets.all(4),
                   child: Text(widget.title,textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                 ):Container()
                ],
              )
            ],
          ),
      ),
    );
  }
}