import 'package:flutter/material.dart';

class EditableTextDemo extends StatefulWidget {
  const EditableTextDemo({Key? key}) : super(key: key);

  @override
  _EditableTextDemoState createState() => _EditableTextDemoState();
}

class _EditableTextDemoState extends State<EditableTextDemo> {
  final _textController = TextEditingController();
  String _displayText = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex:2,child: SizedBox()),
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) {
                // handle onChanged event
              },
            ),
            Expanded(flex:1,child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _displayText = _textController.text;
                  _textController.clear();
                });
              },
              child: Text('Save'),
            ),
            Expanded(child: SizedBox()),
            Text(
              _displayText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
