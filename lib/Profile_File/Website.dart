import 'package:flutter/material.dart';

class Website extends StatefulWidget {
  const Website({Key? key}) : super(key: key);

  @override
  State<Website> createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  final _textController1 = TextEditingController();
  String _displayText1 = '';
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
                        labelText: 'Enter Your Website Name',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (value) {
                        // handle onChanged event
                      },
                    ),
                  ) ,
                  title: Text("Edit Website Name"),
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

      title: Text("Website"),
      subtitle: Text(_displayText1),
      leading: Icon(Icons.web),
    ) ;
  }
}

