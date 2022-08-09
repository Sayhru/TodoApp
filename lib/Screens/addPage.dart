import 'package:flutter/material.dart';
import 'package:projetocurso/Api/Responsive.dart';
import 'package:projetocurso/Screens/Dashboard.dart';

// ignore: camel_case_types
class addPage extends StatefulWidget {
  const addPage({Key? key}) : super(key: key);

  @override
  State<addPage> createState() => _addPageState();
}

// ignore: camel_case_types
class _addPageState extends State<addPage> {

  String resultado = "";
  Dashboard a1 = Dashboard();
  void _addPage(String anotation, String subject, String where) {

    if(anotation == "" || subject == "" || where == "") {
      setState(() {
        resultado = "Please write in all fields";
        errorStyle  = const TextStyle(fontSize: 16, color: Colors.redAccent);
      });
    } else {
      setState(() {
        resultado = "Succesfull";
        errorStyle  = const TextStyle(fontSize: 16, color: Colors.greenAccent);
      });
      a1.saveFile(anotation, subject, where);
      responsive.heightList += 10;
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }

  }
  final TextEditingController _anotation = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _where = TextEditingController();
  TextStyle errorStyle = const TextStyle(fontSize: 16, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    double height  = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(appBar: AppBar(centerTitle: true, title: const Text("Add Note",
        style: TextStyle(color: Colors.black, fontSize: 16,))
        ,backgroundColor: Colors.white,),


    body: SingleChildScrollView(
      child: Container(height: height - 70 , color: Colors.black,
          child: Column(
          children: <Widget>[
            
            const Padding(padding: EdgeInsets.only(top: 20), child: Text("Please write below your anotation.",
              style: TextStyle(fontSize: 22, color: Colors.white), textAlign: TextAlign.center),),
            const SizedBox(height: 20.0,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.5), child: Container(decoration: BoxDecoration(color: Colors.grey[200],
              border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(12),),
              child: Padding(padding: const EdgeInsets.only(left: 20.0),
                child:
                TextField(controller: _anotation,decoration: const InputDecoration(border: InputBorder.none, hintText: "Your anotation"),
                ),),),),
            const SizedBox(height: 20.0,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.5), child: Container(decoration: BoxDecoration(color: Colors.grey[200],
              border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(12),),
              child: Padding(padding: const EdgeInsets.only(left: 20.0),
                child:
                TextField(controller: _subject, decoration: const InputDecoration(border: InputBorder.none, hintText: "Your subjection"),
                ),),),),
            const SizedBox(height: 20.0,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.5), child: Container(decoration: BoxDecoration(color: Colors.grey[200],
              border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(12),),
              child: Padding(padding: const EdgeInsets.only(left: 20.0),
                child:
                TextField(controller: _where, decoration: const InputDecoration(border: InputBorder.none, hintText: "Where ?"),
                ),),),),
              const SizedBox(height: 10.0),
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white), shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)
              )))
                  ,onPressed: () { print("gloria á Deus !!! amém"); _addPage(_anotation.text,_subject.text,_where.text); }, child: const Text("Add Note",
                style: TextStyle(fontSize: 16, color: Colors.black))),
                const SizedBox(height: 5.0,),
                Text(resultado, style: errorStyle,),
            
          ],)),
    ),));
  }
}
