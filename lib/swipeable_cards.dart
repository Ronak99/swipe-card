import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:swipe_solution/cached_image.dart';

class SwipeableCards extends StatefulWidget {
  @override
  _SwipeableCardsState createState() => _SwipeableCardsState();
}

class _SwipeableCardsState extends State<SwipeableCards>
    with TickerProviderStateMixin {
  CardController controller;

  List<String> welcomeImages = [
    "https://images.unsplash.com/photo-1587613991394-51450cb21333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80",
    "https://images.unsplash.com/photo-1591800552599-b98b22cb762d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1591882765493-4753b4072e0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1588612568467-a6b245a1f4a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1591758878867-763750822e47?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1591818443384-f9dcb9b3bec1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: TinderSwapCard(
                orientation: AmassOrientation.BOTTOM,
                totalNum: 6,
                stackNum: 3,
                swipeEdge: 5.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.85,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (context, index) => Card(
                      child: CachedImage(
                        '${welcomeImages[index]}',
                      ),
                    ),
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignmentRz
                  if (align.x < 0) {
                    //Card is LEFT swiping
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                  print(orientation);
                  print(index);
                }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Reject"),
                onPressed: () => controller.triggerLeft(),
                color: Colors.red,
              ),
              SizedBox(width: 20),
              FlatButton(
                child: Text("Accept"),
                onPressed: () => controller.triggerRight(),
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
