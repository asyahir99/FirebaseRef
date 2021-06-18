import 'package:flutter/material.dart';
import 'package:mp_final_project/Services/UsersSubject.dart';
import 'package:mp_final_project/Services/date.dart';
import 'package:mp_final_project/models/Users.dart';
import 'package:mp_final_project/models/subject.dart';
import 'package:mp_final_project/screens/timetable/component/table_list.dart';
import 'package:mp_final_project/screens/timetable/component/tablelistcart.dart';
import 'package:mp_final_project/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropdownValue = 'Current';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PageTitle(),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'Current',
                'Sunday',
                'Monday',
                'Tuesday',
                "Wednesday",
                "Thursday"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        Expanded(
          child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: FutureBuilder<List<subject>>(
                  future: StudentSubject(uid: user.uid).getSubject(),
                  builder: (context, AsyncSnapshot<List<subject>> snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      if (snapshot.hasData) {
                        List<subject> sub = [];
                        sub = snapshot.data;
                        List<TableList> tableList =
                            addTable(sub, dropdownValue);
                        return GridView.builder(
                          itemCount: tableList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                SizeConfig.orientation == Orientation.landscape
                                    ? 2
                                    : 1,
                            mainAxisSpacing: 20,
                            crossAxisSpacing:
                                SizeConfig.orientation == Orientation.landscape
                                    ? SizeConfig.defaultSize * 2
                                    : 0,
                            childAspectRatio: 2.5,
                          ),
                          itemBuilder: (context, index) => TableListCard(
                            tableLists: tableList[index],
                          ),
                        );
                      } else {
                        return Text("No Data");
                      }
                    }
                  })),
        ),
      ],
    );
  }
}

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
      child: Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                Date().getDate(),
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize * 3,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Date().getDay(),
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize * 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
