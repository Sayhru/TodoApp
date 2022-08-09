//Deus seja louvado !!!!


// ignore_for_file: file_names

import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:projetocurso/Screens/Account/deletedAnotations.dart';
import 'package:projetocurso/Screens/Dashboard.dart';

// ignore: camel_case_types
class dashboardAC extends StatefulWidget {
  const dashboardAC({Key? key}) : super(key: key);

  @override
  State<dashboardAC> createState() => _dashboardACState();
}

class _dashboardACState extends State<dashboardAC> with TickerProviderStateMixin{
  int currentint = 0;
  late TabController tabController = TabController(length: 2, vsync: this, initialIndex: currentint);
  @override
  Widget build(BuildContext context) {// Color.fromRGBO(255, 72, 106, 1),
    double height = MediaQuery.of(context).size.width;
    print("Deus me perdoe !!!!" +  MediaQuery.of(context).size.width.toString());
    return SafeArea(child: Scaffold(bottomNavigationBar: CircleNavBar(activeIcons: [
      const Icon(Icons.account_circle_rounded, color: Colors.white,),
      const Icon(Icons.add_chart, color: Colors.white,),
    ],
    inactiveIcons: [
      const Text("Account", style: TextStyle(fontSize: 16, color: Colors.white)),
      const Text("Works", style: TextStyle(fontSize: 16, color: Colors.white)),
    ],
      color: Colors.black,
      height: 60,
      circleWidth: 60,
      initIndex:  currentint,
      onChanged: (v) {
      currentint = v;
      tabController.animateTo(currentint);
      setState(() {
        switch(currentint) {
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
            break;

        }
      });
      },
      padding: const EdgeInsets.only(),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      shadowColor: Colors.white,
      elevation: 10,
    ),
      backgroundColor: const Color.fromRGBO(255, 72, 106, 1),
      appBar: AppBar(backgroundColor: Colors.black, title: const Text("Account", style: TextStyle(
        color: Colors.white, fontSize: 20),), centerTitle: true, automaticallyImplyLeading: false),

    body: Column(
      children: <Widget>[

      const SizedBox(height: 15,),

      const Align(alignment: Alignment.center ,child:
      CircleAvatar(backgroundColor: Color.fromRGBO(255, 72, 106, 1),
          backgroundImage: AssetImage("lib/assets/account.png"),radius: 80)),
        const SizedBox(height: 25,),
        ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
            minimumSize: MaterialStateProperty.all<Size>(Size(height,50)),
            side:
        MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.pinkAccent, width: MediaQuery.of(context).size.width ))
        ), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const deletedAnotations())); }, child: const Text("Show deleted anotations", style: TextStyle(
          fontSize: 16, color: Colors.white
        ),)),

    ],),
    ));
  }
}
