import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class StaticTicketColor extends StatefulWidget {
  final Function pickedColor;

  StaticTicketColor({@required this.pickedColor});

  @override
  _StaticTicketColorState createState() => _StaticTicketColorState();
}

class _StaticTicketColorState extends State<StaticTicketColor> {
  RandomColor _randomColor = RandomColor();


  Color random1;
  Color random2;
  Color random3;


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    random1= _randomColor.randomColor();
    random2= _randomColor.randomColor();
    random3= _randomColor.randomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         this.widget.pickedColor(this.random1,this.random2,this.random3);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(boxShadow: []),
        height: 50,
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Container(
                   decoration: BoxDecoration(
                      color: random1,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  height: 200,
                ),
              ),
              Expanded(
                child: Container(
                  color: random2,
                  height: 200,
                ),
              ),
              Expanded(
                child: Container(
                  
                  height: 200,
                  decoration: BoxDecoration(
                      color: random3,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
