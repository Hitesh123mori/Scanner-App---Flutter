import 'package:flutter/material.dart' ;

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
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>))
            },
          ),
        ),
      ),
    );
  }
}
