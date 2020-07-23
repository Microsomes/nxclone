import 'package:flutter/material.dart';

class PaymentConfirmed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
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
            "Confirmation",
            style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
          ),
        ),
      ),
    );
  }

}