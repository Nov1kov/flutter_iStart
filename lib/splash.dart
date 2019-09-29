import 'dart:async';
import 'package:flutter/material.dart';
import 'package:istart/resultpage.dart';
import 'package:istart/util.dart';

import 'Repository.dart';
import 'auth.dart';
import 'authpage.dart';
import 'hellopage.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    var auth = Auth();
    auth.getCurrentUser().then((user) async {
      await Repository().load();
      if (user != null) {
        openHelloPage();
      }else{
        openAuthPage();
      }
    }).catchError((error) async {
      await Repository().load();
      openAuthPage();
    });
  }

  void openAuthPage() {
     Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => AuthPage(),
    ));
  }

  void openHelloPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HelloPage(),
    ));
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.GradientBottom,
      body: Center(
        child: Text(
          "iStart",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontFamily: "Satisfy",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
