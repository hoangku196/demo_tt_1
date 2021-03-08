import 'package:intl/intl.dart';

String formatPrice(dynamic price) {
  var formatCurrency =
      NumberFormat.simpleCurrency(locale: 'en_US', decimalDigits: 0);
  String format = formatCurrency.format(price);
  return format.substring(1, format.length) + '  đ';
}
