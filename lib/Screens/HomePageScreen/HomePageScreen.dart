import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcd/PageTransitions/FadeAnimation.dart';
import 'package:vcd/Providers/HomePageProvider.dart';
import 'package:vcd/Screens/HomePageScreen/MemberCardScreen/MemberCardScreen.dart';
import 'package:vcd/Screens/HomePageScreen/ReportScreen/ReportScreen.dart';
import 'package:vcd/Screens/SignInScreen/SignInScreen.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var currentIndex = 0;

  void changeIndex(BuildContext context, indexNo) {
    Provider.of<HomePageProvider>(context, listen: false).changeIndex(indexNo);
  }

  @override
  Widget build(BuildContext context) {
    var index = Provider.of<HomePageProvider>(context).index;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff405b81),
        toolbarHeight: 70,
        leading: InkWell(
          onTap: () {},
          child: Image.asset('assets/images/VCD-white-micro-logo.png'),
        ),
        actions: index == 0
            ? [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffD3E7F1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Ashish'.substring(0, 2).toUpperCase(),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ]
            : null,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xffD3E7F1),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index == 0
                      ? Container(
                          width: 42,
                          height: 42,
                        )
                      : Container(
                          width: 42,
                          height: 42,
                          child: IconButton(
                            onPressed: () {
                              changeIndex(context, 0);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xff3D5A80),
                              size: 24,
                            ),
                          ),
                        ),
                  Text(
                    index == 4
                        ? 'Member Card'.toUpperCase()
                        : 'DashBoard'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff3D5A80),
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 42,
                    height: 42,
                  ),
                ],
              )),
          index == 4
              ? MemberCardScreen()
              : Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ReportScreen(),
                  ),
                ),
        ],
      ),
    );
  }
}
