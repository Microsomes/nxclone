import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationOverlay {


    void onChangeSliderSpeed(a){

    }


  void display(BuildContext context) {
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
            height: MediaQuery.of(context).size.height * 0.9,
            child: Center(
                child: Column(
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Text(
                    "Tweak NXBUS Animation settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                SizedBox(height: 30,),
                Expanded(
                    child: ListView(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Align(
                        alignment: Alignment(-1.5, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Adjust the slider"),
                            Slider(
                              onChanged:onChangeSliderSpeed,
                              value: 0,
                            )
                          ],
                        )),
                  ),
                  
                ]))
              ],
            )),
          );
        });
  }
}
