import 'package:intl/intl.dart';

class DateFormatter {
  String simpleFormat(DateTime date) => DateFormat('dd/MM/yyyy').format(date);
}
