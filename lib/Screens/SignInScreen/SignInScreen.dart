import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:vcd/PageTransitions/FadeAnimation.dart';
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
    print(MediaQuery.of(context).size.height);
    return Scaffold(
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
            image: AssetImage('assets/images/Signin.png'),
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
                            ? MediaQuery.of(context).size.height * 0.09
                            : MediaQuery.of(context).size.height * 0.11),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/VCD-logo.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topLeft,
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
                              fontWeight: FontWeight.w600,
                              color: Color(0xff3D5A80),
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
                              fontWeight: FontWeight.w300,
                              color: Color(0xff8b8b8b),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff9e9f9f),
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xffd4dbdc),
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
                              fontWeight: FontWeight.w300,
                              color: Color(0xff8b8b8b),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff9e9f9f),
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xffd4dbdc),
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
                              color: Color(0xffEEA344),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _signInFunc();
                          },
                          child: Image.asset(
                              'assets/images/ionic-ios-arrow-dropright-circle.png'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top:
                            MediaQuery.of(context).size.height > 642 ? 25 : 10),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff8b8b8b),
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
                        color: Color(0xff8b8b8b),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Color(0xffEEA344),
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
    Navigator.push(context, FadeRoute(page: HomePageScreen()));
  }
}
