import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubUsers/ui/pages/user_list_page.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  SplashScreenPageState createState() {
    // TODO: implement createState
    return SplashScreenPageState();
  }

}

class SplashScreenPageState extends State<SplashScreenPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    timeDilation = 7;
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset('assets/images/logo1.png', width: 43, height: 43,),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _timerToReplacement();
  }

  _timerToReplacement(){
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserListPage())
            )
    );

  }

  @override
  void dispose() {
    super.dispose();
  }
}