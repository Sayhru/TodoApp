// ignore: file_names

import 'package:flutter/material.dart';
import 'package:projetocurso/Screens/Dashboard.dart';

class editPage extends StatefulWidget {

  String? anotation = "";
  String? subject = "";
  String? where = "";
  int? index = 0;
  editPage(this.anotation,this.subject,this.where,this.index);
  @override
  // ignore: no_logic_in_create_state
  State<editPage> createState() => _editPageState(anotation, subject, where, index);

  Dashboard a1 = new Dashboard();

 static void saveEdit(String anotation,String subject,String where, int index) {
    Dashboard a1 = Dashboard();
    a1.saveEdit(anotation, 1, index, a1.getWorkList());
    a1.saveEdit(subject, 2, index, a1.getWorkList());
    a1.saveEdit(where, 3, index, a1.getWorkList());
  }



}

class _editPageState extends State<editPage> {


  int a = 0;
  String? anotation = "";
  String? subject = "";
  String? where = "";
  int? index = 0;
  _editPageState(this.anotation,this.subject,this.where,this.index);

  final TextEditingController _tecAnotation = TextEditingController();
  final TextEditingController _tecSubject = TextEditingController();
  final TextEditingController _tecWhere = TextEditingController();

  String result = "";
  var style = const TextStyle(fontSize: 16, color: Colors.red);
  void _openButton(String anotation, String subject, String where) {
    if(anotation == "" || subject == "" || where == "") {
      setState(() {
        result = "Please write in all fields !";
      });
    } else {
      setState(() {
        result = "Done !";
        style = const TextStyle(fontSize: 16, color: Colors.green);
      });
      editPage.saveEdit(_tecAnotation.text, _tecSubject.text, _tecWhere.text, int.parse(index.toString()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
    }
  }
  void startField() {
    print("gloria á Deus !!!");
    if(a == 0) {
      _tecAnotation.text = anotation.toString();
      _tecSubject.text = subject.toString();
      _tecWhere.text = where.toString();
      a++;
    } else {
      print("bloqueado");
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double heightDevice2 = MediaQuery.of(context).size.height - 90;

    // ignore: unused_local_variable
    double widthDevice = MediaQuery.of(context).size.width;
    print("wow");
    startField();
    return SafeArea(child: Scaffold(appBar: AppBar(backgroundColor: Colors.white, centerTitle: true, title: const Text("Edit Page", style:
    TextStyle(fontSize: 22, color: Colors.black))),

      body: SingleChildScrollView(
        child: Container(height: heightDevice2, color: Colors.black, child:
        Column(children: <Widget>[

          const SizedBox(height: 10, width: 900),

          const Text("Please write below your anotation edit", style: TextStyle(fontSize: 22, color: Colors.white,)),
          const SizedBox(height: 20,),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.5), child: Container(decoration: BoxDecoration(color: Colors.grey[200],
            border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(12),),
            child: Padding(padding: const EdgeInsets.only(left: 20.0),
              child: TextField(controller: _tecAnotation, decoration: InputDecoration(border: InputBorder.none, hintText: "Anotation",
                  labelText: anotation,),
              ),),),),
          const SizedBox(height: 10,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.5), child: Container(decoration: BoxDecoration(color: Colors.grey[200],
            border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(12),),
            child: Padding(padding: const EdgeInsets.only(left: 20.0),
              child: TextField(controller: _tecSubject, decoration: InputDecoration(border: InputBorder.none, hintText: "Subject",
                  labelText: subject),
              ),),),),
          const SizedBox(height: 10,),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.5), child: Container(decoration: BoxDecoration(color: Colors.grey[200],
            border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(12),),
            child: Padding(padding: const EdgeInsets.only(left: 20.0),
              child: TextField(controller: _tecWhere, decoration: InputDecoration(border: InputBorder.none, hintText: "Anotation",
                  labelText: where),
              ),),),),
          const SizedBox(height: 10,),
          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          ), onPressed: () { _openButton(_tecAnotation.text, _tecSubject.text, _tecWhere.text); }, child: const Text("Edit !", style: TextStyle(fontSize: 18, color: Colors.black),)),
          Text(result, style: style),
          SizedBox(height: heightDevice /4 + 72,),
          const Text("Deus seja louvado !!!", style: TextStyle(fontSize: 22, color: Colors.white)),
        ]),),
      ),

    ));
  }
}
