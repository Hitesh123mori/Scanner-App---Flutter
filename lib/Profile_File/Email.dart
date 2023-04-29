import 'package:flutter/material.dart';

class Emails extends StatefulWidget {
  const Emails({Key? key}) : super(key: key);

  @override
  State<Emails> createState() => _EmailsState();
}

class _EmailsState extends State<Emails> {
  final _textController1 = TextEditingController();
  String _displayText1 = '';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // trailing: IconButton(
      //   onPressed: () {
      //     showDialog(
      //         context: context,
      //         builder: (context) {
      //           return AlertDialog(
      //             content: Container(
      //               width: MediaQuery.of(context).size.width*0.7 ,
      //               child: TextFormField(
      //                 controller: _textController1,
      //                 decoration: InputDecoration(
      //                   labelText: 'Enter Email Here',
      //                   border: OutlineInputBorder(),
      //                 ),
      //                 keyboardType: TextInputType.emailAddress,
      //                 maxLines: null,
      //                 onChanged: (value) {
      //                   // handle onChanged event
      //                 },
      //               ),
      //             ) ,
      //             title: Text("Change Email"),
      //             actions: [
      //               TextButton(
      //                   onPressed: () {
      //                     setState(() {
      //                       _displayText1 = _textController1.text;
      //                       _textController1.clear();
      //                       Navigator.pop(context);
      //                     });
      //                   },
      //                   child: Text("Save")),
      //
      //             ],
      //           );
      //         });
      //   },
      //   icon: Icon(
      //     Icons.edit,
      //   ),
      // ),

      title: Text("Email"),
      subtitle: Text(_displayText1),
      leading: Icon(Icons.email),
    ) ;
  }
}

