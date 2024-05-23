import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/Auth/login.dart';
import 'package:todolist/pages/Drawerhidden/hiddendrawer.dart';
import 'package:todolist/pages/homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  static const String KEYLOGIN = "Login";
  @override
  void initState() {
    super.initState();
    WhereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "Logo",
                child: Container(
                  height: 100.0,
                  child: Image.asset(
                    'assets/logo1.gif',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'ToDo',
                    textStyle:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    speed: Duration(milliseconds: 300),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  void WhereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var userid = sharedPref.getInt('userid');
    var username = sharedPref.getString('username');
    var useremail = sharedPref.getString('useremail');
    var token = sharedPref.getString('token');

    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HiddenDrawer()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }
}
