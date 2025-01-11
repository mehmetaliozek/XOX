import 'package:flutter/material.dart';
import 'package:tic_tac_toe/var/color.dart';

class ScorBoard extends StatelessWidget {
  ScorBoard({this.xScor, this.oScor});

  final int? xScor;
  final int? oScor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _row(true, team: Icons.circle_outlined, scor: oScor),
        Container(
          width: 1,
          height: AppBar().preferredSize.height * 0.75,
          margin: EdgeInsets.only(right: 5),
          color: Colors.black38,
        ),
        _row(false, team: Icons.clear_rounded, scor: xScor),
      ],
    );
  }

  Widget _row(bool space, {IconData? team, int? scor}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              team,
              color: secondary,
              size: AppBar().preferredSize.height * 0.8,
            ),
            Text(
              !space ? "$scor" : "$scor",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: secondaryColor!.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
