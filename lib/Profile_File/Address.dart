import 'package:flutter/material.dart';
import 'package:hackathon_scanner_app/CurUser.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final _textController1 = TextEditingController();
  String _displayText1 = CurUser.cur_user!.address;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Container(
                    width: MediaQuery.of(context).size.width*0.7 ,
                    child: TextFormField(
                      controller: _textController1,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Address Here',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (value) {
                        // handle onChanged event
                      },
                    ),
                  ) ,
                  title: Text("Edit Addreass Here"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _displayText1 = _textController1.text;
                            _textController1.clear();
                            Navigator.pop(context);
                          });
                        },
                        child: Text("Save")),

                  ],
                );
              });
        },
        icon: Icon(
          Icons.edit,
        ),
      ),

      title: Text("Address"),
      subtitle: Text(_displayText1),
      leading: Icon(Icons.location_on_rounded),
    ) ;
  }
}

