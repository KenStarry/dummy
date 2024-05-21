import 'package:intl/intl.dart';

extension StringExtensions on String {
  ///  add +254 prefix
  String addCountryCodePrefix({required String countryCode}) {
    if (startsWith('1') || startsWith('7')) {
      return '$countryCode$this';
    } else if (startsWith('0')) {
      return '$countryCode${substring(1)}';
    } else if (startsWith(countryCode.substring(1)) && this[3] == '0') {
      return '+${replaceFirst(RegExp('0'), '')}';
    } else if (startsWith(countryCode.substring(1)) && this[3] != '0') {
      return '+$this';
    } else if (startsWith(countryCode) && this[4] != '0') {
      return this;
    } else if (startsWith(countryCode) && this[4] == '0') {
      return replaceFirst(RegExp('0'), '');
    } else {
      return '';
    }
  }

  String get getCurrentTime {
    final date = DateTime.parse(this);

    final formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  String get getCurrentHourIn24 {
    final date = DateTime.parse(this);

    final formatter = DateFormat('HH');
    return formatter.format(date);
  }

  String get getCurrentMinutes {
    final date = DateTime.parse(this);

    final formatter = DateFormat('mm');
    return formatter.format(date);
  }

  get parseToHours {
    int hr = (int.parse(this) / 3600).floor();
    String hour = hr.toString().length <= 1 ? "0$hr" : "$hr";
    return hour;
  }

  get parseToMinutes {
    int min = (int.parse(this) / 60).floor() % 60;
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    return minute;
  }

  get parseToSeconds {
    int sec = (int.parse(this) % 60);
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";

    return second;
  }
}
