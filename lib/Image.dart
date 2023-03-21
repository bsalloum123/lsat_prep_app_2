import 'package:flutter/material.dart';
class Image extends StatelessWidget{
  final String _assetPath; // the underscore means that the variable is private
  Image(this._assetPath) // the user will have to pass the asset path if they want to use this widegt
  @override
  Widget build(BuildContext context){
    return Container(
        constraints: BoxConstraints.expand(
          height: 100.0, // expand all the content until the height is 100
        ) //let's provide constraints of a container widget
        decoration: BoxDecoration(color: colors.white),
        child: Image.asset(
        _assetPath,
        fit: BoxFit.cover, // fills the image as much it can in the container
        )// Image widget that goes with a constructor
    ); //Container
  }
}
