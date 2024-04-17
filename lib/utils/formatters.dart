import 'package:intl/intl.dart';

sealed class Formatters {
  static String formatCurrency(double? amount) {
    return NumberFormat.simpleCurrency(locale: 'en_IN').format(amount);
  }

  static String compactDateNormal(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  static String dateWithYearMonth(DateTime date) {
    return DateFormat.yMMMM().format(date);
  }

  static String compactTimeNormal(DateTime date) {
    return DateFormat.jm().format(date);
  }
}
