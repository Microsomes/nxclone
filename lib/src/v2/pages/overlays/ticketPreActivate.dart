import 'package:flutter/material.dart';
import 'package:bubble_gum/v2/helper/NxHelp.dart';
import 'package:bubble_gum/v2/pages/ticketv2.dart';

class TicketOverlayHelper {
  void displayActivationDialog(BuildContext context, int txid) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "ADULT WEST MIDLANDS SINGLE JOURNEY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(62, 68, 91, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 10),
                    child: Text(
                      "Ticket Activation",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      "Please activate your ticket before just before boarding. A ticket remains active for only 30 minutes.",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, height: 1.5),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      "You may only activate your mTicket\nonce so please do not continue unless\nyou are travelling.",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, height: 1.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 60),
                  child: InkWell(
                    onTap: () {
                      //displayActivationDialog(context);

                      /**
                         * Before activating ticket lets deactivate the other tickets
                         * 
                         */

                      NXHelp().activeTicketv2(id: txid).then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActualTicket(
                                    txid: txid,
                                  )),
                        );
                      });
                    },
                    child: Container(
                      color: Color.fromRGBO(46, 150, 32, 1),
                      height: 60,
                      child: Center(
                        child: Text(
                          "Activate Ticket",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0.3),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            width: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Color.fromRGBO(81, 108, 137, 1),
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Text(
                            "Close",
                            style: TextStyle(
                                color: Color.fromRGBO(103, 119, 138, 1),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ))
              ],
            )),
          );
        });
  }
}
