import 'package:flutter/material.dart';
import 'package:projetocurso/Api/deleted.dart';

class deletedAnotations extends StatefulWidget {
  const deletedAnotations({Key? key}) : super(key: key);

  @override
  State<deletedAnotations> createState() => _deletedAnotationsState();
}

class _deletedAnotationsState extends State<deletedAnotations> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(deleted.workDeleted);
    print("Deus seja louvado !!! ${deleted.workDeleted.isEmpty}");
    return SafeArea(child: Scaffold(appBar: AppBar(backgroundColor: Colors.black, title: const Text("Deleted Anotations", style:
      TextStyle(fontSize: 20, color: Colors.white),), centerTitle: true,),
    body: SingleChildScrollView(
      child: Container(child: Column(children: <Widget>[

        Scrollbar(thickness: 10, thumbVisibility: true, controller: scrollController,
            child: SizedBox(child: ListView.builder(shrinkWrap: true, controller: scrollController,
              itemCount: deleted.workDeleted.length ,itemBuilder: (context, index) {
              return ListTile(onTap: () {
                showDialog(context: context, builder: (a){
                  return AlertDialog(actionsAlignment: MainAxisAlignment.center,
                    title: const Text("Delete ?"), content: const Text("Do you really want delete forever this annotation ?"),
                  actions: <Widget>[
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black))
                        ,onPressed: () {
                      try {
                        deleted.workDeleted.removeAt(index);
                        setState(() {

                        });
                        Navigator.pop(a);
                      } catch(e) {
                        print(e.toString());
                      }
                        }, child: const Text("Yes")),
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)), onPressed: () {
                      Navigator.pop(a);
                    }, child: const Text("Cancel")),

                  ],);
                });
              },
                title: Text(deleted.workDeleted[index]["titleDeleted"], style: const TextStyle(fontWeight:
              FontWeight.w600)),
                subtitle: Text("${deleted.workDeleted[index]["subjectDeleted"]} - ${deleted.workDeleted[index]["whereDeleted"]}",
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                );
            },),))

      ]),),
    )
      ,));
  }
}
