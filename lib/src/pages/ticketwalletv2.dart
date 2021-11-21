import 'package:flutter/material.dart';
import '../pages/ticketwallet.dart';
import 'ticketwalletv2comp/ticketsAlreadyUsed.dart';
import 'ticketwalletv2comp/ticketsReadyToUse.dart';

class TicketWalletV2 extends StatefulWidget {
  @override
  _TicketWalletV2State createState() => _TicketWalletV2State();
}

class _TicketWalletV2State extends State<TicketWalletV2> {
  bool isTickets = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 26, 17, 1),
      appBar: TicketWalletAppBar().build(context),
      body: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(169, 27, 26, 1),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // _pageController.animateToPage(0,
                      //     duration: Duration(milliseconds: 1),
                      //     curve: Curves.easeIn);
                      setState(() {
                        isTickets = true;
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Tickets",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: isTickets == true
                              ? Color.fromRGBO(123, 26, 17, 1)
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(10))),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTickets = false;
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "History",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: isTickets == false
                              ? Color.fromRGBO(123, 26, 17, 1)
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10))),
                    ),
                  ),
                )
              ],
            ),
          ),
         isTickets==true ? Expanded(
            child: Container(
               child: TicketReadyToUse(),
            ),
          ):Expanded(
            child: TicketAlreadyUsed(),
          )
        ],
      ),
    );
  }
}
