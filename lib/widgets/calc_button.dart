import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color btncolor;
  final bool big;
  final String text;
  //final Color btntext;
  final Function onPressed;

  CalculatorButton({
    Key? key,
    btncolor,
//    btntext,
    this.big = false,
    required this.text,
    required this.onPressed,
  })  : btncolor = btncolor ?? Color(0xff333333),
        // this.btntext = btntext ?? Color(0xff333333),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Button
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: btncolor,
      primary: Colors.white,
      shape: StadiumBorder(),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
      child: TextButton(
        style: buttonStyle,
        child: Container(
          width: big ? 220 : 70,
          height: 65,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          )),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
