import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todonewappforinfnite/lib/pro.dart';
import 'package:todonewappforinfnite/lib/screens/othertaskspage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var task = "";
  Future<void> function1() async {
    await FirebaseFirestore.instance
        .collection("other")
        .add({"task": task}).then((value) => print("success"));
  }

  @override
  Widget build(BuildContext context) {
    var proride = Provider.of<Task>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Text("Add Your Task"),
              Expanded(
                child: SizedBox(
                    child: TextFormField(
                  onChanged: (value) => task = value,
                )),
              ),
              ElevatedButton(
                  onPressed: () async {
                    proride.incriment();
                    await function1();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Othertasks(),
                      ),
                    );
                  },
                  child: Text("ADD"))
            ],
          ),
        ),
      ),
    );
  }
}
