import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension NullCheckExtension<T> on T {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isTrue => this != null && this==true;
  bool get isFalse => this != null && this!=true;
}

extension ListNullCheckExtension<T> on List<T>? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension StringNullCheckExtension<T> on String?  {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}


extension DelayedExtension on dynamic {
  delayed() => Future.delayed(
        Duration.zero,
        () => this,
      );
}



extension PrintDebug on dynamic {
  void get printDebug => debugPrint(this.toString());
  void get logDebug => log(this.toString(),name: "");
}

extension EmptyBox on int {
  Widget get height => SizedBox(height: toDouble(),);
  Widget get width => SizedBox(width: toDouble(),);
}

extension FocusNodeExtensions on FocusNode {
  requestFocusDelayed({int delay = 2}) async {
    await Future.delayed(
      Duration(seconds: delay),
    );
    this.requestFocus();
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

extension ContextX on BuildContext{
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  pop([dynamic result ]) => Navigator.pop(this,result);
  push (Widget screen)=> Navigator.push(this, CupertinoPageRoute(builder: (context) => screen,));
  pushReplace(Widget screen)=> Navigator.pushReplacement(this, CupertinoPageRoute(builder: (context) => screen,));
}

extension Format on DateTime {
  String formatDate() => DateFormat('EEE MMM d, y').format(this);

  String formatMonthDay() => DateFormat('MMM dd').format(this);

  String formatMonthYear() => DateFormat('MMMM yyyy').format(this);

  String formatMonthDayYear() => DateFormat('MMM dd yyyy').format(this);

  String formatDayMonthYear() => DateFormat('dd MMM yyyy').format(this);

  String formatTime() => DateFormat('h:mm a').format(this);

  DateTime mostRecentSunday() => DateTime(year, month, day - weekday % 7);

  String formatDuration() {
    final duration = Duration(milliseconds: millisecondsSinceEpoch);
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final formattedHours = hours.toString().padLeft(2, '0');
    final formattedMinutes = minutes.toString().padLeft(2, '0');
    final formattedSeconds = seconds.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes:$formattedSeconds';
  }

  String formatElapsedTimeString() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 1) {
      final days = difference.inDays;
      return '$days day${days > 1 ? 's' : ''} ago';
    } else if (difference.inHours >= 1) {
      final hours = difference.inHours;
      return '$hours hour${hours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes >= 1) {
      final minutes = difference.inMinutes;
      return '$minutes minute${minutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}
extension BaseModelFromJson on Type {
  fromJson(Map<String, dynamic> data) {}
}
extension StringToIntExtension on String {
  int toInt() {
    return int.tryParse(this) ?? 0;
  }
}
