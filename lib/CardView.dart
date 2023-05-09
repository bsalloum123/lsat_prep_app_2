//Names: Batool, Christian, Inaya, Kevine
//Description: CardView --> This file builds a card for the FlashCard from the
// string from FlashQuiz, then returns that to FlashCard
// Class: CSI CUE 2023

import 'package:flutter/material.dart';

class CardView extends StatelessWidget{
  const CardView ({Key? key, required this.text}): super (key: key);
  // Stateless Widget when we are just sharing info

  // Text to be placed on card side
  final String text;

  // Builds card box and aligns text within
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