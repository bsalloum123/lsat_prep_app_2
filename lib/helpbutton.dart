import 'package:flutter/material.dart';
class helpbutton extends StatelessWidget{
  const helpbutton({Key? Key}): super(key: Key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Help'),
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
            fixedSize: Size(80, 80),
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              primary: Colors.green,
              onPrimary: Colors.black,
              elevation: 15,
              shadowColor: Colors.greenAccent,
              side: BorderSide(color: Colors.black, width:2)
              alignment: Alignment.bottomRight,
              shape:StadiumBorder()
            ),

          ),
        ),
      ),
    );
  }
}
