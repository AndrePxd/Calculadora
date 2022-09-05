import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 5,
        color: Colors.black.withOpacity(0.9),
        margin: EdgeInsets.symmetric(vertical: 20));
  }
}
