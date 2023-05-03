import 'package:flutter/material.dart';
import 'package:hackathon_scanner_app/Profile_File/Address.dart';
import 'package:hackathon_scanner_app/Profile_File/Mobile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart' ;
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
  final ImagePicker _picker = ImagePicker();
  XFile ? file ;
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

                  CircleAvatar(
                    radius: 100,
                    backgroundColor:Colors.white,
                    child: file!=null ? Image.file(File(file!.path),fit:BoxFit.fill )
                        : Icon(Icons.person,size: 50,color: Colors.black54,)

                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: ()async{
                    final XFile ? gallary = await _picker.pickImage(source: ImageSource.gallery) ;
                    setState(() {
                      file = gallary ;
                    });

                  },child: Icon(Icons.edit,color:Colors.white),) ,
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

            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: (){
                  final snackbar1 = SnackBar(
                behavior: SnackBarBehavior.floating,
                padding: EdgeInsets.all(5),
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.grey,
                content : Text("QR Code Updated"),) ;
              ScaffoldMessenger.of(context).showSnackBar(snackbar1) ;

            }, child: Text("Update QR Code"))
          ],
        ),
      ),
    );
  }
}

