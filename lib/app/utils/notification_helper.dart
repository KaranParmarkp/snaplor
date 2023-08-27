import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  LocalNotification() {
    requestPermissions();
    initialize();
  }

  initialize() {
    var androidSettings =
    const AndroidInitializationSettings('@mipmap/launcher_icon');
    final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();

    var initSettings =
    InitializationSettings(android: androidSettings,iOS: initializationSettingsDarwin);
    flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  void requestPermissions() {
    if(Platform.isAndroid)flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    if(Platform.isIOS)flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(alert: true, badge: true, sound: true);
  }


  showSimpleNotification({required String title, required String body}) async {
    var androidDetails = const AndroidNotificationDetails(
        'id', 'channel',
        channelDescription: "description",
        priority: Priority.high,
        importance: Importance.max);
    var platformDetails =
    NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(0, title, body, platformDetails);
  }

  Future<void> showScheduleNotification() async {
    var scheduledNotificationDateTime =
    DateTime.now().add(const Duration(seconds: 2));
    var androidDetails = const AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
      channelDescription: "Channel Description",
      icon: 'app_icon',
    );
    var platformDetails =
    NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Flutter Local Notification',
        'Flutter Schedule Notification',
        scheduledNotificationDateTime,
        platformDetails,
        payload: 'Destination Screen(Schedule Notification)');
  }

  Future<void> showPeriodicNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channel_id', 'Channel Name',
        channelDescription: "Channel Description");
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails, iOS: null);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Flutter Local Notification',
        'Flutter Periodic Notification',
        RepeatInterval.everyMinute,
        notificationDetails,
        payload: 'Destination Screen(Periodic Notification)');
  }
}