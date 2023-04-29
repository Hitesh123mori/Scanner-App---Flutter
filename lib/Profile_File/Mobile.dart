import 'package:flutter/material.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
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
      //                   labelText: 'Enter Mobile Number Here',
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

      title: Text("Mobile"),
      subtitle: Text(_displayText1),
      leading: Icon(Icons.phone),
    ) ;
  }
}

