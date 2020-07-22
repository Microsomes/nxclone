import "package:flutter/material.dart";


class PaymentOption extends StatefulWidget{


  final String paymentTypeIcon;
  final String paymentCard;
  final String last4digits;
  final String expiresBy;

  PaymentOption({
    @required this.paymentTypeIcon,
    @required this.paymentCard,
    @required this.last4digits,
    @required this.expiresBy
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaymentOptionState();
  }

}

class PaymentOptionState extends State<PaymentOption>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Text("jnjkn")
    );
  }

}