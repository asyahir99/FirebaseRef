import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mp_final_project/size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 0.2),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                'assets/icon/calendar.svg',
                height: defaultSize * 4,
              ),
              SizedBox(width: defaultSize * 2),
              Container(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                'assets/icon/right-arrow.svg',
                height: defaultSize * 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
