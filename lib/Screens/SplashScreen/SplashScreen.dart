import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vcd/PageTransitions/FadeAnimation.dart';
import 'package:vcd/Screens/HomePageScreen/HomePageScreen.dart';
import 'package:vcd/Screens/SignInScreen/SignInScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSignIn = false;

  void startTimer() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        FadeRoute(
          page: isSignIn ? HomePageScreen() : SignInScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/Splashscreen.png',
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/VCD-logo-white.png',
        ),
      ),
    ));
  }
}
