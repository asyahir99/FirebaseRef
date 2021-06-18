import 'package:flutter/material.dart';
import 'package:mp_final_project/components/main_drawer.dart';
import 'package:mp_final_project/constant.dart';
import 'package:mp_final_project/screens/lecterur/components/body.dart';

import 'package:mp_final_project/size_config.dart';

class LecterurScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: _getCustomAppBar(),
      body: Body(),
    );
  }
}

_getCustomAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      title: Text(
        'Dashboard',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipPath(
        // clipper: MyCustomClipperForAppBar(),
        child: Container(
          color: kPrimaryColor,
        ),
      ),
    ),
  );
}
