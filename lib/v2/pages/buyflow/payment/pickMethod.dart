import 'package:flutter/material.dart';
import 'package:nxclone/v2/pages/buyflow/components/paymentOption.dart';


class PickPaymentMethodAndConfirmItem extends StatelessWidget{

    final String selectedState;
    final  selectedTicket;

    PickPaymentMethodAndConfirmItem({
      @required this.selectedState,
      @required this.selectedTicket
    }){

      print("opened payment page");

    }
    



  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 241, 241, 1),
      appBar: AppBar(
                    backgroundColor: Colors.white,
                    leading: InkWell(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: PreferredSize(
                            preferredSize: Size.fromHeight(500),
                            child:
                                Image.asset("images/leftarrow.png", width: 4))),
                    title: Center(
                      child: Text(
                        "Select payment method",
                        style:
                            TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
                      ),
                    ),

                    

                  ),
                  body: Column(
                    children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 9,
                                width: MediaQuery.of(context).size.width/2,
                                color: Color.fromRGBO(187, 157, 107, 1),
                              ),
                              Container(
                                height: 9,
                                width: MediaQuery.of(context).size.width/2,
                                color: Color.fromRGBO(169, 27, 26, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromRGBO(169, 27, 26, 1),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 15,),
                              Text("West Midlands Single Journey",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                              ),
                              ),
                              Expanded(child: Text(""),),
                              Text("1x £2.50",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                              SizedBox(width: 15,)
                            ],
                          ),
                        ),
                        Container(
                          height: 36,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromRGBO(123, 26, 17, 1),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 15,),
                              Text("Total",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),),
                              Expanded(child: Text(""),),
                              Text("£2.50",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17
                              ),
                              ),
                              SizedBox(width: 14,)

                            ],
                          ),
                        ),
                        Container(
                          height: 24,
                          color: Color.fromRGBO(253, 237, 237, 1),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 15,),
                              Text("Payment methods",
                              style: TextStyle(
                                color: Color.fromRGBO(75, 8, 8, 1),
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context,index){
                            return PaymentOption(
                              paymentTypeIcon: "images/v2/visa.png",
                              paymentCard: "VISA",
                              last4digits: "7824",
                              expiresBy: "22/25",
                            );
                          }),
                        )

                    ],
                  ),
    );
  }

}