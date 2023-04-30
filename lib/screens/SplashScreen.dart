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
        body: SafeArea(
          child: Stack(
                 children: [
                   // Ex(child: Image(image: AssetImage("assets/Images/logo1.jpg"),)),
                   AnimatedPositioned(
                     top : isanimate  ? -12 : -24,
                      left: isanimate ? -50 : -87 ,
                       duration: Duration(milliseconds:450),
                       child: Image(
                         width: 300,
                         height: 150,
                         image: AssetImage("assets/Images/topleftcorner.jpg"),
                       ),
                   ) ,
                   AnimatedPositioned(
                     bottom : isanimate  ? -20 : -24,
                     right: isanimate ? -70 : -87 ,
                     duration: Duration(milliseconds:450),
                     child: Image(
                       width: 300,
                       height: 150,
                       image: AssetImage("assets/Images/bottomrightcorner.jpg"),
                     ),
                   ) ,

                 ],
               ),
        )


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
