import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyMetro extends StatefulWidget{
  @override
  _MyMetroState createState() => _MyMetroState();
}

class _MyMetroState extends State<MyMetro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Clone of the my metro app",
        style: GoogleFonts.roboto(
          fontSize: 30
        ),
        ),
      ),
    );
  }
}