import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vcd/PageTransitions/FadeAnimation.dart';
import 'package:vcd/Providers/DeviceProvider.dart';
import 'package:vcd/Screens/HomePageScreen/HomePageScreen.dart';
import 'package:vcd/Screens/SignInScreen/SignInScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSignIn = false;

  String deviceName = '';
  String deviceVersion = '';
  String identifier = '';

  var deviceInfo;

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

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

    initPlatformState();
    startTimer();

    super.initState();
  }

  Future<void> initPlatformState() async {
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;

        setState(() {
          deviceName = build.model;
          deviceVersion = build.version.toString();
          identifier = build.androidId;
        });
        deviceInfo = build;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = data.name;
          deviceVersion = data.systemVersion;
          identifier = data.identifierForVendor;
        }); //UUID for iOS

        deviceInfo = {
          'deviceName': data.name,
          'deviceVersion': data.systemVersion,
          'identifier': data.identifierForVendor,
        };
      }

      getDeviceInfo(context, deviceInfo);
    } catch (e) {
      print(e);
    }
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
          'assets/images/VCD-logo.png',
        ),
      ),
    ));
  }

  void getDeviceInfo(BuildContext context, deviceInfo) {
    print(deviceInfo.androidId.toString());
    Provider.of<DeviceProvider>(context, listen: false)
        .getDeviceDataDetails(deviceInfo.androidId.toString());
  }
}
