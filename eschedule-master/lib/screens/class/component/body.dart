import 'package:flutter/material.dart';
import 'package:mp_final_project/Services/UsersSubject.dart';
import 'package:mp_final_project/models/Users.dart';
import 'package:mp_final_project/models/subject.dart';
import 'package:mp_final_project/screens/class/component/classListCard.dart';
import 'package:mp_final_project/screens/class/component/class_list.dart';
import 'package:mp_final_project/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          PageTitle(),
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
                        List<ClassList> tableList = addClass(
                          sub,
                        );
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
                            childAspectRatio: 2,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ClassListCard(
                              sub: tableList[index].subject,
                              space: tableList[index].room,
                              day: tableList[index].day,
                              venue: tableList[index].venue,
                              press: () {},
                            );
                          },
                        );
                      } else {
                        return Text("No Data");
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Class',
          style: TextStyle(
            fontSize: SizeConfig.defaultSize * 3,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
