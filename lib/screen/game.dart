import 'package:flutter/material.dart';
import 'package:tic_tac_toe/var/area.dart';
import 'package:tic_tac_toe/var/color.dart';
import 'package:tic_tac_toe/widgets/game_area.dart';
import 'package:tic_tac_toe/widgets/scor_board.dart';

class Game extends StatefulWidget {
  Game({this.bot, this.diff});

  final bool? bot;
  final int? diff;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  void state() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        format();
        xScor = 0;
        oScor = 0;
        play = true;
        youPlay = true;
        notMulti = true;
        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor!.value,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor!.value,
          elevation: 0,
          titleSpacing: 0,
          title: ScorBoard(xScor: xScor, oScor: oScor),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          onPressed: () {
            xScor = 0;
            oScor = 0;
            play = true;
            youPlay = true;
            notMulti = true;
            Navigator.pop(context);
          },
          child: Icon(
            Icons.home_rounded,
            color: secondary,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int j = 0; j < 3; j++)
                        Area(
                          state: state,
                          ok: borderList[i][j],
                          x: i,
                          y: j,
                          bot: widget.bot,
                          diff: widget.diff,
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
