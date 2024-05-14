import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: _buildAppBar(),
       body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:50, bottom: 20,),
                      child: Text('All Tasks', 
                      style: TextStyle(
                        fontSize:30, 
                        fontWeight:FontWeight.w500, ) ,)
                      ,)
                  ],),
              )
            ],     
          ),
      )
    );
  }
}
Widget searchBox() {
  return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search,
                  color: Colors.black,
                  size: 20,
                  ),
                  prefixIconConstraints:BoxConstraints(
                    maxHeight: 20, 
                    minWidth: 25,
                     ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey
                    ),
                )
              ),
            );
}

AppBar _buildAppBar() {
  return AppBar(
     backgroundColor: Colors.grey,
        title: Row(
          children: [
            Icon(Icons.menu,
            color: Colors.black,
            size: 30,
            ),
            Container(
              height: 40,
              width: 40,
       )
      ]
     ),
   );
}
      
       