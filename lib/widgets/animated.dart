import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/flat.dart';

class Animated extends StatelessWidget {
  Animated({this.height, this.text, this.goto});
  final double? height;
  final String? text;
  final Function? goto;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 750),
      alignment: Alignment.center,
      height: height,
      curve: Curves.fastOutSlowIn,
      child: Flat(
        func: () {
          goto!();
        },
        text: text,
        item: true,
      ),
    );
  }
}
