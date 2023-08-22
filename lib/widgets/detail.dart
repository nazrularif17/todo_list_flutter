import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // create variable where the send data will be stored
  var todoItem;
  // create a constructer of the Page
  DetailPage({required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Detail Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            const Text(
              "To-do Name:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              todoItem["name"]!,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "To-do Description:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              todoItem["desc"]!,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "To-do Place:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              todoItem["place"]!,
              style: const TextStyle(fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context, {"action": 1, "object": todoItem});
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete")),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context, {"action": 2, "object": todoItem});
                    },
                    icon: const Icon(Icons.check),
                    label: !todoItem["completed"]
                        ? const Text("Mark as Completed")
                        : const Text("Incomplete Item")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
