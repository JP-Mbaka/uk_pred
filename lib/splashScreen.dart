import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uk_pred/main.dart';
import 'package:uk_pred/variables.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("asset/images/me.gif"),
          SizedBox(height: height(context) * 0.002),
          const Center(child: Text("Diabetes Prediction")),
        ],
      )),
    );
  }
}
