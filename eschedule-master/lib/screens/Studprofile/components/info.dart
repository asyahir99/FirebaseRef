import 'package:flutter/material.dart';
import 'package:mp_final_project/constant.dart';
import 'package:mp_final_project/size_config.dart';

class Info extends StatelessWidget {
  const Info({
    Key key,
    this.name,
    this.title,
    this.image,
  }) : super(key: key);
  final String name, title, image;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SizedBox(
      height: defaultSize * 20,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 15,
              color: kPrimaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: defaultSize * 14,
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white, width: defaultSize * 0.8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: defaultSize * 2.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: defaultSize / 2),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: defaultSize * 1.5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
