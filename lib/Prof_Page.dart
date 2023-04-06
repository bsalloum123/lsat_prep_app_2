import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'currentUser.dart';



class Prof_Page extends StatefulWidget{
  const Prof_Page({Key? key}) : super (key: key);

  @override
  _Prof_PageScreenState createState() => _Prof_PageScreenState();

}

class _Prof_PageScreenState extends State<Prof_Page>{
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xFFF3E5F5);
  String imageUrl = " ";

  void pickLoadImage() async {
    final image = await ImagePicker().pickImage(
        source:ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 75,

    );
    Reference ref = FirebaseStorage.instance.ref().child("profilephoto.jpg");
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value){
      print (value);
      setState(() {
        imageUrl = value;
      });
    });

    
  }

  @override
  Widget build(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                pickLoadImage();
              },
              child: Container(
                margin: EdgeInsets.only(top: 80),
                width: 120,
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: primary
                ),
              child: Center(
                child: imageUrl == " "? const Icon(
                  Icons.person,size: 80, color: Colors.white,
                ) : Image.network(imageUrl),
              ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:24),
              alignment: Alignment.center,
              child: Text(
                  widget.currentUser.firstName + ' ' + widget.currentUser.lastName, //
                  style: TextStyle(
                         fontSize: 35,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
              ),
            )

    ],
    ),
    ),
    );

  }

}
