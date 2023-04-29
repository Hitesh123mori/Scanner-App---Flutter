import 'package:flutter/material.dart' ;
import 'package:hackathon_scanner_app/widgets/app_colors.dart';

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
                  child: DrawerHeader(
                      child: CircleAvatar()
                  )
              ) ,
              Divider(color: AppColors.theme[""],),
              ListTile(
                title: Text("Setting"),
                leading: Icon(Icons.settings),
              ),
              ListTile(
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
              padding: const EdgeInsets.only(top: 700.0,left: 320),
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