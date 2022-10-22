import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class NXFormInputComponent extends StatefulWidget {
  final String label;
  final String tip;
  final Function validator;

  NXFormInputComponent(
      {@required this.label, @required this.tip, @required this.validator});

  @override
  State<NXFormInputComponent> createState() => _NXFormInputComponentState();
}

class _NXFormInputComponentState extends State<NXFormInputComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              widget.label,
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
