import 'package:bizzhome/app.dart';
import 'package:bizzhome/models/Auth.dart';
import 'package:bizzhome/utils/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final user = Auth.returnUserDetails();
  String name = "";

  _getdetails() async {
    final user2 = await Auth.getUserDetails();
    setState(() {
      name = user2["username"];
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getdetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.black,
              child: ListTile(
                onTap: () {
                  //open edit profile
                  signOut();
                },
                title: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 8.0,
              margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      color: Colors.red,
                    ),
                    title: Text("Edit Profile"),
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileRoute);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.language,
                      color: Colors.red,
                    ),
                    title: Text("Change Language"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open change language
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    title: Text("Switch Account"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
