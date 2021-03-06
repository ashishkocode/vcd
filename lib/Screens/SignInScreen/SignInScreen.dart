import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import 'package:vcd/PageTransitions/FadeAnimation.dart';
import 'package:vcd/Providers/DeviceProvider.dart';
import 'package:vcd/Screens/ForgotPasswordScreen/ForgotPasswordScreen.dart';
import 'package:vcd/Screens/HomePageScreen/HomePageScreen.dart';
import 'package:vcd/models/SignInmodel.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _loading = false;

  bool _isObscure = true;
  bool isOk = true;
  String? message;
  var deviceData;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var device = Provider.of<DeviceProvider>(context).deviceDataDetails;
    setState(() {
      deviceData = device;
    });

    // print(MediaQuery.of(context).size.height);
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
        child: _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xffD3E7F1),
                ),
              )
            : SingleChildScrollView(
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
                                  ? MediaQuery.of(context).size.height * 0.04
                                  : MediaQuery.of(context).size.height * 0.06),
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
                                  top: MediaQuery.of(context).size.height *
                                      0.055,
                                  bottom: MediaQuery.of(context).size.height *
                                      0.035,
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
                          height: 15,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 5),
                          child: isOk
                              ? null
                              : Text(
                                  '${message}',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffBDE5E8),
                                      decoration: TextDecoration.underline),
                                ),
                        ),
                        Form(
                          key: _formkey,
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff72C3C9),
                                  ),
                                  onSaved: (val) => _email.text = val as String,
                                  controller: _email,
                                  validator: (value) {
                                    if (_email.text.isEmpty) {
                                      return 'Please Enter Email';
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffBDE5E8),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color(0xffBDE5E8),
                                    )),
                                    focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color(0xff72C3C9),
                                    )),
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
                                        color: Color(0xffB5E5DB),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.done,
                                  onSaved: (val) =>
                                      _password.text = val as String,
                                  controller: _password,
                                  validator: (value) {
                                    if (_password.text.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  obscureText: _isObscure,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff72C3C9),
                                  ),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffBDE5E8),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffBDE5E8),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color(0xff72C3C9),
                                    )),
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
                                        color: Color(0xff72C3C9),
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
                                        color: Color(0xffB5E5DB),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height > 642
                                  ? 35
                                  : 25),
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
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height > 642
                                  ? 25
                                  : 10),
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  FadeRoute(page: ForgotPasswordScreen()));
                            },
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

  _signInFunc() async {
    setState(() {
      _loading = true;
    });

    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      String baseUrl = 'https://api.vcdplans.com/auth/jwt';

      var body = {
        'username': _email.text,
        'password': _password.text,
        'deviceID': deviceData,
      };

      final response = await http.post(Uri.parse(baseUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));

      final data = SignIn.fromJson(jsonDecode(response.body));
      print(data.isOK);

      if (data.isOK) {
        Navigator.push(context, FadeRoute(page: HomePageScreen()));
        setState(() {
          _loading = false;
        });
      } else {
        setState(() {
          _loading = false;
          isOk = false;
          message = data.message;
        });
      }
    } else {
      setState(() {
        _loading = false;
      });
    }
    //Navigator.push(context, FadeRoute(page: HomePageScreen()));
  }
}
