import 'dart:ui';

import 'package:BlackPie/v2/components/movingText.dart';
import 'package:BlackPie/v2/components/nxsig.dart';
import 'package:BlackPie/v2/components/ticketColor.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationOverlay {
  void onChangeSliderSpeed(a) {}

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
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(117, 28, 21, 1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                          left: 10,
                          child: MovingText(
                            textContent: "MOVING TEST",
                            isUpper: true,
                          ))
                    ],
                  ),
                ),
                Slider(
                    onChanged: onChangeSliderSpeed,
                    value: 0,
                    activeColor: Color.fromRGBO(117, 28, 21, 1)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 3),
                          child: TicketColor(
                            ctx: context,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, right: 0),
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Nxsig(
                                isRounded: false,
                                state: "test oc",
                                company: "pie company",
                                isBottomRounded: true,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Slider(
                    onChanged: onChangeSliderSpeed,
                    value: 0,
                    activeColor: Color.fromRGBO(117, 28, 21, 1)),
                Expanded(
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(110),
                      border: Border.all(color: Color.fromRGBO(117, 28, 21, 1), width: 5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: IconButton(
                    color: Color.fromRGBO(117, 28, 21, 1),
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )),
          );
        });
  }
}
