import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase5Success.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyFlowPhase4WithCard extends StatefulWidget {


      final String ticketName;
  final String ticketSubtitle;
  final String ticketSubtitle2;
  final String ticketPrice;


    BuyFlowPhase4WithCard({
    @required this.ticketName,
    @required this.ticketSubtitle,
    @required this.ticketSubtitle2,
    @required this.ticketPrice
  });



  @override
  State<BuyFlowPhase4WithCard> createState() => _BuyFlowPhase4State();
}

class _BuyFlowPhase4State extends State<BuyFlowPhase4WithCard> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _focusNode= FocusNode();
  final field1key = GlobalKey<FormFieldState>();


  var formInputs = [
        {
      "type": "inputwithinfo",
      "label": "Security code",
      "default": "",
      "action": () {},
      "errorMessage":"",
      "validator":(String value){
        if(value.length <3){
          return "Please enter a security code at least 3 digits long";
        }
        return null;
      }
    },
    {
      "type": "inputwithtip",
      "label": "Your email",
      "tip":
          "Enter the email address below that you would like your receipt sent to.",
      "default": "",
      "validator":(String value){
        if(value.length <3){
          return "Please check the email address entered is valid";
        }
        return null;
      }
    },
   
    {
      "type": "terms",
      "label":
          "This ticket purchase is subject to accepting the terms and conditions"
    },
    {"type": "submitbuybutton", "label": "Accept & pay"}
  ];

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if(!_focusNode.hasFocus){
        field1key.currentState.validate();
      }
     });


  }

  bool saveCard = false;

  bool isAllowedBuy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 80,
                color: Color.fromRGBO(185, 0, 9, 1),
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      left: 0,
                      top: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          child: Positioned(
                            top: 4,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset(
                                  "images/front/back.svg",
                                  width: 21,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Back",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 50,
                    child: Text("Enter card information",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Expanded(
                child: Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Color.fromRGBO(134, 8, 5, 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  width: 200,
                                  height: 6,
                                  color: Color.fromRGBO(191, 156, 102, 1),
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  alignment: Alignment.centerLeft,
                                  color: Colors.transparent,
                                  child: Text(
                                    widget.ticketSubtitle,
                                    style: GoogleFonts.roboto(
                                        color: Colors.white.withOpacity(0.9)),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            color: Color.fromRGBO(238, 238, 238, 1),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    widget.ticketName,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(),
                                ),
                                Text(
                                  "1x",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(),
                                ),
                                Text(
                                  "£"+widget.ticketPrice,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            color: Color.fromRGBO(185, 0, 9, 1),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "TOTAL                              ",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(),
                                ),
                                Text(
                                  "  ",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(),
                                ),
                                Text(
                                  "£"+widget.ticketPrice,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      child: Column(
                        children: [
                          for (var i = 0; i < formInputs.length; i++)
                            Builder(builder: (ctx) {
                              if (formInputs[i]['type'] == "input") {
                                return NXInput(
                                  label: formInputs[i]['label'],
                                );
                              } else if (formInputs[i]['type'] == "terms") {
                                return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    formInputs[i]['label'],
                                    style: GoogleFonts.roboto(
                                        color: Color.fromRGBO(149, 84, 92, 1)),
                                  ),
                                );
                              } else if (formInputs[i]['type'] ==
                                  "checkboxcircle") {
                                return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Transform.scale(
                                          scale: 1.4,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                              (states) =>
                                                  Color.fromRGBO(42, 165, 0, 1),
                                            ),
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: saveCard == true
                                                      ? Colors.transparent
                                                      : Colors.black),
                                            ),
                                            value: saveCard,
                                            shape: CircleBorder(),
                                            onChanged: (value) {
                                              setState(() {
                                                saveCard = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              formInputs[i]['label'],
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              formInputs[i]['tip'],
                                              style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              } else if (formInputs[i]['type'] ==
                                  "inputwithtip") {
                                return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          formInputs[i]['label'],
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          formInputs[i]['tip'],
                                          style: GoogleFonts.roboto(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        height: 50,
                                        margin:
                                            EdgeInsets.only(left: 20, right: 20),
                                        child: Container(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: 10),
                                              border: InputBorder.none

                                            ),
                                          ),
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all()),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (formInputs[i]['type'] ==
                                  "inputwithinfo") {
                                return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          formInputs[i]['label'],
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        height: 50,
                                        margin:
                                            EdgeInsets.only(left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: TextFormField(
                                                focusNode: _focusNode,
                                                key: field1key,
                                                validator: formInputs[i]['validator'],
                                                onChanged: (String val){
                                                  if(val.length>=3){
                                                    setState(() {
                                                      isAllowedBuy= true;
                                                    });
                                                  }else{
                                                    setState(() {
                                                      isAllowedBuy=false;
                                                    });
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.only(left: 10)
                                                ),
                                              ),
                                              height: 50,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all()),
                                            ),
                                            Container(
                                              width: 50,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Icon(Icons.info_outline),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 23,
                                          top: 10
                                        ),
                                        child: Text(formInputs[i]['errorMessage'],
                                        style: GoogleFonts.roboto(
                                          color: Color.fromRGBO(252, 52, 64, 1)
                                        ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> BuyFlowPhase5Success(
                                      ticketSubtitle: widget.ticketSubtitle,
                                      ticketName: widget.ticketName,
                                      ticketSubtitle2: widget.ticketSubtitle2,
                                      ticketPrice: widget.ticketPrice,
                                    )));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.white,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.only(
                                              left: 25,
                                              right: 25,
                                              bottom: 20,
                                              top: 10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      199, 199, 199, 1),
                                                  spreadRadius: 0,
                                                  blurRadius: 2,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color:  isAllowedBuy == true ? Color.fromRGBO(194, 154, 99,12 ) : Color.fromRGBO(
                                                  107, 107, 107, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Center(
                                            child: Text(""+
                                              formInputs[i]['label']+" £"+widget.ticketPrice,
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        )));
  }
}

class NXInput extends StatelessWidget {
  var label;

  NXInput({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            child: TextFormField(
              validator: (val){
                

                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 47,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
                border: Border.all(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
