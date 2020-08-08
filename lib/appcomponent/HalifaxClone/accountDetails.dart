import 'package:flutter/material.dart';

//will show some details

class AccountDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AccountDetailsState();
  }

}

class AccountDetailsState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "T.javed- 2367",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(1, 63, 185, 1),
      ),
    );
  }

}