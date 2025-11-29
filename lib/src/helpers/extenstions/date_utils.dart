import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  String formatDdMMMMy([
    String locale = 'ar',
    //was GlobalVariables.languagePref
  ]) =>
      "$day ${DateFormat("MMMM,", locale).format(this)} $year";
}
