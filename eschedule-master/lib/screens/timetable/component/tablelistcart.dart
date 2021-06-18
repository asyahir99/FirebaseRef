import 'package:flutter/material.dart';
import 'package:mp_final_project/screens/class/component/class_list.dart';
import 'package:mp_final_project/screens/timetable/component/table_list.dart';
import 'package:mp_final_project/size_config.dart';

class TableListCard extends StatelessWidget {
  final TableList tableLists;

  const TableListCard({Key key, this.tableLists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AspectRatio(
      aspectRatio: 3.1,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE1BEE7),
          border: Border(
            top: BorderSide(width: 4.5, color: Color(0xFF9C27B0)),
            left: BorderSide(width: 4.5, color: Color(0xFF9C27B0)),
            right: BorderSide(width: 4.5, color: Color(0xFF9C27B0)),
            bottom: BorderSide(width: 4.5, color: Color(0xFF9C27B0)),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tableLists.subject,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      tableLists.time,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: defaultSize * 2),
                      child: Row(
                        children: <Widget>[
                          Text(
                            tableLists.lab,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: defaultSize * 1,
                                color: Colors.white,
                                background: Paint()
                                  ..strokeWidth = 15.0
                                  ..color = Color(0xFFE040FB)
                                  ..style = PaintingStyle.stroke
                                  ..strokeJoin = StrokeJoin.round),
                          ),
                          SizedBox(width: defaultSize * 2),
                          Text(
                            tableLists.classSubject,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: defaultSize * 1,
                                color: Colors.white,
                                background: Paint()
                                  ..strokeWidth = 15.0
                                  ..color = Color(0xFFE040FB)
                                  ..style = PaintingStyle.stroke
                                  ..strokeJoin = StrokeJoin.round),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
