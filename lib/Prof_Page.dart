//Names: Batool, Christian, Inaya, Kevine
//Description: Prof_Page --> File creates the profile page of the user. User can
// change their photo and see relevant information about their profile and exam.
// Class: CSI CUE 2023

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'currentUser.dart';
import 'package:intl/intl.dart';



class Prof_Page extends StatefulWidget{
  const Prof_Page({super.key, required this.currentUser});
  final CurrentUser currentUser;

  @override
  _Prof_PageScreenState createState() => _Prof_PageScreenState();

}

class _Prof_PageScreenState extends State<Prof_Page>{
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xFFF3E5F5);
  String imageUrl = "";

  void pickLoadImage() async {
    final image = await ImagePicker().pickImage(
      source:ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
      imageQuality: 75,

    );
    Reference ref = FirebaseStorage.instance.ref().child("ProfilePhotos/${widget.currentUser.id}");
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value){
      print (value);
      setState(() {
        imageUrl = value;
      });
    });

    //widget.currentUser.profilePhoto = imageUrl;
    //update the user's profilephoto in the database to store the imageUrl
    await FirebaseFirestore.instance.collection('users').doc(widget.currentUser.id).update({'profilePhoto': imageUrl});
    print("imageUrl: $imageUrl");


  }

  @override
  Widget build(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    Reference ref = FirebaseStorage.instance.ref().child("ProfilePhotos/${widget.currentUser.id}");
    print("${widget.currentUser.profilePhoto}");
    String countTime;
    

    var imageFile;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                pickLoadImage();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 80),
                width: 120,
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: primary
                ),
                child: Center(
                  child: ListTile(
                    subtitle:
                    FutureBuilder(
                      future: ref.getDownloadURL(),
                      builder: (BuildContext context, AsyncSnapshot<String> url){
                        if(url.hasData){
                          return Image.network(url.data!);
                        }
                        else{
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    /*Image(
                      image: ImageProvider
                        //Image.network(imageUrl == "" ? widget.currentUser.profilePhoto : imageUrl).image,
                      //NetworkImage(widget.currentUser.profilePhoto), // ----------- the line that should change
                      width: 300,
                      height: 300,

                    ),
                     */
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top:24),
              alignment: Alignment.center,
              child: Text(
                '${widget.currentUser.firstName} ${widget.currentUser.lastName}', //
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.green[400],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      widget.currentUser.email,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                        ListTile(
                          title: Text(
                            "LSAT Date",
                            style: TextStyle(
                              color: Colors.green[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            widget.currentUser.testDateYear.toString() + "-" + widget.currentUser.testDateMonth.toString() + "-" + widget.currentUser.testDateDay.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Countdown",
                            style: TextStyle(
                              color: Colors.green[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            //DateFormat('dd').format(DateTime.now().difference(widget.currentUser.testDate as DateTime).inDays as DateTime) +
                            countTime = CountDown().timeLeft(DateTime(widget.currentUser.testDateYear, widget.currentUser.testDateMonth, widget.currentUser.testDateDay), "LSAT is here Good Luck!","0", "0", "0", "0", "0","0", "0", "0"),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(),
                  ListTile(
                    title: Text(
                      'Hours Spent Studying',
                      style: TextStyle(
                        color: Colors.green[400],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '...',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
    );

  }

}