import 'dart:async';
import 'package:Districap/routes.dart';
import 'package:Districap/screens/onboarding/onboarding_screen.dart';
import 'package:Districap/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    bool showOnboarding = prefs.getBool('ON_BOARDING') ?? true;

    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => showOnboarding ? OnBoardingScreen() : SignInScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Image.asset(
                'assets/images/logoSplash.png',
                height: 300.0,
                width: 300.0,
              ),
            ),
            SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Facilitez vos achats, boostez votre sécurité avec DISTRICAP !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Color(0xFFDD072A)),
                  ),
                  SizedBox(height: 20.0),
                  Text('Loading'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarTextStyle:
          TextTheme(headline6: TextStyle(color: Color(0XFFDD072A)))
              .bodyText2,
          titleTextStyle:
          TextTheme(headline6: TextStyle(color: Color(0XFFDD072A)))
              .headline6,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
      ),
      routes: routes,
    );
  }
}