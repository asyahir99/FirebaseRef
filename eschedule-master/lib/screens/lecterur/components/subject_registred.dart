import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mp_final_project/size_config.dart';

class SubjectRegistred extends StatelessWidget {
  const SubjectRegistred({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Subject Registred',
          style: TextStyle(fontSize: defaultSize * 1.5),
        ),
        SizedBox(width: defaultSize * 2),
        SvgPicture.asset('assets/icon/subject.svg')
      ],
    );
  }
}