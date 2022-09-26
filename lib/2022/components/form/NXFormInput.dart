import "package:flutter/material.dart";




class NXFormInputComponent extends StatefulWidget {

    final String label;
    final String tip;
    final Function validator;

    NXFormInputComponent({
      @required this.label,
      @required this.tip,
      @required this.validator
    });

  @override
  State<NXFormInputComponent> createState() => _NXFormInputComponentState();
}

class _NXFormInputComponentState extends State<NXFormInputComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.black,
    );
  }
}