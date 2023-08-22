import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add.dart';
import 'detail.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var todo = [];

  @override
  void initState() {

    super.initState();
    loadData();
  }
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedItem = prefs.getString("todo");
    if (savedItem != null){
      setState(() {
        todo = jsonDecode(savedItem);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do app"),
        backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
            // kalau ada AWAIT tmbah ASYNC dkt curly braket terdekat
              onPressed: () async{
                // await = tunggu page habis load ambil ape2 dari page ke2
                var newItem = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPage()));
                if (newItem != null){
                  todo.add(newItem);
                  // Save.
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  // transform list of map into string then save
                  prefs.setString("todo", jsonEncode(todo));
                  setState(() {
                    todo;
                  });
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          // how many rows are there?
          itemCount: todo.length,
          // what to show to every row
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                leading: todo[index]["completed"]! ? const Icon(Icons.check): const SizedBox(),
                title: Text(todo[index]["name"]!),
                subtitle: Text(todo[index]["place"]!),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  var data = await Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>DetailPage(todoItem: todo[index],))
                  );
                  if (data != null){
                    if(data["action"] == 1){
                      todo.remove(data["object"]);
                      // save
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("todo", jsonEncode(todo));
                      setState(() {
                        todo;
                      });
                    } else {
                      var retrievedObject = data["object"];
                      for (var i = 0; 1 < todo.length; i++){
                        if (todo[i]["name"]! == retrievedObject["name"] &&
                            todo[i]["desc"]! == retrievedObject["desc"] &&
                            todo[i]["place"]! == retrievedObject["place"]
                        ){
                          todo[i]["completed"] = !todo[i]["completed"];
                          break;
                        }
                      }
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("todo", jsonEncode(todo));
                      setState(() {
                        todo;
                      });
                    }
                  }
                },
              ),
            );
          }),
    );
  }
}
