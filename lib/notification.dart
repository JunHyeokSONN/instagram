import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final notifications = FlutterLocalNotificationsPlugin();

initNotification(BuildContext context) async {
  var androidSetting = AndroidInitializationSettings('app_icon');
  var iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(
    android: androidSetting,
    iOS: iosSetting,
  );

  await notifications.initialize(initializationSettings);

  // 알림 클릭 동작 설정
  FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.getActiveNotifications()
      .then((receivedNotifications) {
    if (receivedNotifications.isNotEmpty) {
      var payload = receivedNotifications.first.payload;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Text('안뇨옹'),
        ),
      );
    }
  });
}

showNotification() async {
  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 채널 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );

  var iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  notifications.show(
    1,
    '제목1',
    '내용1',
    NotificationDetails(android: androidDetails, iOS: iosDetails),
    payload: '부가정보',
  );
}

showNotification2() async {
  tz.initializeTimeZones();

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );

  var iosDetails = const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  notifications.zonedSchedule(
    2,
    '제목2',
    '내용2',
    makeDate(8, 30, 0),
    NotificationDetails(android: androidDetails, iOS: iosDetails),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
    UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}

tz.TZDateTime makeDate(int hour, int min, int sec) {
  var now = tz.TZDateTime.now(tz.local);
  var when = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, min, sec);
  if (when.isBefore(now)) {
    return when.add(Duration(days: 1));
  } else {
    return when;
  }
}

