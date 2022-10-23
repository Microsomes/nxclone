import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:google_fonts/google_fonts.dart';

class MovingText extends StatefulWidget {
  final String textContent;
  final bool isUpper;

  final double velocity;

  MovingText({@required this.textContent, this.isUpper = false,this.velocity=50});

  @override
  State<StatefulWidget> createState() {
    return MovingTextState();
  }
}

class MovingTextState extends State<MovingText> {
  double currentTextPos = 0;

  void startAnimation() {}

  void init() {}

  int endStart = 306;

  int endLeft = 130;

  double current = 300.00;

  Widget _buildMarquee() {
    

    

    return Marquee(
      velocity: widget.velocity,
      text: widget.isUpper == true
          ? widget.textContent.toUpperCase()
          : widget.textContent,
      style: GoogleFonts.roboto(
         letterSpacing: 0.3,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17
      ),
      pauseAfterRound: Duration(milliseconds: 2000),
      blankSpace: widget.textContent.length.toDouble() * 10,
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
        child: _buildMarquee()
    );
  }
}

class MarqueeWidget extends StatefulWidget {
  final Widget child;
  final Axis direction;
  final Duration animationDuration, backDuration, pauseDuration;

  MarqueeWidget({
    @required this.child,
    this.direction: Axis.horizontal,
    this.animationDuration: const Duration(milliseconds: 3000),
    this.backDuration: const Duration(milliseconds: 800),
    this.pauseDuration: const Duration(milliseconds: 800),
  });

  @override
  _MarqueeWidgetState createState() => _MarqueeWidgetState();
}

class _MarqueeWidgetState extends State<MarqueeWidget> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 50.0);
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.child,
      scrollDirection: widget.direction,
      controller: scrollController,
    );
  }

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients)
        await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: widget.animationDuration,
            curve: Curves.ease);
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients)
        await scrollController.animateTo(0.0,
            duration: widget.backDuration, curve: Curves.easeOut);
    }
  }
}
