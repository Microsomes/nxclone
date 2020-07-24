import 'package:flutter/material.dart';


class ColorSelectOver{

  void ColorOverlay(BuildContext context){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {

          return  Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            height: MediaQuery.of(context).size.height * 0.37,
            child: Column(
              children: <Widget>[

              ],
            ));
    
            });
        }
  }

