import 'package:flutter/material.dart' ;
import 'package:hackathon_scanner_app/screens/SplashScreen.dart';

void main()
{
  runApp(Myapp()) ;
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ) ;
  }
}
