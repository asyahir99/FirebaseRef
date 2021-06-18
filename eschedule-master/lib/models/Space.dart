class Space {
  String kod_subjek;
  SpaceInfo ruang;
  int id_jws;
  int masa;

  Space({this.kod_subjek, this.ruang, this.id_jws, this.masa});

  factory Space.fromJson(Map<String, dynamic> data) {
    return Space(
        kod_subjek: data['kod_subjek'],
        ruang: SpaceInfo.fromJson(data['ruang']),
        id_jws: data['id_jws'],
        masa: data['masa']);
  }
}

class SpaceInfo {
  String kod_ruang;
  String nama_ruang;
  String nama_ruang_singkatan;

  SpaceInfo({this.kod_ruang, this.nama_ruang, this.nama_ruang_singkatan});

  factory SpaceInfo.fromJson(Map<String, dynamic> data) {
    return SpaceInfo(
        kod_ruang: data['kod_ruang'],
        nama_ruang: data['nama_ruang'],
        nama_ruang_singkatan: data['nama']);
  }

  Map<String, dynamic> toJson() {
    return {
      'kod_ruang': kod_ruang,
      'nama_ruang': nama_ruang,
      'nama_ruang_singkatan': nama_ruang_singkatan
    };
  }
}
