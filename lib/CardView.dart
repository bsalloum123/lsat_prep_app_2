import 'package:flutter/material.dart';
class CardView extends StatelessWidget{
  // Stateless Widget when we are just sharing info

  final String text;
  const CardView ({Key? key, required this.text}): super (key: key);



  @override
  Widget build (BuildContext context){
    return Card (
      elevation: 4,
      child: Center(
        child: Text(text, textAlign: TextAlign.center,),
      ),
    );
  }

}