import 'package:flutter/material.dart';
import 'package:hackathon_scanner_app/Profile_File/Address.dart';
import 'package:hackathon_scanner_app/Profile_File/Mobile.dart';

import '../Profile_File/Email.dart';
import '../Profile_File/Name.dart';
import '../Profile_File/Phone.dart';
import '../Profile_File/Website.dart';


class EditableText1 extends StatefulWidget {
  const EditableText1({Key? key}) : super(key: key);

  @override
  _EditableText1State createState() => _EditableText1State();
}

class _EditableText1State extends State<EditableText1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Stack(
              alignment: Alignment.bottomRight,
                children:[

                  CircleAvatar(radius: 100,backgroundColor: Colors.black,),
                  FloatingActionButton(onPressed: (){

                  },child: Icon(Icons.edit),) ,
                ]
            ) ,
            Name() ,
            Divider() ,
            Phone() ,
            Divider() ,
            Mobile(),
            Divider() ,
            Emails(),
            Divider() ,
            Website() ,
            Divider() ,
            Address(),
            Divider() ,

            ElevatedButton(onPressed: (){}, child: Text("Update QR Code"))
          ],
        ),
      ),
    );
  }
}

