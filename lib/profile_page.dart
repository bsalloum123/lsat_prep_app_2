import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'colorSchemes.dart';
import 'currentUser.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.currentUser});
  final CurrentUser currentUser;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker picker = ImagePicker();
  var profileImage = 'assets/images/profile.png';
  @override
  Widget build(BuildContext context) {
    return ListView(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                  ),
                  child: Expanded( 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              minRadius: 60.0,
                              maxRadius: 60.0,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage:
                                AssetImage(profileImage),
                                child: IconButton(
                                  icon: Icon(Icons.add_a_photo),
                                  color: lsatTheme.primaryColor,
                                  hoverColor: Colors.white,
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.fromLTRB(75, 75, 0, 0),
                                  iconSize: 40,
                                  onPressed: () async {
                                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      setState(() {
                                        profileImage = image.path;
                                      });
                                    }// uploading a profile picture from gallery
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.currentUser.firstName + ' ' + widget.currentUser.lastName,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(widget.currentUser.username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
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
                        'temp1',
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
                    Divider(),
                    ListTile(
                      title: Text(
                        'temp2',
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
            ],
          );
  }
}