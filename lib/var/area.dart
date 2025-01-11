import 'dart:math';

import 'package:flutter/material.dart';

bool next = true, play = true, youPlay = true, notMulti = true;

int xScor = 0, oScor = 0;

List<List<List<bool>>> borderList = [
  [
    [false, true, true, false],
    [false, true, true, true],
    [false, false, true, true],
  ],
  [
    [true, true, true, false],
    [true, true, true, true],
    [true, false, true, true],
  ],
  [
    [true, true, false, false],
    [true, true, false, true],
    [true, false, false, true],
  ],
];

List<List<IconData>> areaIcon = List.generate(
  3,
  (index) => List.generate(3, (index) => Icons.coronavirus),
);

IconData setIcon(IconData? ico) {
  if (ico != Icons.close_rounded && ico != Icons.circle_outlined) {
    if (next == true) {
      ico = Icons.close_rounded;
    } else {
      ico = Icons.circle_outlined;
    }
    next = !next;
  }
  return ico!;
}

void format() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      areaIcon[i][j] = Icons.coronavirus;
    }
  }
  next = true;
  play == true ? play = false : play = true;
}

void setScore() {
  for (int i = 0; i < 3; i++) {
    if (areaIcon[i][0] != Icons.coronavirus) {
      if ((areaIcon[i][0] == Icons.close_rounded || areaIcon[i][0] == Icons.circle_outlined) &&
          areaIcon[i][0] == areaIcon[i][1] &&
          areaIcon[i][0] == areaIcon[i][2]) {
        if (areaIcon[i][0] == Icons.close_rounded) {
          xScor += 1;
        } else {
          oScor += 1;
        }
        format();
        break;
      }
    }
    if (areaIcon[0][i] != Icons.coronavirus) {
      if ((areaIcon[0][i] == Icons.close_rounded || areaIcon[0][i] == Icons.circle_outlined) &&
          areaIcon[0][i] == areaIcon[1][i] &&
          areaIcon[0][i] == areaIcon[2][i]) {
        if (areaIcon[0][i] == Icons.close_rounded) {
          xScor += 1;
        } else {
          oScor += 1;
        }
        format();
        break;
      }
    }
  }
  if (areaIcon[0][0] != Icons.coronavirus) {
    if ((areaIcon[0][0] == Icons.close_rounded || areaIcon[0][0] == Icons.circle_outlined) &&
        areaIcon[0][0] == areaIcon[1][1] &&
        areaIcon[0][0] == areaIcon[2][2]) {
      if (areaIcon[1][1] == Icons.close_rounded) {
        xScor += 1;
      } else {
        oScor += 1;
      }
      format();
    }
  }
  if (areaIcon[0][2] != Icons.coronavirus) {
    if ((areaIcon[0][2] == Icons.close_rounded || areaIcon[0][2] == Icons.circle_outlined) &&
        areaIcon[0][2] == areaIcon[1][1] &&
        areaIcon[0][2] == areaIcon[2][0]) {
      if (areaIcon[1][1] == Icons.close_rounded) {
        xScor += 1;
      } else {
        oScor += 1;
      }
      format();
    }
  }
}

void equal() {
  int n = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (areaIcon[i][j] != Icons.coronavirus) {
        n += 1;
      }
    }
  }
  if (n == 9) {
    format();
    play = false;
  }
}

void botPlayer() {
  int? x, y;
  do {
    x = Random().nextInt(3);
    y = Random().nextInt(3);
  } while (areaIcon[x][y] != Icons.coronavirus);
  areaIcon[x][y] = Icons.circle_outlined;
}

