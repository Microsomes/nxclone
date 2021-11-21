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
    return PaymentOptionState();
  }

}

class PaymentOptionState extends State<PaymentOption>{

  String pc;

  @override
  void initState() {
    super.initState();
     this.pc= widget.paymentCard;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:0.0),
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
                          alignment: Alignment.centerLeft,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("VISA",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row(
                             children: <Widget>[
                               SizedBox(width: 4,),
                               Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 4,),
                               Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 4,),
                               Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 2,),
                              Image.asset("images/v2/v2assets/dot.png",width:6),
                               SizedBox(width: 4,),
                               Text("8998",
                               style: TextStyle(
                                 color: Color.fromRGBO(80, 8, 8, 1)
                               ),)

                             ],
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left:2.0),
                            child: Text("Expires 02/25",
                            style: TextStyle(fontWeight: FontWeight.w500,
                            shadows: [
                               Shadow(
                                offset: Offset(0.3, 0.2),
                                blurRadius: 30.0,
                                color: Colors.red,
                              )
                            ]
                            
                            ),),
                          )
                        ],
                      )
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