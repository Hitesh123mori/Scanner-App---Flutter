import 'dart:async';
import 'dart:math' as math ;
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

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(duration: Duration(seconds: 5), vsync: this)..repeat();

  void dispose()
  {
    _controller.dispose() ;
    super.dispose() ;
  }
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
              AnimatedBuilder(
                animation: _controller,
                child: Center(
                  child: Container(
                    color: Colors.red,
                    width: 300 ,
                    child: Container(color: Colors.green,
                      width: 23,height: 420,),
                  ),
                ),
                builder: (BuildContext context , Widget ? child) {
                  return Transform.rotate(
                    angle: _controller.value * 50 * math.pi,
                    child: child,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    )  ;
  }
}
