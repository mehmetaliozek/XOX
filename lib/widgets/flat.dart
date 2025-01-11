import 'package:flutter/material.dart';
import 'package:tic_tac_toe/var/color.dart';

class Flat extends StatelessWidget {
  Flat({this.func, this.text, this.margin, this.item});

  final Function? func;
  final String? text;
  final EdgeInsetsGeometry? margin;
  final bool? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: OutlinedButton(
        onPressed: () {
          func!();
        },
        child: Text("$text"),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: primaryColor!.value,
          textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          side: BorderSide(color: primaryColor!.value, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.all(5),
        ).copyWith(
          fixedSize: MaterialStateProperty.all<Size>(
            item == true
                ? Size.fromWidth(MediaQuery.of(context).size.width * 40 / 100)
                : Size.fromWidth(MediaQuery.of(context).size.width * 60 / 100),
          ),
        ),
      ),
    );
  }
}
