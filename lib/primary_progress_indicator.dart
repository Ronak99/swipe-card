import 'package:flutter/material.dart';

class PrimaryProgressIndicator extends StatelessWidget {
  final double value;

  PrimaryProgressIndicator({this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.only(bottom: 10),
        child: CircularProgressIndicator(
          strokeWidth: 5,
          value: value,
        ),
      ),
    );
  }
}
