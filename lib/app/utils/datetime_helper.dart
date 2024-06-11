import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static const ddMMyyyyHHMM = 'dd-MM-yyyy ,HH:mm aa';

  static getFormattedTime(TimeOfDay time, BuildContext context) {
    if (time.hour > 1 && time.hour < 14 && time.minute % 10 == 0) {
      return time.format(context);
    } else {
      return time.format(context);
    }
  }

  static getFormatedDateTime(DateTime dateTime, String format) {
    //"dd-mm-yyyy ,HH:mm aa "
    return DateFormat(format).format(dateTime);
  }

  static dateWithDay(dynamic date){
    return DateFormat.yMEd().format(date is DateTime ? date : DateTime.parse(date));
  }
  static dateDDMMYYY(dynamic date){
    return DateFormat("MM/dd/yyyy").format(date is DateTime ? date : DateTime.parse(date));
  }
  static dateWithTime(dynamic date){
    return DateFormat("MM/dd/yyyy h:mm a").format(date is DateTime ? date : DateTime.parse(date));
  }
  static dateMonth(dynamic date){
    return DateFormat("d MMM yyyy").format(date is DateTime ? date : DateTime.parse(date));
  }

  static dateMonthWithTime(dynamic date){
    return DateFormat("d MMM yyyy, h:mm a").format(date is DateTime ? date : DateTime.parse(date));
  }
  static startAndEndTime(dynamic startTime,dynamic endTime){
     return DateFormat.jm().format(startTime is DateTime ? startTime : DateTime.parse(startTime)) +" - "+ DateFormat.jm().format(endTime is DateTime ? endTime : DateTime.parse(endTime));
  }

  static stringToDateTime(String date){
    return DateTime.parse(date);
  }
  static stringToDateTimeMMDDYYYHHMMA(String date){
    try{
      DateTime response =  DateFormat("MM/dd/yyyy hh:mm a").parse(date);
      return response;
    }catch (e){
      DateTime response =  DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
      return response;
    }
  }


  static stringToDateTimeYYYMMDD(String date){
    return DateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString());
  }

  static convertTimeFormat(String time) {
    // Parse the input time string
    final inputFormat = DateFormat('HH:mm:ss');
    final parsedTime = inputFormat.parse(time);

    // Format the time to the desired output format
    final outputFormat = DateFormat('hh:mm a');
    final formattedTime = outputFormat.format(parsedTime);

    return formattedTime;
  }
  static String convertTimeTo12HourFormat(String timeString) {
    // Parse the input time string into a DateTime object
    DateTime time = DateTime.parse(timeString);

    // Create a DateFormat instance for 12-hour time format
    final format = DateFormat('h:mm a');

    // Format the DateTime object into the desired time format
    return format.format(time);
  }
}
