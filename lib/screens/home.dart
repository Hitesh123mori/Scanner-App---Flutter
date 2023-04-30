import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' ;
import 'package:hackathon_scanner_app/CurUser.dart';
import 'package:hackathon_scanner_app/screens/list_contacts.dart';
import 'package:hackathon_scanner_app/screens/login_screen.dart';
import 'package:hackathon_scanner_app/widgets/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../row_material/setting.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'package:hackathon_scanner_app/user.dart' as user;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _uid = '';
  String _user_qr_data = CurUser.cur_user_string.toString();

  var _user;
  List<DocumentSnapshot> _documents = [];

  @override
  void initState() {
    super.initState();
    _loadUidFromSharedPreferences();
  }

  Future<void> _loadUidFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('UID');
    if (uid != null) {
      setState(() {
        _uid = uid;

      });
      _fetchDataFromFirebase(_uid);
    }
  }

  Future<void> _fetchDataFromFirebase(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        _user = snapshot.docs.map((e) {
          var u = user.User.fromJson(e.data());
          CurUser.cur_user = u;
          print("object==${CurUser.cur_user?.name}");
          return u;
        }).toList();
        CurUser.cur_user_string = jsonEncode(_user);
        _user_qr_data = CurUser.cur_user_string.toString();
        print(CurUser.cur_user_string);
      });
    }
  }


  Future _scanQRCode() async {
    var cameraStatus = await Permission.camera.status;
    if(cameraStatus.isGranted){
      String? qrData = await scanner.scan();
      print(qrData);
    }
    else{
      var isgrant = await Permission.camera.request();
      if (isgrant.isGranted){
        String? qrData = await scanner.scan();
        print(qrData);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("Leads"),
          // backgroundColor: ,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width*0.75,
                  width: MediaQuery.of(context).size.width*0.75,
                  child: DrawerHeader(
                      child: QrImage(data: _user_qr_data,)
                  )
              ) ,
              Divider(color: AppColors.theme[""],),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>bussinesInfo())) ;
                },
                child: const ListTile(
                  title: Text("Setting"),
                  leading: Icon(Icons.settings),
                ),
              ),

              ListTile(
                title: InkWell(
                    onTap:  () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        print("Signed Out");
                      });
                    },

                    child: Text("Log Out")),
                leading: Icon(Icons.logout),
              )
            ],
          ),
        ),
        // backgroundColor: ,

        body: ContactList(),

        floatingActionButton: FloatingActionButton(
          onPressed: (){_scanQRCode();},
          child:Icon(Icons.qr_code_scanner_outlined,) ,

      ),

    )

    );
  }

}
