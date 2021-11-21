import 'package:flutter/material.dart';
import 'package:bubble_gum/src/v2/pages/buyflow/components/paymentOption.dart';

import 'addNewPaymentOption.dart';

class AllPaymentOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PaymentOption(
          paymentTypeIcon: "images/v2/visa.png",
          paymentCard: "VISA",
          last4digits: "7824",
          expiresBy: "22/25",
        ),
        AddNewPaymentOption()
      ],
    );
  }
}
