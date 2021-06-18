import 'package:flutter/material.dart';
import 'package:mp_final_project/models/Users.dart';
import 'package:mp_final_project/screens/Wrapper.dart';
import 'package:mp_final_project/Services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthServices().user,
      child: MaterialApp(home: Wrapper()),
    );
  }
}
