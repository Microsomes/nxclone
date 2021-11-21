import 'package:flutter/material.dart';
import 'package:bubble_gum/src/v2/helper/NxHelp.dart';

class TermsConditions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TermsConditionsState();
  }
}

class TermsConditionsState extends State<TermsConditions> {
  bool currentTicket = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: currentTicket != null
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, top: 10),
                            child: Text(
                              "Close",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    "TERMS",
                                    style: TextStyle(
                                        color: Color.fromRGBO(110, 110, 110, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: NXHelp().termsForSingle().length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 15),
                                            NXHelp().termsForDaysaver()[index]
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            color:
                                                Color.fromRGBO(77, 84, 137, 1),
                                            size: 18,
                                          ),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          "Back",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  58, 63, 103, 1),
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
