import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timerapp/Screens/TimerScreen.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer'),
      ),  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('Type the Time', style: TextStyle(fontSize: 40,),
          textAlign: TextAlign.center,
          ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
             child: TextField(decoration: InputDecoration(hintText: 'Enter the Time'),
             onChanged: (text){
               value = text;
             },
             keyboardType: TextInputType.number,
             )),
             ElevatedButton(onPressed: (){
               Navigator.push(context,  MaterialPageRoute(builder: (context) => TimerScreen(time: int.parse(value))));
             }, child: Text('Start Timer!'))         
             ],
        ),
      ),
    );
  }
}