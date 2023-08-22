import 'package:flutter/material.dart';
import 'home.dart';

class AddPage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  var placeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Page"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 5,),
            TextField(
              decoration: const InputDecoration(hintText: "enter name", border: OutlineInputBorder(),),controller: nameEditingController,
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: const InputDecoration(hintText: "enter description", border: OutlineInputBorder(),), controller: descEditingController,
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: const InputDecoration(hintText: "enter place", border: OutlineInputBorder(),), controller: placeEditingController,
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              // print(nameEditingController.text);
              // print(descEditingController.text);
              // print(placeEditingController.text);

              var newItem = {
                "name":nameEditingController.text,
                "desc":descEditingController.text,
                "place":placeEditingController.text,
                "completed":false,
              };
              Navigator.pop(context, newItem);

            },
                child: const Text("Add to-do list"))
          ],
        ),
      ),
    );
  }
}
