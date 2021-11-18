import 'package:BubbleGum/piHome.dart';
import 'package:BubbleGum/v2/components/staticTicketColor.dart';
import 'package:BubbleGum/v7/afterDisclaimerQuickMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorSelectOver {
  Color pickerColor = Colors.red;

  Function toSend;

  int index;

  ColorSelectOver({@required this.toSend, @required this.index});

  void colChange(Color col) {
    print(col);
    this.toSend(col, this.index);
  }

  void changeTicketOverlay(BuildContext context) {
    // bool isCustomColor = false;

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (BuildContext ctx, StateSetter setState) {
              return Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Quick Ticket Switch",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: PiHome(
                          isHide: true,
                        ),
                      ),
                    ],
                  ));
            },
          );
        });
  }

  void colorOverlay(BuildContext context) {
    bool isCustomColor = false;

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (BuildContext ctx, StateSetter setState) {
              return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Quick Options",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        // color: Color.fromRGBO(165, 28, 26, 1),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Go Back to (Main) Home 🏠",
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => AfterDisclaimer()));
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            // color: Color.fromRGBO(165, 28, 26, 1),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Change Ticket (Fast)",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              changeTicketOverlay(context);
                            },
                          ),
                          ElevatedButton(
                            // color: Color.fromRGBO(165, 28, 26, 1),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                isCustomColor == false
                                    ? "Pick your own Color ✏️"
                                    : "Pick Random Colors",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isCustomColor = !isCustomColor;
                              });
                            },
                          ),
                        ],
                      ),
                      isCustomColor == false
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: StaticTicketColor(
                                      pickedColor: (color1, color2, color3) {
                                        print("Color");
                                        print(color1);
                                        print(color2);
                                        print(color3);
                                        this.toSend(color1, 1);
                                        this.toSend(color2, 2);
                                        this.toSend(color3, 3);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              flex: 3,
                              child: ColorPicker(
                                pickerColor: pickerColor,
                                onColorChanged: colChange,
                                // showLabel: true,
                                pickerAreaHeightPercent: 0.8,
                              ),
                            )
                    ],
                  ));
            },
          );
        });
  }
}
