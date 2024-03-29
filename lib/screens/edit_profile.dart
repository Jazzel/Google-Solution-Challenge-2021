import 'package:bizzhome/models/Auth.dart';
import 'package:bizzhome/models/User.dart';
import 'package:bizzhome/net/firebase.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final user = Auth.returnUserDetails();
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController bioController = new TextEditingController();
  TextEditingController skillsController = new TextEditingController();
  TextEditingController eduController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = user.displayName;
    bioController.text = user.bio;
    skillsController.text = user.skills_background;
    eduController.text = user.educational_background;
    dobController.text = user.date_of_birth;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        user.avatar,
                      ),
                    ),
                    maxRadius: 50,
                  ),
                  Text(""),
                  Center(
                    child: Text(
                      user.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person, color: Colors.black),
                        hintText:
                            'Name ( It will be displayed to other users )',
                        // labelText: 'Name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      controller: bioController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email, color: Colors.black),
                        hintText: 'Bio ( little information about you ) ',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextField(
                      controller: skillsController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.work, color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText:
                            'Skills ( Brief information of what you can do ) ',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextField(
                      controller: eduController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(
                        icon: Icon(Icons.book, color: Colors.black),
                        labelText:
                            'Education ( Brief information of your educational background ) ',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      controller: dobController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today,
                            color: Colors.black),
                        hintText: 'Date of birth ',
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Date of birth',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Color(0xFFEB5757),
                        splashColor: Colors.white.withOpacity(0.5),
                        onPressed: () => Auth.updateUserProfile(User(
                          avatar: "dsad",
                          bio: bioController.text,
                          date_of_birth: dobController.text,
                          displayName: nameController.text,
                          educational_background: eduController.text,
                          registered_date: "Dsadas",
                          skills_background: skillsController.text,
                        )),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.edit),
                                Text(" Edit profile"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
