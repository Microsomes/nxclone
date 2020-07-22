import 'package:flutter/material.dart';


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
                  )
    );
  }

}