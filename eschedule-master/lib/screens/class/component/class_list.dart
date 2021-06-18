import 'package:flutter/material.dart';
import 'package:mp_final_project/models/subject.dart';

class ClassList {
  final String subject, venue, room, day;

  ClassList({
    this.subject,
    this.venue,
    this.room,
    this.day,
  });
}

List<ClassList> addClass(List<subject> sub) {
  List<ClassList> temp = [];
  for (int i = 0; i < sub.length; i++) {
    for (int j = 0; j < sub[i].table.length; j++) {
      temp.add(new ClassList(
          subject: sub[i].nama_subjek,
          venue: sub[i].table[j].tempat.kod_ruang,
          room: sub[i].table[j].tempat.nama_ruang,
          day: sub[i].table[j].getDay()));
    }
  }
  return temp;
}
