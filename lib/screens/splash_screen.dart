import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:megabank1/screens/home_screen.dart';

import '../button Naviigation Bar/buttonHome.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                //Home_Screen()
                ButtomHome()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Loading.png')
          ],
        ),
      ),
    );
  }
}
