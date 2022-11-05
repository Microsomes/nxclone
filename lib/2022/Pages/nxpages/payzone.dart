import 'package:barcode_widget/barcode_widget.dart';
import "package:flutter/material.dart";
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class Payzone extends StatefulWidget{
  @override
  State<Payzone> createState() => _PayzoneState();
}

class _PayzoneState extends State<Payzone> {

  ScrollController _scrollController =  ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                  child: Text("Your Mobile Barcode",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    children: [
                      Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text("Pay in store.",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                  ),
                  SizedBox(height: 7,),
                  Text("Get tickets on your phone",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                  ),
                  SizedBox(height: 40,),
                  SvgPicture.asset("images/front/payzone-logo.svg"),
                  SizedBox(height: 60,),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: BarcodeWidget(
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2
                      
                      ),
                      data: "6338540012598388327515216", barcode: Barcode.code128()),
                    width: MediaQuery.of(context).size.width*0.7,
                    height: 80,
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: MarkdownBody(
                        styleSheet: MarkdownStyleSheet(
                          textAlign: WrapAlignment.center,
                          pPadding: EdgeInsets.only(
                            right: 25,
                            left: 25
                          ),
                          p: GoogleFonts.roboto(
                            fontSize: 16,
                          )
                        ),
                        
                        
                        data: "**Scan this barcode** at the retailer that supports Payzone purchases. **Purchase your tickets** in store and they will be delivered to your **ticket wallet.**",
                      ),
                    ),
                ],
              ),    
            ),
                    ],
                  ),
                )
              ],
            )
          )
      ],)
    );
  }
}