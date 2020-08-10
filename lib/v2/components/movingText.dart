import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MovingText extends StatefulWidget {
  final String textContent;
  final bool isUpper;

  MovingText({@required this.textContent,this.isUpper=false});

  @override
  State<StatefulWidget> createState() {
    return MovingTextState();
  }
}

class MovingTextState extends State<MovingText> {
  double currentTextPos = 0;

  void startAnimation() {}

  void init() {

  }

  Widget _buildMarquee() {
    return Marquee(
      text: widget.isUpper==true ? widget.textContent.toUpperCase(): widget.textContent,
      style: TextStyle(
          letterSpacing: 0.3,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 19),
      pauseAfterRound: Duration(milliseconds: 200),
      blankSpace: widget.textContent.length.toDouble()*10,
      showFadingOnlyWhenScrolling: true,
    );
  }

  @override
  void initState() {
    super.initState();
    this.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            _buildMarquee(),
          ],
        ));
  }
}
