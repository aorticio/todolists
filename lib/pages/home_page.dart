import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/components/mycalendar.dart';
import 'package:todolist/components/myprofilepage.dart';
import 'package:todolist/components/mytasks.dart';
import 'package:todolist/components/todolist_tile.dart';
import 'package:todolist/services/firebase.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  FireStoreService tasks = FireStoreService();

  void openDialogBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textEditingController,
        ),
        actions: [
          ElevatedButton(
            onPressed: docID == null
                ? () {
                    tasks.addTask(textEditingController.text);
                    Navigator.pop(context);
                  }
                : () {
                    tasks.updateTask(docID, textEditingController.text);
                    Navigator.pop(context);
                  },
            child: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }

  void onDelete(String docID) {
    tasks.deleteTask(docID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          openDialogBox();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 162, 227, 212),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan[200],
        title: const Text(
          'My Journal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 114, 208, 218),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text('Profile'),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage(),)),
                    )),
              )),
               SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 114, 208, 218),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text('Calendar'),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyCalendar(),)),
                    )),
              )),
               SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 114, 208, 218),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text('Tasks'),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyTask(),)),
                    )),
              )),
          Expanded(
            child: StreamBuilder(
              stream: tasks.getTasks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List tasksList = snapshot.data.docs;
                  return ListView.builder(
                      itemCount: tasksList.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = tasksList[index];
                        return ToDoListTile(
                          data: doc['task'],
                          onPressed: () => openDialogBox(docID: doc.id),
                          onDelete: () => onDelete(doc.id),
                          page: null,
                        );
                      });
                } else {
                  return Center(
                      child: SpinKitFadingFour(color: Colors.black, size: 55));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
