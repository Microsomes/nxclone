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
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Image.asset("images/v2/v2assets/visa.png",width: 50,),
                  SizedBox(width: 10,),
                  Expanded(
                        child: Container(
                      height: 120,
                      child: Text("nkjn"),
                    ),
                  ),
                  Container(
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios,
                    color: Color.fromRGBO(180,81, 76, 1),
                     ),
                  ),
                  SizedBox(width: 10,)



                ],
              )
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 1,
            //   color: Color.fromRGBO(247, 175, 175, 1),
            // )
          ],
        )
      ),
    );
  }

}