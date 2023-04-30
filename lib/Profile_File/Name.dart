import 'package:flutter/material.dart';
import 'package:hackathon_scanner_app/CurUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final _textController1 = TextEditingController();


  @override
  Widget build(BuildContext context) {

    String _displayText1 = CurUser.cur_user!.name;

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
                        labelText: 'Enter Your Name',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (value) {
                        // handle onChanged event
                      },
                    ),
                  ) ,
                  title: Text("Edit Name"),
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

      title: Text("Name"),
      subtitle: Text(_displayText1),
      leading: Icon(Icons.person),
    ) ;
  }
}

