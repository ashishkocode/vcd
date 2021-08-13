import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vcd/PageTransitions/FadeAnimation.dart';
import 'package:vcd/Providers/DeviceProvider.dart';
import 'package:vcd/Screens/HomePageScreen/HomePageScreen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var deviceData = Provider.of<DeviceProvider>(context).deviceDataDetails;
    print(jsonDecode(deviceData));
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Splashscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height < 600
                            ? MediaQuery.of(context).size.height * 0.06
                            : MediaQuery.of(context).size.height * 0.08),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/VCD-logo.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topLeft,
                          width: 140,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07,
                            bottom: MediaQuery.of(context).size.height * 0.04,
                          ),
                          child: Text(
                            'Welcome Back'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffD3E7F1),
                              height: 1.3,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email or Username',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff72C3C9),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff72C3C9),
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff72C3C9),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff72C3C9),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff72C3C9),
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff72C3C9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top:
                            MediaQuery.of(context).size.height > 642 ? 35 : 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            _signInFunc();
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Color(0xffD3E7F1),
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _signInFunc();
                          },
                          child: Image.asset(
                            'assets/images/ionic-ios-arrow-dropright-circle.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top:
                            MediaQuery.of(context).size.height > 642 ? 25 : 10),
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff72C3C9),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height > 670
                        ? MediaQuery.of(context).size.height > 750
                            ? MediaQuery.of(context).size.height * 0.15
                            : MediaQuery.of(context).size.height * 0.1
                        : 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color(0xffD3E7F1),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Color(0xffF2A744),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signInFunc() {
    //Navigator.push(context, FadeRoute(page: HomePageScreen()));
  }
}
