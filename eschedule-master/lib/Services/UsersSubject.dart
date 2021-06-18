import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mp_final_project/Services/SesiSemester.dart';
import 'package:mp_final_project/Services/database.dart';
import 'package:mp_final_project/models/semester.dart';
import 'package:mp_final_project/models/subject.dart';
import "dart:async";

import 'package:mp_final_project/models/timetable.dart';

class StudentSubject {
  final String uid;
  StudentSubject({this.uid});

  Future<List<subject>> getSubject() async {
    String matricNumber = await DatabaseServices(uid: uid).getUsername();
    String category = await DatabaseServices(uid: uid).getCategory();
    Semester sem = await SesiSemester().getSemester();
    String url;
    if (category == "student") {
      url =
          "http://web.fc.utm.my/ttms/web_man_webservice_json.cgi?entity=pelajar_subjek&no_matrik=";
    } else {
      url =
          "http://web.fc.utm.my/ttms/web_man_webservice_json.cgi?entity=pensyarah_subjek&no_pekerja=";
    }
    List<subject> sub = [];
    var response = await http.get(Uri.encodeFull(url + matricNumber),
        headers: {"Accept": "application/json"});
    final data = jsonDecode(response.body);
    for (Map i in data) {
      sub.add(subject.fromJson(i));
    }
    sub.removeWhere((item) => item.sesi != sem.sesi);
    for (int i = 0; i < sub.length; i++) {
      sub[i].addTimetable(
          await getTimetable(sub[i].sesi, sub[i].kod_subjek, sub[i].seksyen));
    }
    return sub;
  }

  Future<List<Timetable>> getTimetable(
      String sesi, String kod, int section) async {
    List<Timetable> table = [];
    final String url =
        "http://web.fc.utm.my/ttms/web_man_webservice_json.cgi?entity=jadual_subjek&sesi=";
    String semester = "&semester=2&kod_subjek=";
    String seksyen = "&seksyen=";
    var response = await http.get(
        Uri.encodeFull(
            url + sesi + semester + kod + seksyen + section.toString()),
        headers: {"Accept": "application/json"});
    final data = jsonDecode(response.body);
    for (Map i in data) {
      table.add(Timetable.fromJson(i));
    }
    return table;
  }
}
