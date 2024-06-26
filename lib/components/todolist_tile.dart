import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/components/mytasks.dart';
import 'package:todolist/components/mycalendar.dart';
import 'package:todolist/components/myprofilepage.dart';
import 'package:todolist/components/mytasks.dart';
import 'package:todolist/components/mytabbedpage.dart';

class ToDoListTile extends StatelessWidget {
  final Function() onPressed;
  final String data;
  final Function() onDelete;
  final Widget page;
  const ToDoListTile({super.key,
     required this.data,
     required this.onPressed,
     required this.onDelete,
     required this.page,
     });
     

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25 ),
      child: Container(
        padding:EdgeInsets.all(25),
        decoration: BoxDecoration (
          color: Color.fromARGB(255, 114, 208, 218),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(child: Text(data), onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => page)
              );
            },),
            IconButton(
              icon: const Icon(Icons.create),
              onPressed: () {

              },
            )
      ]),
    ));
  }
}