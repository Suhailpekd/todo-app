import 'package:flutter/material.dart';

class Addtasks extends StatefulWidget {
  const Addtasks({super.key});

  @override
  State<Addtasks> createState() => _AddtasksState();
}

class _AddtasksState extends State<Addtasks> {
  var a = [
    "home",
    "Sports",
    "design",
    "home work",
    "e learning",
    "shoping",
    "food"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: a.length,
        itemBuilder: (context, index) => InkWell(
          child: ListTile(
            title: Text("${a[index]}"),
            trailing: Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );
  }
}
