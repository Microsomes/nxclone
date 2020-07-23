import 'package:flutter/material.dart';

class MovingText extends StatefulWidget {
  final String textContent;

  MovingText({@required this.textContent});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovingTextState();
  }
}

class MovingTextState extends State<MovingText> {
  @override
  Widget build(BuildContext context) {
    var tc = widget.textContent;
    // TODO: implement build
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
       child: Text(
        "$tc",
        style: TextStyle(
            letterSpacing: 0.3,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
