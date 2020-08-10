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
                                      padding: const EdgeInsets.only(
                                          left: 18, right: 0),
                                      child: Container(
                                          child: Column(
                                        children: <Widget>[
                                          Nxsig(
                                            isRounded: false,
                                            state: "WEST MIDLANDS",
                                            isBottomRounded: true,
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                // ListView(children: <Widget>[
                //   ListTile(
                // leading: Icon(Icons.settings),
                // title: Align(
                //     alignment: Alignment(-1.5, 0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text("Adjust the slider"),
                //         Slider(
                //           onChanged: onChangeSliderSpeed,
                //           value: 0,
                //         ),
                //       ],
                //     )),
                //   ),
                // ])
              ],
            )),
          );
        });
  }
}
