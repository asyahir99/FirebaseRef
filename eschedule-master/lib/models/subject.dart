import 'package:mp_final_project/models/timetable.dart';

class subject {
  final int seksyen;
  final String nama_subjek;
  final String sesi;
  final int tahun_kursus;
  final String kod_kursus;
  final String kod_subjek;
  final String status;
  final int semester;
  List<Timetable> table = [];

  subject(
      {this.seksyen,
      this.nama_subjek,
      this.sesi,
      this.tahun_kursus,
      this.kod_subjek,
      this.kod_kursus,
      this.semester,
      this.status});

  factory subject.fromJson(Map<String, dynamic> data) {
    return subject(
        seksyen: data['seksyen'],
        nama_subjek: data['nama_subjek'],
        sesi: data['sesi'],
        tahun_kursus: data['tahun_kursus'],
        kod_subjek: data['kod_subjek'],
        kod_kursus: data['kod_kursus'],
        semester: data['semester'],
        status: data['status']);
  }

  void addTimetable(List<Timetable> t) {
    table = t;
  }
}
