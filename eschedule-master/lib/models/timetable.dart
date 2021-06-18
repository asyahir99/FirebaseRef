class Timetable {
  int hari;
  int masa;
  ruang tempat;
  Timetable({this.hari, this.masa, this.tempat});

  factory Timetable.fromJson(Map<String, dynamic> data) {
    return Timetable(
        hari: data['hari'],
        masa: data['masa'],
        tempat: ruang.fromJson(data['ruang']));
  }

  Map<String, dynamic> toJson() {
    return {'hari': hari, 'masa': masa};
  }

  String getDay() {
    String day;
    switch (hari) {
      case 1:
        {
          day = "Sunday";
          break;
        }
      case 2:
        {
          day = "Monday";
          break;
        }
      case 3:
        {
          day = "Tuesday";
          break;
        }
      case 4:
        {
          day = "Wednesday";
          break;
        }
      case 5:
        {
          day = "Thursday";
          break;
        }
      default:
        {
          day = "Not today";
          break;
        }
    }
    return day;
  }

  String changeTime() {
    String t;
    switch (masa) {
      case 1:
        {
          t = "7.00 AM - 7.50 AM";
          break;
        }
      case 2:
        {
          t = "8.00 AM - 8.50 AM";
          break;
        }
      case 3:
        {
          t = "9.00 AM - 9.50 AM";
          break;
        }
      case 4:
        {
          t = "10.00 AM - 10.50 AM";
          break;
        }
      case 5:
        {
          t = "11.00 AM - 11.50 AM";
          break;
        }
      case 6:
        {
          t = "12.00 PM - 12.50 PM";
          break;
        }
      case 7:
        {
          t = "1.00 PM - 1.50 PM";
          break;
        }
      case 8:
        {
          t = "2.00 PM - 2.50 PM";
          break;
        }
      case 9:
        {
          t = "3.00 PM - 3.50 PM";
          break;
        }
      case 10:
        {
          t = "4.00 PM - 4.50 PM";
          break;
        }
      case 11:
        {
          t = "5.00 PM - 5.50 PM";
          break;
        }
      default:
        {
          t = "Exceed time limit";
          break;
        }
    }
    return t;
  }
}

class ruang {
  String nama_ruang;
  String nama_ruang_singkatan;
  String kod_ruang;

  ruang({this.nama_ruang, this.nama_ruang_singkatan, this.kod_ruang});

  factory ruang.fromJson(Map<String, dynamic> data) {
    return ruang(
        nama_ruang: data['nama_ruang'],
        nama_ruang_singkatan: data['nama_ruang_singkatan'],
        kod_ruang: data['kod_ruang']);
  }
}
