// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projetocurso/Api/Responsive.dart';
import 'package:projetocurso/Api/deleted.dart';
import 'package:projetocurso/Screens/Account/dashboardAC.dart';
import 'package:projetocurso/Screens/editPage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'addPage.dart';


// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
//"gloria á Deus !!!","obrigado Senhor Jesus Cristo", "obrigado Pai !!!"

  //criar metodo de checkagem de criação de File
  bool? hasCreate;

  Dashboard({Key? key}) : super(key: key);

  List getWorkList() {
    return _DashboardState.workList;
  }


  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File( "${diretorio.path}/dados.json" );
  }

  Future<File> _getFileDeleted() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File( "${diretorio.path}/dadosDeleted.json" );
  }

  readFile() async {
    try {

      final arquivo = await _getFile();
      return arquivo.readAsString();

    } catch(e) {
      return null;
    }
  }

  Map<String, dynamic> workListMap = {};
    //TODO
  saveFile(String anotation, String subject, String where) async {
  try {

    var arquivo = await _getFile();

    //String anotation, String subject, String where
    workListMap["title"] = anotation;
    workListMap["subject"] = subject;
    workListMap["where"] = where;
    _DashboardState.workList.add(workListMap);
    String dados = json.encode(_DashboardState.workList);
    arquivo.writeAsString(dados);
    print("Dados do json: $dados");
    // print(workList.length);
    // print(workList);
} catch(e) {
  print(e.toString());
}

  }

  saveDeleted(String anotation, String subject, String where) async{
    print("Deus seja louvado !!!!!!!");
    Map<String, dynamic> workDeletedMap = {};
    try {
      var arquivo = await _getFileDeleted();
      workDeletedMap["titleDeleted"] = anotation;
      workDeletedMap["subjectDeleted"] = subject;
      workDeletedMap["whereDeleted"] = where;
      deleted.workDeleted.add(workDeletedMap);
      print(deleted.workDeleted);
      String dados = json.encode(deleted.workDeleted);
      arquivo.writeAsString(dados);
      print("Deus seja louvado !!! " + dados );

    } catch(e) {
      print(e.toString());
    }

  }


  void saveEdit(String thing, int choice, int index, List workList) async{
    switch(choice) {
      case 1:
        var arquivo = await _getFile();

        workList[index]["title"] = thing;
        String dados = json.encode(_DashboardState.workList);
        arquivo.writeAsString(dados);
        print("Dados do json: " + dados);
        break;
      case 2:
        var arquivo = await _getFile();

        workList[index]["subject"] = thing;
        String dados = json.encode(_DashboardState.workList);
        arquivo.writeAsString(dados);
        print("Dados do json: $dados");
        break;
      case 3:
        var arquivo = await _getFile();

        workList[index]["where"] = thing;
        String dados = json.encode(_DashboardState.workList);
        arquivo.writeAsString(dados);
        print("Dados do json: $dados");
        break;
    }
  }

  void saveWorklist() async{
    var arquivo = await _getFile();
    String dados = jsonEncode(_DashboardState.workList);
    arquivo.writeAsString(dados);
  }

  @override
  State<Dashboard> createState() => _DashboardState();
}



class _DashboardState extends State<Dashboard> with TickerProviderStateMixin{

  final ScrollController _scrollController = ScrollController();

  final TextEditingController _anotation = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _where = TextEditingController();
  TextStyle errorStyle = const TextStyle(fontSize: 16, color: Colors.white);


