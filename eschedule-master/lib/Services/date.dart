import 'package:intl/intl.dart';

class Date {
  String getDate() {
    return new DateFormat.yMMMMd().format(new DateTime.now().toUtc());
  }

  String getDay() {
    return new DateFormat.EEEE().format(new DateTime.now().toUtc());
  }
}
