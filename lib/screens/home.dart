import 'package:flutter/material.dart' ;
import 'package:hackathon_scanner_app/widgets/app_colors.dart';

import '../row_material/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("Leads"),
          // backgroundColor: ,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width*0.75,
                  width: MediaQuery.of(context).size.width*0.75,
                  child: const DrawerHeader(
                      child: CircleAvatar()
                  )
              ) ,
              Divider(color: AppColors.theme[""],),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>bussinesInfo())) ;
                },
                child: const ListTile(
                  title: Text("Setting"),
                  leading: Icon(Icons.settings),
                ),
              ),
              const ListTile(
                title: Text("Log Out"),
                leading: Icon(Icons.logout),
              )
            ],
          ),
        ),
        // backgroundColor: ,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.75,left: MediaQuery.of(context).size.width*0.75),
              child: FloatingActionButton(
                  onPressed: (){},
                  child:Icon(Icons.document_scanner_outlined,) ,
              ),
            )
          ],
        ),
      ),
    ) ;
  }
}