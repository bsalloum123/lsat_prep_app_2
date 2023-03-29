import 'package:flutter/material.dart';

class Text extends StatelessWidget{
  final String title;
  final String _body;
  static const double _hPad = 20.0;

  const Text(this.title, this._body, {super.key}); // constructor
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:[
       Container(
         padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
         child: Text(title),
             //style: Theme.of(context).textTheme.title),
       ),
       Container(
         padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, 4.0),
         child: Text(_body),
            // style: Theme.of(context).textTheme.title),
       ),
      ]);
  }

}
