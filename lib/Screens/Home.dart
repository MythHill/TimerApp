import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timerapp/Screens/TimerScreen.dart';

enum Choices { Seconds, Minutes, Hours}


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var value;
  Choices? _choices = Choices.Seconds;
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
             Column(
               children: [
                 ListTile(
                   title: Text('Seconds'),
                   leading: Radio<Choices>(groupValue: _choices,
                   value: Choices.Seconds,
                   onChanged: (value){
                     setState(() {
                       _choices = value;
                     });
                   },)
                 ),
                  ListTile(
                   title: Text('Minutes'),
                   leading: Radio<Choices>(groupValue: _choices,
                   value: Choices.Minutes,
                   onChanged: (value){
                     setState(() {
                       _choices = value;
                     });
                   },)
                 ),
                  ListTile(
                   title: Text('Hours'),
                   leading: Radio<Choices>(groupValue: _choices,
                   value: Choices.Hours,
                   onChanged: (value){
                     setState(() {
                       _choices = value;
                     });
                   },)
                 )
               ],
             ),
             ElevatedButton(onPressed: (){
               Navigator.push(context,  MaterialPageRoute(builder: (context) => TimerScreen(time: int.parse(value),
               timeFormat: _choices,
               )));
             }, child: Text('Start Timer!'))         
             ],
        ),
      ),
    );
  }
}