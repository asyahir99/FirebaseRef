import 'package:flutter/material.dart';
import 'package:mp_final_project/models/subject.dart';
import 'package:mp_final_project/models/timetable.dart';
import 'package:mp_final_project/size_config.dart';
import 'class_list.dart';

class ClassListCard extends StatelessWidget {
  final Function press;
  final String sub;
  final String space;
  final String day;
  final String venue;
  const ClassListCard(
      {Key key, this.sub, this.press, this.space, this.day, this.venue})
      : super(key: key);
  String display(String data) {
    String temp;
    if (data == null) {
      temp = "Not Acquired";
    } else {
      temp = data;
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE74C3C),
          borderRadius: BorderRadius.circular(defaultSize * 1.8),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      display(sub),
                      style: TextStyle(
                          fontSize: defaultSize * 1.5, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      display(space),
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      display(venue),
                      style: TextStyle(
                          fontSize: defaultSize * 2.5, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      display(day),
                      style: TextStyle(
                          fontSize: defaultSize * 2.5, color: Colors.white),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
