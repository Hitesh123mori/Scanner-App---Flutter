import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/app_colors.dart';
import 'home.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),(){
      FirebaseAuth.instance.authStateChanges().listen((event) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>
            event != null
                ? HomeScreen()
                : LoginScreen()));
      });
    }) ;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         backgroundColor: AppColors.theme["primaryColor"] ,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar() ,
            ],
          ),
        ),
      ),
    )  ;
  }
}
