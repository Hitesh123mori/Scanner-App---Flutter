import 'package:flutter/material.dart';
import 'package:hackathon_scanner_app/CurUser.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final _textController1 = TextEditingController();
  String _displayText1 = CurUser.cur_user!.wa_phone;
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
      //                   labelText: 'Enter some text',
      //                   border: OutlineInputBorder(),
      //                 ),
      //                 keyboardType: TextInputType.number,
      //                 maxLines: null,
      //                 onChanged: (value) {
      //                   // handle onChanged event
      //                 },
      //               ),
      //             ) ,
      //             title: Text("Demo Alert"),
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

      title: Text("Whatsup Number"),
      subtitle: Text(_displayText1),
      leading: Icon(Icons.phone),
    ) ;
  }
}

