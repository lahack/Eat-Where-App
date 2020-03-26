import 'package:intl/intl.dart';

/*
  String-converters for dates
 */
class TimeUtils {
  static var _dayFormatter = DateFormat("EEEE, MMMM d");
  static var _minuteFormatter = DateFormat("h:mm a, MMM d");

  // Precision set to weekday
  static String dayFormat(DateTime date) => _dayFormatter.format(date);

  // Precision set to minute
  static String minuteFormat(DateTime date) => _minuteFormatter.format(date);
}