import 'package:flutter/material.dart';

class MyTasks extends StatelessWidget {
  String data;
  dynamic Function() onPressed;
  dynamic Function() onDelete;

  MyTasks({
    Key? key,
    required this.data,
    required this.onPressed,
    required this.onDelete,
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
            Icon(Icons.edit),
                  IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                  Icons.delete,)
            ),
          ]
        )
    ));
  }          
}