import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class VeerticalCardAnimation extends StatefulWidget {
  @override
  _VeerticalCardAnimationState createState() => _VeerticalCardAnimationState();
}

class _VeerticalCardAnimationState extends State<VeerticalCardAnimation> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
    ];

    final List<Widget> images = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.cyan,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.grey,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.RIGHT,
                  onSelectedItem: (index) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}