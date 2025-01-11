import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tic_tac_toe/var/color.dart';
import 'package:tic_tac_toe/screen/game.dart';
import 'package:tic_tac_toe/widgets/animated.dart';
import 'package:tic_tac_toe/widgets/flat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double height = 0;

  void size() {
    setState(() {
      height = height == 0 ? 45 : 0;
    });
  }

  void style(String name) {
    setState(() {
      controller!.repeat();
      controller!.forward();
      setColor(controller, name);
    });
  }

  void goto(BuildContext context, bool? bot, int? diff) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: Game(bot: bot!, diff: diff!),
        duration: Duration(milliseconds: 500),
        reverseDuration: Duration(milliseconds: 500),
      ),
    );
  }

  SpeedDialChild floating({Color? color, String? name}) {
    return SpeedDialChild(
      child: SizedBox(),
      backgroundColor: color,
      foregroundColor: Colors.white,
      onTap: () {
        style(name!);
      },
    );
  }

  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    controller!.addListener(() {
      setState(() {});
    });
    style(themeName[Random().nextInt(themeName.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor!.value,
      floatingActionButton: SpeedDial(
        icon: Icons.palette,
        activeIcon: Icons.close_rounded,
        backgroundColor: primaryColor!.value,
        foregroundColor: secondaryColor!.value,
        overlayOpacity: 0,
        childrenButtonSize: 40.0,
        spaceBetweenChildren: 5,
        animationSpeed: 300,
        direction: SpeedDialDirection.left,
        children: [
          for (int i = 0; i < themeName.length; i++)
            floating(
              color: theme[themeName[i]]![0],
              name: themeName[i],
            ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.close_rounded,
                color: primaryColor!.value,
                size: MediaQuery.of(context).size.width,
              ),
              Flat(
                func: () {
                  setState(() {
                    size();
                  });
                },
                text: "Computer",
                margin: EdgeInsets.only(top: 25),
                item: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Animated(
                  height: height,
                  text: "Easy",
                  goto: () {
                    goto(context, true, 1);
                    size();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Animated(
                  height: height,
                  text: "Hard",
                  goto: () {
                    goto(context, true, 2);
                    size();
                  },
                ),
              ),
              Flat(
                func: () {
                  goto(context, false, 1);
                },
                text: "PVP",
                item: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
