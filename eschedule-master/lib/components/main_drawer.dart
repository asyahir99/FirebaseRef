import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mp_final_project/Services/auth.dart';
import 'package:mp_final_project/Services/database.dart';
import 'package:mp_final_project/models/Users.dart';
import 'package:mp_final_project/screens/lecterur/profile_screen.dart';
import 'package:mp_final_project/screens/timetable/component/table_list.dart';
import 'package:provider/provider.dart';
import '../screens/class/class_screen.dart';
import '../screens/class/component/class_list.dart';
import '../screens/Studprofile/profile_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/timetable/table_screen.dart';

class MainDrawer extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20),
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF764BA2), Color(0xFF667EEA)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 100,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/whitelogo.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            size: 30,
          ),
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () async {
            DocumentSnapshot data =
                await DatabaseServices(uid: user.uid).getUserData();
            UserData users = UserData.fromDatabase(data.data);
            if (users.category == "student") {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileScreen();
              }));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LecterurScreen();
              }));
            }
          },
        ),
        ListTile(
          leading: Icon(
            Icons.calendar_today,
            size: 30,
          ),
          title: Text(
            'Schedule',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TableScreen();
            }));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.location_on_outlined,
            size: 30,
          ),
          title: Text(
            'Class venue',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ClassScreen();
            }));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () async {
            _auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SplashScreen();
            }));
          },
        ),
      ],
    ));
  }
}
