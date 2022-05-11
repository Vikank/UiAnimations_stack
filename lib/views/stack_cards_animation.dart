import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageUrl = "image1.jpeg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$imageUrl"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  decoration:
                  BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CardStack(
                    onCardChanged: (url) {
                      setState(() {
                        imageUrl = url;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardStack extends StatefulWidget {
  final Function onCardChanged;

  CardStack({required this.onCardChanged});
  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack>
    with SingleTickerProviderStateMixin {
  var cards = [
    const TouristCard(index: 0, imageUrl: "image1.jpeg"),
    const TouristCard(index: 1, imageUrl: "image2.jpeg"),
    const TouristCard(index: 2, imageUrl: "image3.jpeg"),
    const TouristCard(index: 3, imageUrl: "image1.jpeg"),
    const TouristCard(index: 4, imageUrl: "image2.jpeg"),
    const TouristCard(index: 5, imageUrl: "image3.jpeg")
  ];
  int? currentIndex;
  AnimationController? controller;
  CurvedAnimation? curvedAnimation;
  Animation<Offset>? _translationAnim;
  Animation<Offset>? _moveAnim;
  Animation<double>? _scaleAnim;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    curvedAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.easeOut);

    _translationAnim = Tween(begin: const Offset(0.0, 0.0), end: const Offset(-1000.0, 0.0))
        .animate(controller!)
      ..addListener(() {
        setState(() {});
      });

    _scaleAnim = Tween(begin: 0.965, end: 1.0).animate(curvedAnimation!);
    _moveAnim = Tween(begin: const Offset(0.0, 0.05), end: const Offset(0.0, 0.0))
        .animate(curvedAnimation!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        overflow: Overflow.visible,
        children: cards.reversed.map((card) {
          if (cards.indexOf(card) <= 2) {
            return GestureDetector(
              onHorizontalDragEnd: _horizontalDragEnd,
              child: Transform.translate(
                offset: _getFlickTransformOffset(card),
                child: FractionalTranslation(
                  translation: _getStackedCardOffset(card),
                  child: Transform.scale(
                    scale: _getStackedCardScale(card),
                    child: Center(child: card),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        }).toList());
  }

  Offset _getStackedCardOffset(TouristCard card) {
    int diff = card.index - currentIndex!;
    if (card.index == currentIndex! + 1) {
      return _moveAnim!.value;
    } else if (diff > 0 && diff <= 2) {
      return Offset(0.0, 0.05 * diff);
    } else {
      return const Offset(0.0, 0.0);
    }
  }

  double _getStackedCardScale(TouristCard card) {
    int diff = card.index - currentIndex!;
    if (card.index == currentIndex) {
      return 1.0;
    } else if (card.index == currentIndex! + 1) {
      return _scaleAnim!.value;
    } else {
      return (1 - (0.035 * diff.abs()));
    }
  }

  Offset _getFlickTransformOffset(TouristCard card) {
    if (card.index == currentIndex) {
      return _translationAnim!.value;
    }
    return const Offset(0.0, 0.0);
  }

  void _horizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      // Swiped Right to Left
      controller!.forward().whenComplete(() {
        setState(() {
          controller!.reset();
          TouristCard removedCard = cards.removeAt(0);
          cards.add(removedCard);
          currentIndex = cards[0].index;
          if (widget.onCardChanged != null)
            widget.onCardChanged(cards[0].imageUrl);
        });
      });
    }
  }
}

class TouristCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  const TouristCard({required this.index, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    TextStyle cardTitleStyle =
    Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24.0);
    TextStyle cardSubtitleStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(fontSize: 20.0, color: Colors.grey);
    TextStyle cardButtonStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(fontSize: 16.0, color: Colors.white);

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(children: [
          Image.asset("assets/images/$imageUrl"),
          FractionalTranslation(
            translation: const Offset(1.7, -0.5),
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.yellow,
              child: const Icon(Icons.star),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Tourist Spot",
              style: cardTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Travel and Recreation",
              style: cardSubtitleStyle,
            ),
          ),
          RaisedButton(
            elevation: 2.0,
            color: Colors.blue,
            child: Text(
              "EXPLORE",
              style: cardButtonStyle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}