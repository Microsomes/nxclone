import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SettingSaver extends StatefulWidget{

    final String title;

    SettingSaver({@required this.title});

  @override
  _SettingSaverState createState() => _SettingSaverState();
}

class _SettingSaverState extends State<SettingSaver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
        alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close,color: Colors.grey,size: 30,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height:20),
              Text(widget.title,
              style: GoogleFonts.roboto(
                fontSize: 30
              ),
              textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )
    );
  }
}