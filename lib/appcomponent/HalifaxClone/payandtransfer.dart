import 'package:flutter/material.dart';

class PayandTransfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PayandTrasnferState();
  }
}

class PayandTrasnferState extends State<PayandTransfer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: null,
        title: Text(
          "Pay and transfer",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel,color: Colors.black,),
            onPressed: () {},
          ),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
