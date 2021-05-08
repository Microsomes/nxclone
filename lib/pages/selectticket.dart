import 'package:BubbleGum/v2/pages/overlays/ticketDetailComp/v2/BuyTicketTileMultiple.dart';
import 'package:BubbleGum/v2/pages/overlays/ticketDetailComp/v2/buyTicketTileSingle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stpage();
  }
}

class Stpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Stpagestate();
  }
}

class Stpagestate extends State<Stpage> {


  bool isTickets=true;


  void displayBuyticketDialog(BuildContext context,String selectedState) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
              final sizeW = MediaQuery.of(context).size.width;

          return StatefulBuilder(
            builder: ( context, setState){
              return Container(
            color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.96,
              child: Column(
                children: <Widget>[
                  // AppBar(
                  //   backgroundColor: Colors.white,
                  //   leading: InkWell(
                  //       onTap: () {
                  //         Navigator.pop(context, true);
                  //       },
                  //       child: PreferredSize(
                  //           preferredSize: Size.fromHeight(500),
                  //           child:
                  //               Image.asset("images/leftarrow.png", width: 4))),
                  //   title: Center(
                  //     child: Text(
                  //       "Select ticket",
                  //       style:
                  //           TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
                  //     ),
                  //   ),
                  // ),
                  PhysicalModel(
                      elevation: 2,
                      color: Colors.red,
                      shadowColor: Color.fromRGBO(215, 216, 218, 1),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                        child: Center(
                          child: Text(
                            "Select ticket",
                            style: GoogleFonts.roboto(
                              color: Color.fromRGBO(189, 156, 106, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 17
                            )
                          ),
                        ),
                        height: 55,
                        color: Colors.white,
                      ),
                       GestureDetector(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child: Image.asset("images/leftarrow.png", width: 35)),
                        ],
                      )
                    ),
                   Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: 9,
                  width: MediaQuery.of(context).size.width / 3.6,
                  color: Color.fromRGBO(187, 157, 107, 1),
                ),
                Expanded(
                                  child: Container(
                    height: 9,
                     color: Color.fromRGBO(169, 27, 26, 1),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Color.fromRGBO(123, 26, 17, 1),
          ),
 
                  Container(
                    height: 50,
                    width: sizeW,
                    color: Color.fromRGBO(169, 27, 26, 1),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // _pageController.animateToPage(0,
                            //     duration: Duration(seconds: 1),
                            //     curve: Curves.easeIn);
                            setState(() {
                              isTickets = true;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Single",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ),
                            width: sizeW / 2,
                            decoration: BoxDecoration(
                                color: isTickets == true
                                    ? Color.fromRGBO(123, 26, 17, 1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                             print("grade a");
                             setState(() {
                               isTickets=false;
                             });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Multiple",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ),
                            width: sizeW / 2,
                            decoration: BoxDecoration(
                                color: isTickets == false
                                    ? Color.fromRGBO(123, 26, 17, 1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                          ),
                        )
                      ],
                    ),
                  ),
                  isTickets==true ? Expanded(
                   child:  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                     child: BuyTicketTypesSingle(selectedState: selectedState,)
                  ),
                 ):Expanded(
                    child: Container(
                      child: BuyTicketTypesMultiple(
                        selectedState: selectedState,
                      ),
                    ),
                  )

                ],
              ));
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

    List<String> ticketTypes = [
      "West Midlands",
      "Coventry",
      "Black Country",
      "Sandwell & Dudley Low Fare Zone",
      "Walsall Low Fare Zone",
      "Midland Metro",
      "Outer Birmingham",
      "Warwick University"
    ];

    return Scaffold(

        body: SafeArea(
          child: Column(
            children: <Widget>[
              PhysicalModel(
                  elevation: 2,
                  color: Colors.red,
                  shadowColor: Color.fromRGBO(215, 216, 218, 1),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                              "Select ticket type",
                              style: GoogleFonts.roboto(
                                  color: Color.fromRGBO(189, 156, 106, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                              )
                          ),
                        ),
                        height: 55,
                        color: Colors.white,
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset("images/leftarrow.png", width: 35)),
                    ],
                  )
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 6,
                width: sizeW,
                color: Color.fromRGBO(166, 27, 27, 1),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ticketTypes.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Material(
                      child: InkWell(
                        focusColor: Colors.red,
                        onTap: () {
                       

                          var ticketN= ticketTypes[index];


                          displayBuyticketDialog(context,ticketN);

                          //show buy overflow
                        },
                        child: Container(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            height: 90,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 19,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 88,
                                        child: Text(ticketTypes[index])),
                                    Expanded(
                                      child: Text(""),
                                    ),
                                    Image.asset("images/rightred.png", width: 25),
                                    SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 2,
                                  color: Color.fromRGBO(230, 230, 230, 1),
                                )
                              ],
                            )),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
