import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubUsers/ui/pages/user_list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Github',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Hero(
              tag: 'logo',
              child: Image.asset('assets/images/logo1.png', width: 43, height: 43,),
            ),
            const SizedBox(
              height: 250,
            ),
            Text(
              AppLocalizations.of(context)!.welcome_msg,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 16
              ),
              textAlign: TextAlign.center,

            )
          ],
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