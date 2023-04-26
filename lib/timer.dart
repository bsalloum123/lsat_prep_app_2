import 'dart:async';

import'package:flutter/material.dart';

class _timer extends StatefulWidget{
  const _timer({required Key key}) : super (key: key);

  @override
  _timerState createState() => _timerState();

}
class _timerState extends State<_timer>{
  int _counter = 60;
  late Timer _timer;

  void startTimer(){
    _counter = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_counter > 0){
        setState(() {
          _counter--;
        });
      }else{
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('_counter', style:TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed:(){
              startTimer();
            }, child: Text('Start Timer')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:(){
              //startTimer();
              _timer.cancel();
            }, child: Text('Pause')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:(){
              setState(() {
                _timer.cancel();
                _counter = 15;
              });
            }, child: Text('Reset')),

          ],
          //],


        )
      ),

    );

  }
}

