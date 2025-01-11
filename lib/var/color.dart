import 'package:flutter/material.dart';

List<String> themeName = ["sun", "jungle", "oceon", "snow", "space", "void"];

Map<String, List<Color>> theme = {
  themeName[0]: [
    Color(0xFFD74E09),
    Color(0xFFFBFEF3),
    Color(0xFFF9FDED),
  ],
  themeName[1]: [
    Color(0xFFADC178),
    Color(0xFFF6F0E0),
    Color(0xFFF0EAD2),
  ],
  themeName[2]: [
    Color(0xFF4D9DE0),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
  ],
  themeName[3]: [
    Color(0xFF68818D),
    Color(0xFFF5F4F0),
    Color(0xFFF2EFEA),
  ],
  themeName[4]: [
    Color(0xFF3A1451),
    Color(0xFFD1A0E2),
    Color(0xFF6F367D),
  ],
  themeName[5]: [
    Color(0xFF281B47),
    Color(0xFF9F86D7),
    Color(0xFF594093),
  ],
};

Color primary = Colors.white, secondary = Colors.white, background = Colors.white;

Animation? primaryColor, secondaryColor, backgroundColor;

void setColor(AnimationController? controller, String name) {
  primaryColor = ColorTween(begin: primary, end: theme[name]![0]).animate(controller!);
  secondaryColor = ColorTween(begin: secondary, end: theme[name]![1]).animate(controller);
  backgroundColor = ColorTween(begin: background, end: theme[name]![2]).animate(controller);

  primary = theme[name]![0];
  secondary = theme[name]![1];
  background = theme[name]![2];
}
