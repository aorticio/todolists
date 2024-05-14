import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: const Text('Profile'
            ),
          ),
        ),
        body: ListView(
            children: <Widget> [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.deepOrange.shade300],
                    begin: Alignment.centerLeft,
                    end:Alignment.centerRight,
                    stops: [0.5, 0.9],
                     ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.red.shade300,
                          minRadius: 35.0,
                          child: Icon(
                            Icons.call,
                            size: 30.0,
                            ),
                       ),
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 50.0,
                          ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        minRadius: 35.0,
                        child: Icon(Icons.message),
                      )
                    ],
                  ),
                Text(
                  'AC Orticio',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                  ),
                  Text(
                    'Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )
                  )
                ],
              ),
           )

          ]
        ),
      )
    );
  }
}