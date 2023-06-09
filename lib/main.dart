import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' ;
import 'package:hackathon_scanner_app/screens/SplashScreen.dart';
import 'package:hackathon_scanner_app/screens/list_contacts.dart';
import 'package:hackathon_scanner_app/screens/register.dart';

void main ()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // theme: ThemeData.dark(),
      home: SplashScreen(),
        // home: ContactList(),
    ) ;
  }
}
