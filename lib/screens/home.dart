import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' ;
import 'package:hackathon_scanner_app/screens/list_contacts.dart';
import 'package:hackathon_scanner_app/screens/login_screen.dart';
import 'package:hackathon_scanner_app/widgets/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';

import '../row_material/setting.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                  child: const DrawerHeader(
                      child: CircleAvatar()
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
