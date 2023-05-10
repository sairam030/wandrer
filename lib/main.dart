import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wandrer/src/screens/details_page/details.dart';
import 'package:wandrer/src/screens/home_page/home.dart';
import 'package:wandrer/src/screens/menu_page/menu.dart';

void main(){
  runApp(Wander());
}

class Wander extends StatefulWidget {
  const Wander({Key? key}) : super(key: key);

  @override
  State<Wander> createState() => _WanderState();
}

class _WanderState extends State<Wander> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      home: Menu(),
    );
  }
}
