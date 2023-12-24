import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../addnewtask.dart';

class Othertasks extends StatefulWidget {
  const Othertasks({super.key});

  @override
  State<Othertasks> createState() => _OthertasksState();
}

class _OthertasksState extends State<Othertasks> {
  Future<List<DocumentSnapshot>> getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('other').get();
    return querySnapshot.docs;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final List<DocumentSnapshot> documents = snapshot.data!;
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final data =
                          documents[index].data() as Map<String, dynamic>;
                      // Use 'data' to access specific fields in your document
                      // For example, if you have a field named 'name':
                      // final name = data['name'];
                      return ListTile(
                          title: Text(data["task"].toString()),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Icon(Icons.update),
                                ),
                                Icon(
                                  Icons.delete,
                                ),
                              ],
                            ),
                          ) // Display the data here
                          );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyWidget(),
                                          ));

                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) => Column(
                                      //     children: [
                                      //       Padding(
                                      //         padding:
                                      //             const EdgeInsets.all(28.0),
                                      //         child: Container(
                                      //           height: 500,
                                      //           width: double.infinity,
                                      //           decoration: BoxDecoration(
                                      //               color: Colors.white,
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       15)),
                                      //           child: Column(
                                      //             children: [
                                      //               Text("Add Your Task"),
                                      //               Expanded(
                                      //                 child: SizedBox(
                                      //                     child: TextFormField(
                                      //                   onChanged: (value) =>
                                      //                       task = value,
                                      //                 )),
                                      //               ),
                                      //               ElevatedButton(
                                      //                   onPressed: () {
                                      //                     function1();
                                      //                   },
                                      //                   child: Text("ADD"))
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // );
                                    },
                                    child: Icon(Icons.add)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          }
        },
      ),
    );
  }
}
