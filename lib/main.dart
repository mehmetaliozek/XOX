import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screen/home.dart';
import 'package:auto_orientation/auto_orientation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  AutoOrientation.portraitUpMode();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XOX',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Home(),
    );
  }
}