import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daniel & Aqila'),
        ),
        body: Center(
          child: Text('Daniel & Aqila', style: TextStyle(fontSize: 18.0)),
        ));
  }
}
