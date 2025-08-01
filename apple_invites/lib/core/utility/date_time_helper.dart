import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime getCurrentDateTime() {
    return DateTime.now();
  }

  //Format date and time
  static String formateDateTime(
    DateTime dateTime, {
    String format = 'yyyy-MM-dd HH:mm:ss',
  }) {
    return DateFormat(format).format(dateTime);
  }

  //get only date (default yyyy-MM-dd)
  static String getFormattedDate(
    DateTime dateTime, {
    String format = 'yyyy-MM-dd',
  }) {
    return DateFormat(format).format(dateTime);
  }

  //Get only time (default HH:mm:ss)
  static String getFormattedTime(
    DateTime dateTime, {
    String format = 'HH:mm:ss',
  }) {
    return DateFormat(format).format(dateTime);
  }
}
