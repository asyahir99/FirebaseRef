import 'package:mp_final_project/Services/date.dart';
import 'package:mp_final_project/models/subject.dart';
import 'package:mp_final_project/models/timetable.dart';

class TableList {
  final String subject, lab, classSubject, day, time;
  int h;
  TableList(
      {this.subject, this.time, this.lab, this.classSubject, this.day, this.h});
}

List<TableList> addTable(List<subject> sub, String hari) {
  List<TableList> temp = [];
  List<TableList> tableList = [];
  for (int i = 0; i < sub.length; i++) {
    for (int j = 0; j < sub[i].table.length; j++) {
      Timetable day = sub[i].table[j];
      if (hari == "Current") {
        if (day.getDay() == Date().getDay()) {
          temp.add(new TableList(
              subject: sub[i].nama_subjek,
              time: sub[i].table[j].changeTime(),
              lab: "lab",
              day: day.getDay(),
              classSubject: "class",
              h: sub[i].table[j].masa));
        }
      } else {
        if (day.getDay() == hari) {
          temp.add(new TableList(
              subject: sub[i].nama_subjek,
              time: sub[i].table[j].changeTime(),
              lab: "lab",
              day: day.getDay(),
              classSubject: "class",
              h: sub[i].table[j].masa));
        }
      }
    }
    bubbleSort(temp);
  }
  return temp;
}

void bubbleSort(List<TableList> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j].h > arr[j + 1].h) {
        // swap arr[j+1] and arr[j]
        TableList temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}
