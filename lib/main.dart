import 'package:flutter/material.dart';
import 'package:sexyyy_ui_poc/views/folder_animation.dart';
import 'package:sexyyy_ui_poc/views/note_list.dart';
import 'package:sexyyy_ui_poc/views/stack_cards_animation.dart';
import 'package:sexyyy_ui_poc/views/vertical_card_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VeerticalCardAnimation(),
    );
  }
}
