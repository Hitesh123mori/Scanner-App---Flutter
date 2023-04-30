import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
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
  bool isanimate = false ;
  @override
  void initState() {
    super.initState();
       startanimation ();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         backgroundColor: AppColors.theme["primaryColor"] ,
        body:



                   Center(child: Image(image: AssetImage("assets/Images/logo1.jpg"),)),







      ),

    )  ;
  }

  Future startanimation() async {
    await Future.delayed(Duration(milliseconds: 50)) ;
    setState(() {
      isanimate = true ;
    });
    await Future.delayed(Duration(milliseconds: 500)) ;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
  }
}
