import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({ Key? key, required this.time}) : super(key: key);


  final time;

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  var seconds = 0;
  var maxseconds = 0;
  var isStarted = false;

  void setTime(){
    seconds = widget.time;
    maxseconds = widget.time;
  }

  Timer? timer;

  void StartTimerSeconds(){
    timer = Timer.periodic(Duration(seconds: 1), (_){
      if (seconds > 0){
        setState((){
          --seconds;
          isStarted = true;
        });
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer(){
    timer?.cancel();
    setState(() {
      isStarted = false;
    });
  }

  void reset(){
    setState(() {
      seconds = widget.time;
      stopTimer();
    });
  }

  @override
  void initState() {
    setTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children:[
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black87,
                      valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
                      strokeWidth: 12,
                      value: seconds/maxseconds,
                    )) ,
                  Center(
                  child: Text(
                  '${seconds}',
                        style: TextStyle(fontSize: 60),
                        ),
                ),]
              ),
            ),
          SizedBox(height: 50,
          ),
         isStarted?
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             ElevatedButton(onPressed: stopTimer, child: Text('Pause')),
             ElevatedButton(onPressed: reset, child: Text('Reset'),
             )
           ],
         ):
          ElevatedButton(onPressed: StartTimerSeconds, child: Text('Start')),
          ],)),
      
    );
  }
}