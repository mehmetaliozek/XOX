import 'package:flutter/material.dart';
import 'package:tic_tac_toe/var/area.dart';
import 'package:tic_tac_toe/var/color.dart';

class Area extends StatelessWidget {
  Area({this.state, this.ok, this.x, this.y, this.bot, this.diff});

  final Function? state;
  final List<bool>? ok;
  final int? x;
  final int? y;
  final bool? bot;
  final int? diff;

  void control() {
    state!();
    setScore();
    equal();
  }

  final BorderSide borderSideContainerTrue = BorderSide(color: primaryColor!.value, width: 2.5);
  final BorderSide borderSideContainerFalse = BorderSide(color: backgroundColor!.value, width: 2.5);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state!();
        IconData i = areaIcon[x!][y!];
        if (youPlay == true) areaIcon[x!][y!] = setIcon(areaIcon[x!][y!]);
        youPlay = false;
        if (bot == true && notMulti == true) {
          next = true;
          notMulti = false;
          Future.delayed(Duration(milliseconds: 300), () {
            control();
            if (play == true && i == Icons.coronavirus) diff == 1 ? botPlayer() : proBotPlayer();
          });
        }
        Future.delayed(Duration(milliseconds: bot == true ? 750 : 450), () {
          control();
          play = true;
          youPlay = true;
          notMulti = true;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 30 / 100,
        height: MediaQuery.of(context).size.width * 30 / 100,
        decoration: BoxDecoration(
          border: Border(
            top: ok![0] ? borderSideContainerTrue : borderSideContainerFalse,
            right: ok![1] ? borderSideContainerTrue : borderSideContainerFalse,
            bottom: ok![2] ? borderSideContainerTrue : borderSideContainerFalse,
            left: ok![3] ? borderSideContainerTrue : borderSideContainerFalse,
          ),
        ),
        alignment: Alignment.center,
        child: areaIcon[x!][y!] == Icons.coronavirus
            ? SizedBox()
            : Icon(
                areaIcon[x!][y!],
                color: primary,
                size: 75,
              ),
      ),
    );
  }
}
