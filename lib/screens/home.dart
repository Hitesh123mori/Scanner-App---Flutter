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

      home: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Scanner"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child: IconButton(
                  icon : Icon(Icons.search),
                  onPressed: (){},
                ),
              ) ,
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting())) ;
                  },

                ),
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Container(
                  width: MediaQuery.of(context).size.width*0.42,
                  child: Tab(
                    text: "Leads",
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width*0.42,
                  child: Tab(
                    text: "Generate QR Code",
                  ),
                )
              ] ,
            ),
          ),
          body: TabBarView(
            children: [
              LeadsTabScreen() ,
              GenerateQRTabscreen(),
            ],
          ),
        ),
      ),
    ) ;
  }
}