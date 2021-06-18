import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mp_final_project/Services/database.dart';
import 'package:mp_final_project/models/semester.dart';
import "dart:async";

class SesiSemester {
  Future<Semester> getSemester() async {
    final String url =
        "http://web.fc.utm.my/ttms/web_man_webservice_json.cgi?entity=sesisemester";
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    final data = jsonDecode(response.body);
    return Semester.fromJson(data[1]);
  }
}
