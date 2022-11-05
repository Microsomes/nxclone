
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PayzoneHowItWorks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PayzoneHowItWorksState();
  }
}

class PayzoneHowItWorksState extends State<PayzoneHowItWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Container(
              width: double.infinity,
              height: 80,
              color: Color.fromRGBO(169, 27, 26, 1),
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
                              style: GoogleFonts.roboto(fontSize: 16,
                              color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 50,
                  child: Text("How it works",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Text("Pay in store",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),
                              ),
                              SizedBox(height: 20,),
                              Text("Buy your ticket with cash in store.",
                              style: GoogleFonts.roboto(
                                color: Colors.black.withOpacity(0.7)
                              ),
                              ),
                              SizedBox(height: 30,),
                              Image.asset("images/front/payzone_step1.png",
                              width: 340,
                              ),
                              SizedBox(height: 25,),
                              Text("How it works",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),
                              ),
                              SizedBox(height:20),
                              Container(
                                alignment: Alignment.center,
                                child:Column(
                                  children: [
                                     Row(
                                  children: [
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Center(
                                      child: Text("1",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20
                                      ),
                                      ),
                                    ),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                    color: Color.fromRGBO(167, 27, 26, 1),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  SizedBox(width: 18,),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 30
                                      ),
                                      child: Text("Visit a store with Payzone terminal and ask for your ticket.",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16
                                      ),
                                      ),
                                    ),
                                  )
                                ],),
                                SizedBox(height: 20,),
                                SvgPicture.asset("images/front/store.svg",
                                width: 100,
                                )
                                  ],
                                )
                              ),

                                 SizedBox(height:60),
                              Container(
                                alignment: Alignment.center,
                                child:Column(
                                  children: [
                                     Row(
                                  children: [
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Center(
                                      child: Text("2",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20
                                      ),
                                      ),
                                    ),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                    color: Color.fromRGBO(167, 27, 26, 1),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  SizedBox(width: 18,),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 30
                                      ),
                                      child: Text("Show your barcode to the cashier.",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16
                                      ),
                                      ),
                                    ),
                                  )
                                ],),
                                SizedBox(height: 20,),
                                SvgPicture.asset("images/front/DBarcode.svg",
                                width: 100,
                                ),
                                SizedBox(height: 32,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Show my barcode",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17
                                  ),
                                  )),

                                  ],
                                )
                              ),
                              SizedBox(height: 20,),

                                Container(
                                alignment: Alignment.center,
                                child:Column(
                                  children: [
                                     Row(
                                  children: [
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Center(
                                      child: Text("2",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20
                                      ),
                                      ),
                                    ),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                    color: Color.fromRGBO(167, 27, 26, 1),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  SizedBox(width: 18,),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 30
                                      ),
                                      child: Text("Show your barcode to the cashier.",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16
                                      ),
                                      ),
                                    ),
                                  )
                                ],),
                                SizedBox(height: 20,),
                                Image.asset("images/front/refreshticket.png",
                                width: 100,
                                ),
                                SizedBox(height: 32,),
                             
                                  ],
                                )
                              ),
                        
                        
                             SizedBox(height: 10,),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
                ),
                 GestureDetector(
          onTap: (){
           
          },
          child: Container(
            height: 50,
            child: Center(
                child: Text(
              "Find a Store",
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 15),
            )),
            decoration: BoxDecoration(
                color: Color.fromRGBO(188, 156, 107, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]),
            margin: EdgeInsets.only(left: 20, right: 20),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> PayzoneHowItWorks()));
          
          },
          child: Container(
            height: 20,
            child: Center(
              child: Text(
                "Frequently asked questions",
                style:
                    GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),

              
        ],
      ));
  }
  }

                                