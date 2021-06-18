import 'package:flutter/material.dart';

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF764BA2), Color(0xFF667EEA)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
    ),
  );
}

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double _prefferedHeight = 100.0;

//   String title;
//   Color gradientBegin, gradientEnd;

//   CustomAppBar({this.title, this.gradientBegin, this.gradientEnd})
//       : assert(title != null),
//         assert(gradientBegin != null),
//         assert(gradientEnd != null);

// @override
// Widget build(BuildContext context) {
//   return Container(
//     height: _prefferedHeight,
//     alignment: Alignment.center,
//     padding: EdgeInsets.only(top: 30.0),
//     decoration: BoxDecoration(
//       gradient: LinearGradient(colors: <Color>[gradientBegin, gradientEnd]),
//     ),
//     child: Row()
//   );
// }

//   @override
//   Size get preferredSize => Size.fromHeight(_prefferedHeight);
// }
