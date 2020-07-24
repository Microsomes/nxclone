import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

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
  double currentTextPos = 0;

  void startAnimation() {}

  void init() {}

  Widget _buildMarquee() {
    return Marquee(
      text: widget.textContent,
      style: TextStyle(
          letterSpacing: 0.3,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16),
      pauseAfterRound: Duration(seconds: 3),
      blankSpace: 30,
      showFadingOnlyWhenScrolling: true,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.init();
  }

  @override
  Widget build(BuildContext context) {
    var tc = widget.textContent;
    // TODO: implement build
    return Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            // Positioned(
            //   left: currentTextPos,
            //   top: 0,
            //         child: Container(
            //      alignment: Alignment.centerLeft,
            //     height: 50,
            //     width: MediaQuery.of(context).size.width,
            //      child: Text(
            //        "$tc",
            //        style: TextStyle(
            //            letterSpacing: 0.3,
            //            color: Colors.white,
            //            fontWeight: FontWeight.bold,
            //            fontSize: 16),
            //      ),
            //   ),
            // ),
            _buildMarquee(),
          ],
        ));
  }
}
