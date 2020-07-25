import 'package:flutter/material.dart';
import 'package:BlackPie/v2/pages/buyflow/tickettypes.dart';

class SelectTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return stpage();
  }
}

class stpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _stpagestate();
  }
}

class _stpagestate extends State<stpage> {
  void displayBuyticketDialog(BuildContext context,String selectedState) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.96,
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.white,
                    leading: InkWell(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: PreferredSize(
                            preferredSize: Size.fromHeight(500),
                            child:
                                Image.asset("images/leftarrow.png", width: 4))),
                    title: Center(
                      child: Text(
                        "Select ticket type",
                        style:
                            TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
                      ),
                    ),
                  ),

                 Expanded(
                   child:  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                     child: BuyTicketTypes(selectedState: selectedState,)
                  ),
                 )

                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

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

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Image.asset("images/leftarrow.png", width: 4))),
          title: Center(
            child: Text(
              "Select ticket type",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
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
                        print("click");
                        print(index.toString());

                        var ticketN= ticketTypes[index];

                        print("seleced: $ticketN ");

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
        ));
  }
}