void proBotPlayer() {
  List<bool> x = [false, false, false, true];
  List<int> l = [2, 1, 0];
  int count = 0;

  //O kazanama

  for (int j = 0; j < 3; j++) {
    x[j] = areaIcon[j][j] == Icons.circle_outlined ? true : false;
    count += areaIcon[j][j] == Icons.circle_outlined ? 1 : 0;
  }
  if (count == 2) {
    for (int j = 0; j < 3; j++) {
      if (x[j] == false && x[3] == true && areaIcon[j][j] == Icons.coronavirus) {
        areaIcon[j][j] = Icons.circle_outlined;
        x[3] = false;
        break;
      }
    }
  }
  count = 0;

  for (int j = 0; j < 3; j++) {
    x[j] = areaIcon[j][l[j]] == Icons.circle_outlined ? true : false;
    count += areaIcon[j][l[j]] == Icons.circle_outlined ? 1 : 0;
  }
  if (count == 2) {
    for (int j = 0; j < 3; j++) {
      if (x[j] == false && x[3] == true && areaIcon[j][l[j]] == Icons.coronavirus) {
        areaIcon[j][l[j]] = Icons.circle_outlined;
        x[3] = false;
        break;
      }
    }
  }
  count = 0;

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      x[j] = areaIcon[i][j] == Icons.circle_outlined ? true : false;
      count += areaIcon[i][j] == Icons.circle_outlined ? 1 : 0;
    }
    if (count == 2) {
      for (int j = 0; j < 3; j++) {
        if (x[j] == false && x[3] == true && areaIcon[i][j] == Icons.coronavirus) {
          areaIcon[i][j] = Icons.circle_outlined;
          x[3] = false;
          break;
        }
      }
    }
    if (x[3] == false) {
      break;
    }
    count = 0;
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      x[j] = areaIcon[j][i] == Icons.circle_outlined ? true : false;
      count += areaIcon[j][i] == Icons.circle_outlined ? 1 : 0;
    }
    if (count == 2) {
      for (int j = 0; j < 3; j++) {
        if (x[j] == false && x[3] == true && areaIcon[j][i] == Icons.coronavirus) {
          areaIcon[j][i] = Icons.circle_outlined;
          x[3] = false;
          break;
        }
      }
    }
    if (x[3] == false) {
      break;
    }
    count = 0;
  }

  //X engelleme

  for (int j = 0; j < 3; j++) {
    x[j] = areaIcon[j][j] == Icons.close_rounded ? true : false;
    count += areaIcon[j][j] == Icons.close_rounded ? 1 : 0;
  }
  if (count == 2) {
    for (int j = 0; j < 3; j++) {
      if (x[j] == false && x[3] == true && areaIcon[j][j] == Icons.coronavirus) {
        areaIcon[j][j] = Icons.circle_outlined;
        x[3] = false;
        break;
      }
    }
  }
  count = 0;

  for (int j = 0; j < 3; j++) {
    x[j] = areaIcon[j][l[j]] == Icons.close_rounded ? true : false;
    count += areaIcon[j][l[j]] == Icons.close_rounded ? 1 : 0;
  }
  if (count == 2) {
    for (int j = 0; j < 3; j++) {
      if (x[j] == false && x[3] == true && areaIcon[j][l[j]] == Icons.coronavirus) {
        areaIcon[j][l[j]] = Icons.circle_outlined;
        x[3] = false;
        break;
      }
    }
  }
  count = 0;

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      x[j] = areaIcon[i][j] == Icons.close_rounded ? true : false;
      count += areaIcon[i][j] == Icons.close_rounded ? 1 : 0;
    }
    if (count == 2) {
      for (int j = 0; j < 3; j++) {
        if (x[j] == false && x[3] == true && areaIcon[i][j] == Icons.coronavirus) {
          areaIcon[i][j] = Icons.circle_outlined;
          x[3] = false;
          break;
        }
      }
    }
    if (x[3] == false) {
      break;
    }
    count = 0;
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      x[j] = areaIcon[j][i] == Icons.close_rounded ? true : false;
      count += areaIcon[j][i] == Icons.close_rounded ? 1 : 0;
    }
    if (count == 2) {
      for (int j = 0; j < 3; j++) {
        if (x[j] == false && x[3] == true && areaIcon[j][i] == Icons.coronavirus) {
          areaIcon[j][i] = Icons.circle_outlined;
          x[3] = false;
          break;
        }
      }
    }
    if (x[3] == false) {
      break;
    }
    count = 0;
  }

  if (x[3] == true) {
    botPlayer();
  }
}
