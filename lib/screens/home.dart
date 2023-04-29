import 'package:flutter/material.dart' ;

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
              DrawerHeader(child: CircleAvatar()) ,
            ],
          ),
        ),
        // backgroundColor: ,
        body: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Here",
                suffixIcon: Icon(Icons.search)
              ),
            )
          ],
        ),
      ),
    ) ;
  }
}