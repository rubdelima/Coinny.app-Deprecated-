export 'package:learn/utils/coinny_colors.dart';
export 'package:learn/utils/fonts.dart';
export 'package:learn/utils/lessions.dart';
export 'package:learn/utils/settings.dart';
export 'package:learn/classes.dart';
export 'package:learn/utils/acheiviementsList.dart';
export 'package:learn/utils/login_functions.dart';

int diffYears(DateTime birthDate) {
  DateTime now = DateTime.now();
  int years = now.year - birthDate.year;
  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    years--;
  }
  return years;
}

int diffDays(DateTime date) {
  DateTime now = DateTime.now();
  return now.difference(date).inDays;
}

