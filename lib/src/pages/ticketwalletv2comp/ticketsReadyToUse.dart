import 'package:bubble_gum/components/daysaveractive.dart';
import 'package:bubble_gum/pages/components/singleInactive.dart';
import 'package:bubble_gum/v2/helper/NxHelp.dart';
import 'package:bubble_gum/v2/pages/ticketv2.dart';
import 'package:bubble_gum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';

class TicketReadyToUse extends StatefulWidget {
  @override
  _TicketReadyToUseState createState() => _TicketReadyToUseState();
}

class _TicketReadyToUseState extends State<TicketReadyToUse> {
  bool isTik = true;

  @override
  Widget build(BuildContext context) {
    return isTik == false
        ? Container()
        : FutureBuilder(
            future: NXHelp().getActiveAndUsableTicketsv2(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              List<TicketWalletModel> data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 12),
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.92,
                          child: data[index].activeStatus == -1
                              ? SingleInactiveTicket(
                                  id: data[index].id, isUsed: false)
                              : Container(
                                  child: GestureDetector(
                                  onTap: () {
                                    print("open ticket then");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => ActualTicket(
                                                txid: data[index].id)));
                                  },
                                  child: TicketTwo(
                                    id: data[index].id,
                                    onExpire: (id) {
                                      print("expired");
                                      setState(() {
                                        isTik = false;
                                      });
                                      Future.delayed(Duration(seconds: 1), () {
                                        setState(() {
                                          isTik = true;
                                        });
                                      });
                                    },
                                  ),
                                )),
                        ),
                      ),
                    );
                  });
            },
          );
  }
}
