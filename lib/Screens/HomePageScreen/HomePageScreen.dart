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
      backgroundColor: Color(0xffeaf3f4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff405b81),
        title: index == 0
            ? null
            : Text(
                'Member Card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
        centerTitle: true,
        leading: index == 0
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu_rounded,
                ),
              )
            : IconButton(
                onPressed: () {
                  changeIndex(context, 0);
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
        actions: index == 0
            ? [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                  ),
                ),
              ]
            : null,
      ),
      body: index == 4
          ? MemberCardScreen()
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff405b81),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "There's More to You".toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 18),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Than what meets the eye".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: 260,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Finaly, a vison plan that makes sense.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffeaf3f4),
                    ),
                    child: ReportScreen(),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: currentIndex == 1
                        ? Color(0xff405b81)
                        : Colors.transparent,
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    color: currentIndex == 1 ? Colors.white : Color(0xff405b81),
                    size: 24,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  changeIndex(context, 0);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: index == 0 ? Color(0xff405b81) : Colors.transparent,
                  ),
                  child: Icon(
                    Icons.description_outlined,
                    color: index == 0 ? Colors.white : Color(0xff405b81),
                    size: 24,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: currentIndex == 2
                        ? Color(0xff405b81)
                        : Colors.transparent,
                  ),
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: currentIndex == 2 ? Colors.white : Color(0xff405b81),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
