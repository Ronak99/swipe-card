import 'package:flutter/material.dart';
import 'package:swipe_solution/swipeable_cards.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainUI(),
      ),
    );
  }
}

class MainUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwipeableCards();
  }
}
