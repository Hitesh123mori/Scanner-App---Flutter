import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' ;

import '../screens/home.dart';
import 'AutoRespondText.dart';
import 'Profile.dart';

class bussinesInfo extends StatefulWidget {
  const bussinesInfo({Key? key}) : super(key: key);

  @override
  State<bussinesInfo> createState() => _bussinesInfoState();
}

class _bussinesInfoState extends State<bussinesInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 2 ,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())) ;
              },
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Container(
                  width: MediaQuery.of(context).size.width*0.42,
                  child: Tab(
                    text: "Business",
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.42,
                  child: Tab(
                    text: "Auto Respond Text",
                  ),
                ),

              ],

            ),
            title: Text("Setting"),
          ),
          body: TabBarView(
            children: [
              Profile() ,
              EditableTextDemo(),
        ],
      ),
        ),

      ),
    );
  }
}
