import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Sportstasks extends StatefulWidget {
  const Sportstasks({super.key});

  @override
  State<Sportstasks> createState() => _SportstasksState();
}

class _SportstasksState extends State<Sportstasks> {
  Future<List<DocumentSnapshot>> getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('sports').get();
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
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final data = documents[index].data() as Map<String, dynamic>;
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
              );
            }
          }
        },
      ),
    );
  }
}
