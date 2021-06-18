import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mp_final_project/Services/auth.dart';
import 'package:mp_final_project/models/Users.dart';
import 'package:mp_final_project/screens/Log_in/login_screen.dart';
import 'package:mp_final_project/screens/lecterur/profile_screen.dart';
import 'package:mp_final_project/screens/Studprofile/profile_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final AuthServices _auth = AuthServices();
    final user = Provider.of<Users>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return LoginScreen();
    } else {
      return StreamBuilder(
          stream: Firestore.instance
              .collection('Users')
              .document(user.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final userdoc = snapshot.data;
              final users = userdoc.data;
              if (users['category'] == 'student') {
                return ProfileScreen();
              } else {
                return LecterurScreen();
              }
            } else {
              return Material(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                  ),
                ),
              );
            }
          });
    }
  }
}