  _pageSelector(int choice, String anotation2, String subject, String where, int index) {
    switch(choice) {
      case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const addPage()));
      break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => editPage(anotation2,subject,where,index)));
        break;
      case 3:

        break;
    }
  }

  static List workList = [];
  int tabIndex = 1;
  late TabController tabController = TabController(length: 2, vsync: this, initialIndex: tabIndex);
  Dashboard _dash = Dashboard();

  //possivel erro, mas se Deus quiser vou resolver logo
  @override
  void initState() {
    super.initState();
    _dash.readFile().then( (dados) {
      setState(() {
        workList = json.decode(dados);
        print("itens: " + workList.toString());
      });
    } );
  }
  

  @override
  Widget build(BuildContext context) {
    double heightList = 0.0;
    double height  = MediaQuery.of(context).size.height;
    if(MediaQuery.of(context).size.height < 400) {
      print("gloria á Deus amém !!!");
      heightList = (MediaQuery.of(context).size.height / 2)  + 207 + responsive.heightList;
    } else {
      print("");
      heightList = (MediaQuery.of(context).size.height / 2)  + 270 + responsive.heightList;
    }
    double heightBottom = (height / 8);
    addText() {
      if(workList.length <= 0) {
        return Container(child: Padding(padding: EdgeInsets.only(top: height / 4),
          child: const Text("No Data", style: TextStyle(fontSize: 24, color: Colors.white
        ),),));
      } else {
        return Padding(padding: EdgeInsets.only(left: height / 4, right: height / 4 + 80));
      }
    }


    return SafeArea(child: Scaffold(appBar:
    AppBar(title: const Text("Works", style: TextStyle(fontSize: 20, color: Colors.white)),
     automaticallyImplyLeading: false, centerTitle: true, backgroundColor: Colors.black,),


      body: HawkFabMenu(icon: AnimatedIcons.menu_arrow,fabColor: Colors.black, iconColor: Colors.white, items: [
        HawkFabMenuItem(label: "Add Work", ontap: () { print("gloria á Deus !!!"); _pageSelector(1, "","","",0); },
            color: Colors.black, icon: const Icon(Icons.add, color: Colors.white), labelColor: Colors.black),
      ],
        body: SingleChildScrollView( child:
      Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [
        Color.fromRGBO(255, 72, 106, 1),
        Color.fromRGBO(255, 72, 106, 1),
      ])), child:
      Scrollbar(thickness: 10,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,  children: <Widget>[

          addText(),

          Scrollbar( thickness: 10, thumbVisibility: true,
            controller: _scrollController,
            child: SizedBox(height: heightList, child: Scrollbar( thickness: 10,
              child: ListView.builder(controller: _scrollController, itemCount: workList.length, itemBuilder: (context, index) {

               // final item = workList[index];

                return Slidable( key: UniqueKey(), startActionPane: ActionPane(motion: const ScrollMotion(), dismissible:
                  DismissiblePane(onDismissed: () {
                    try {
                      showDialog(context: context, builder: (a){
                        return AlertDialog(actionsAlignment: MainAxisAlignment.center
                          , alignment: Alignment.center, title: const Text("Delete ?"), content:
                        const Text("You can access this anotation in your account page!"),
                          actions: <Widget>[
                            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black))
                                ,onPressed: () {
                                  _dash.saveDeleted(workList[index]["title"],
                                      workList[index]["subject"], workList[index]["where"]);
                                  print("gloria á Deus !!!"); workList.removeAt(index);
                                  _dash.saveWorklist();
                                  Navigator.pop(a);
                                  setState(() {

                                  });
                                }, child: const Text("Yes")),
                            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black))
                                , onPressed: () {
                              Navigator.pop(a);
                              setState(() {

                              });
                            }, child: const Text("Cancel")),

                          ],);
                      });
                    } catch(e) {
                      print(e.toString());
                    }
                  }),children: [
                    SlidableAction(onPressed: (context) {
                      setState(() {
                        print("gloria á Deus !!! amém ");
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(actionsAlignment: MainAxisAlignment.center
                            , title: const Text("Delete ?"), content:
                          const Text("You can access this anotation in your account page!"),
                            actions: <Widget>[
                              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black))
                                  ,onPressed: () {
                                   try {
                                    setState(() {
                                      _dash.saveDeleted(workList[index]["title"],
                                          workList[index]["subject"], workList[index]["where"]);
                                      _dash.saveWorklist();
                                      workList.removeAt(index);
                                      Navigator.pop(context);
                                    });
                                   } catch(e) {
                                     print(e.toString());
                                   }
                                  }, child: const Text("Yes")),
                              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black))
                                  , onPressed: () {
                                Navigator.pop(context);
                              }, child: const Text("Cancel")),

                            ],);
                        });
                      });
                    }, backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white, icon: Icons.delete, label: "Delete",),
                ], ),
                    endActionPane: ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(flex: 2, onPressed: (context) {
                        print("Deus me perdoe !!!");
                        _pageSelector(2, workList[index]["title"], workList[index]["subject"], workList[index]["where"], index);
                      }, backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white, icon: Icons.edit, label: "Edit",)
                    ]),

                    child: Scrollbar(controller:  _scrollController,thickness: 10,
                      child: ListTile(onLongPress: () { _pageSelector(2, workList[index]["title"],
                      workList[index]["subject"], workList[index]["where"], index);},
                  subtitle: Text(workList[index]["subject"].toString() + " - ${workList[index]["where"]}",
                        style: const TextStyle(fontSize: 16, color: Colors.white)),
                  title: Text(workList[index]["title"].toString(), style: const TextStyle(fontSize: 20, color: Colors.white),),),
                    ));
              }),
            )),
          ),


        ],),
      )),
      )),

      bottomNavigationBar: CircleNavBar(activeIcons: const [
          Icon(Icons.account_circle_rounded, color: Colors.white,),
          Icon(Icons.add_chart, color: Colors.white),
      ],
        inactiveIcons: const [
          Text("Account", style: TextStyle(fontSize: 16, color: Colors.white),),
          Text("Works", style: TextStyle(fontSize: 16, color: Colors.white),),
        ],
        color: Colors.black,
        height: 60,
        circleWidth: 60,
        initIndex: tabIndex,
        onChanged: (v)
        {
        tabIndex = v;
        tabController.animateTo(v);
        setState(() {
          print("Deus me perdoe !!! $tabIndex");
          switch(tabIndex) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const dashboardAC()));
              break;
            case 1:

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


    ));
  }
}
