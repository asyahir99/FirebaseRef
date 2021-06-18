import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mp_final_project/Services/UsersSubject.dart';
import 'package:mp_final_project/Services/database.dart';
import 'package:mp_final_project/models/Users.dart';
import 'package:mp_final_project/models/subject.dart';

import 'package:mp_final_project/size_config.dart';
import 'package:provider/provider.dart';

import '../../Studprofile/components/info.dart';
import '../../Studprofile/components/profile_menu_item.dart';
import '../../Studprofile/components/subject_registred.dart';

class Bodyprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    final user = Provider.of<Users>(context);
    String username;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder<DocumentSnapshot>(
              future: DatabaseServices(uid: user.uid).getUserData(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  //print('project snapshot data is: ${snap.data}');
                  return Text("loading");
                } else {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      UserData user = UserData.fromDatabase(data.data);
                      String description = user.description;
                      username = user.name;
                      return Info(
                        image: "assets/images/profile_pic.png",
                        name: username,
                        title: description,
                      );
                    } else {
                      return Text("No Data");
                    }
                  }
                }
              }),
          SizedBox(height: defaultSize * 2),
          SubjectRegistred(),
          SizedBox(height: defaultSize * 3),
          FutureBuilder<List<subject>>(
              future: StudentSubject(uid: user.uid).getSubject(),
              builder: (context, AsyncSnapshot<List<subject>> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  if (snapshot.hasData) {
                    List<subject> sub = [];
                    sub = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: sub.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProfileMenuItem(
                          title: sub[index].nama_subjek,
                        );
                      },
                    );
                  } else {
                    return Text("No Data");
                  }
                }
              }),
        ],
      ),
    );
  }
}
