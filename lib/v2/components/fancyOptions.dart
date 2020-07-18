import 'package:flutter/material.dart';

class FancyOptions extends StatefulWidget{

  String title;
  bool isSelected;

    FancyOptions({
      @required this.title,
      @required this.isSelected
    });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FancyOptionsState();
  }
}

class FancyOptionsState extends State<FancyOptions>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width/1.2,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20)
      ),
        child:Column(
          children: <Widget>[
            Row(
              children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Container(
                   height: 10,
                   width: 10,
                  decoration: new BoxDecoration(
                  color: widget.isSelected== true ? Colors.white : Colors.black,
                  shape: BoxShape.circle,
              ),
                 ),
               ),
               Text(widget.title,style: TextStyle(color: Colors.white),)
              ],
            )
          ],
        ),
    );
  }
}