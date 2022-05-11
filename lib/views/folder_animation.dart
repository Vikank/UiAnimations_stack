import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class FolderStackedCards extends StatelessWidget {

  final List<Widget> fancyCards = [
    FancyCard(
      image: Image.asset("assets/pluto-done.png"),
      title: "Say hello to planets!",
    ),
    FancyCard(
      image: Image.asset("assets/pluto-fatal-error.png"),
      title: "Don't be sad!",
    ),
    FancyCard(
      image: Image.asset("assets/pluto-coming-soon.png"),
      title: "Go for a walk!",
    ),
    FancyCard(
      image: Image.asset("assets/pluto-sign-up.png"),
      title: "Try teleportation!",
    ),
    FancyCard(
      image: Image.asset("assets/pluto-waiting.png"),
      title: "Enjoy your coffee!",
    ),
    FancyCard(
      image: Image.asset("assets/pluto-welcome.png"),
      title: "Play with your cat!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Folder stacked cards'),
      ),
      body: StackedCardCarousel(
        type: StackedCardCarouselType.cardsStack,
        items: fancyCards,
      ),
    );
  }
}

class FancyCard extends StatelessWidget {
  FancyCard({
    required this.image,
    required this.title,
  });

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            OutlineButton(
              child: const Text("Learn more"),
              onPressed: () => print("Button was tapped"),
            ),
          ],
        ),
      ),
    );
  }
}