import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user.dart';

class ContactList extends StatelessWidget {

  Future<String?> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('UID');
  }

  @override
  Widget build(BuildContext context) {
    // print("UID=${UserId.uid}");
    // UserId.uid = "iOaZmMDYLvQ5W1pZQPzWFJ1hpr32";

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(getUid().toString()) // replace `userId` with the actual user ID
            .collection('contacts')
            .snapshots(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contacts = snapshot.data!.docs
                .map((doc) => Contact(
                name: doc['name'],
                phone: doc['phone'],
            wa_phone: doc['wa phone'],
            email: doc['email'],
            address: doc['addess'],
            website: doc['website']))
                .toList();

            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];

                // return ListTile(
                //   title: Text(contact.name),
                //   subtitle: Text(contact.phone),
                // );

                return InkWell(
                  onTap: (){print("object");},
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        width: MediaQuery.of(context).size.width*0.98,
                        height: 120,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text(contact.name,style: TextStyle(fontSize: 30),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left :18.0),
                                    child: Text(contact.email,style: TextStyle(fontSize:25 ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text(contact.phone,style: TextStyle(fontSize: 25),),
                                  ),

                                ],
                              ),
                            ),
                                Container(
                                  width: 100,
                                    height: 100,
                                    child: IconButton(onPressed: (){}, icon: Image.asset('assets/icons/whatsapp.png'),))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading contacts'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final result = await Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => ContactForm()),
      //     );
      //
      //     if (result == true) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text('Contact added')),
      //       );
      //     }
      //   },
      //   child: Icon(Icons.add),
      // ),

  }
}
