class Semester {
  String tarikh_mula;
  String sesi_semester_id;
  String sesi;
  int semester;
  String tarikh_tamat;

  Semester(
      {this.tarikh_mula,
      this.sesi_semester_id,
      this.sesi,
      this.semester,
      this.tarikh_tamat});

  factory Semester.fromJson(Map<String, dynamic> data) {
    return Semester(
        tarikh_mula: data["tarikh_mula"],
        sesi_semester_id: data["sesi_semester_id"],
        sesi: data["sesi"],
        semester: data["semester"],
        tarikh_tamat: data["tarikh_tamat"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'tarikh_mula': tarikh_mula,
      'sesi_semester_id': sesi_semester_id,
      'sesi': sesi,
      'semester': semester,
      'tarikh_tamat': tarikh_tamat
    };
  }
}
