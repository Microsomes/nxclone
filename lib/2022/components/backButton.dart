import "package:flutter/material.dart";

import "dart:io";



// ignore: must_be_immutable
class BackButtonCus extends StatefulWidget {

  final Function onPressed;

  

  BackButtonCus(@required this.onPressed);
  @override
  State<BackButtonCus> createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButtonCus> {

  var platform;

  @override
  void initState() {

    //get platform

    if(Platform.isIOS){
        platform = "ios";
    }else{
        platform = "android";
    }


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onPressed();
      },
      child: Container(
        child: Text("Back"),
      ),
    );
  }
}