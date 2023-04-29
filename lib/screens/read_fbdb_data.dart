import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_scanner_app/user.dart';

class ReadFBDBData extends StatefulWidget {
  const ReadFBDBData({Key? key}) : super(key: key);

  @override
  State<ReadFBDBData> createState() => _ReadFBDBDataState();
}

class _ReadFBDBDataState extends State<ReadFBDBData> {
  final _userSteram = FirebaseFirestore.instance.collection('/users/${UserId.uid}/contacts').snapshots();

  void pr(){
    print(UserId.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reading firebase data"),),
      body: StreamBuilder(
        stream: _userSteram,
        builder: (context, snapshots) {
          if (snapshots.hasError){
            return const Text("Error connecting database");
          }
          if (snapshots.connectionState == ConnectionState.waiting){
            return const Text("Loading Data");
          }

          var docs = snapshots.data!.docs;
          // pr();
          return Text('${docs.length}');

          // return ListView.builder(
          //     itemCount: docs.length,
          //     itemBuilder: (context, index){
          //       return ListTile(
          //         leading: Icon(Icons.person),
          //         title: Text(docs[index]['name']),
          //         subtitle: Text(docs[index]["email"]),
          //
          //       );
          //     }

          // );


        },
      ),
    );
  }
}
