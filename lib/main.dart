import 'package:flutter/material.dart';
import 'package:vcd/Providers/DeviceProvider.dart';
import 'package:vcd/Providers/HomePageProvider.dart';
import 'package:vcd/Screens/HomePageScreen/HomePageScreen.dart';
import 'package:vcd/Screens/SplashScreen/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DeviceProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Gotham',
          primaryColor: Color(0xffB5E5DB),
        ),
        home: SplashScreen(),
        routes: {
          'dashboard': (context) => HomePageScreen(),
        },
      ),
    );
  }
}
