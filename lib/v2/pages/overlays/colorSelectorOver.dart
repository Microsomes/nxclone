import 'package:flutter/material.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorSelectOver {
  Color pickerColor= Colors.red;


  Function toSend;

  int index;

  ColorSelectOver({
    @required this.toSend,
    @required this.index
  });
 


  void colChange(Color col) {
    this.toSend(col,this.index);
  }

  void ColorOverlay(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  Text(
                    "Select a color",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 30,),
                  Expanded(
                    child: ColorPicker(
                      pickerColor: pickerColor,
                      onColorChanged: colChange,
                      showLabel: true,
                      pickerAreaHeightPercent: 0.8,
                    ),
                  )
                ],
              ));
        });
  }
}
