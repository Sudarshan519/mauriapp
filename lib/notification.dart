import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //
  ///initilize local notification
  initializeNotification() async {
    tz.initializeTimeZones();
    _configureLocalTimezone();
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  ///requestIOS permission
  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  ///Display Notification
  displayNotification({required String title, required String body}) async {
    // print("doing test");

    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', title,
            channelDescription: body,
            // sound: const RawResourceAndroidNotificationSound("athou"),
            playSound: true,
            enableVibration: true,
            enableLights: true,
            autoCancel: false,
            importance: Importance.max,
            priority: Priority.high);
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentSound: true,
    );
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  Future selectNotification(String? payload) async {
    // var isregistered = Get.isRegistered<HomeController>();
    // print(isregistered);
    // if (isregistered) homeController.updateIndex(1);
    // await

    // if (payload != null) {
    //   print('notification payload: $payload');
    // } else {
    //   print("Notification Done");
    // }
    // Get.to(() => Container(
    //     color: Colors.white,
    //     child: const Material(
    //       child: Center(child: Text("Notification completed")),
    //     )));
  }

  ///Scheduled Notification
  scheduledNotification(
      {int id = 0,
      int days = 0,
      required String title,
      required String body}) async {
    // String? date = task.date;
    // String? time = task.startTime;

    DateTime now = DateTime.now().add(Duration(days: days)).toUtc();
    int year = now.year; // int.parse(date!.split('/')[2]);
    int day = now.day; //int.parse(date.split('/')[1]);
    int month = now.month; //int.parse(date.split('/')[0]);
    int hour = now.hour;
    int sec = now.second; // int hour = int.parse(time!.split(':')[1]);
    // int minute = int.parse(time.split(":")[0].split(" "));
    // print(year + month + day);
    // print(date);
    // print(time);
    // print(year);
    ///notification time 4:15 everyday
    // print("notification called");
    // List<String> tm = time!.split(" ");
    // print(time);
    // int hour = int.parse(tm[0].split(':')[0]);
    int minute = now.minute; //int.parse(tm[0].split(':')[1]);
    // print(hour);
    // print(year);
    // print(month);
    // print(day);
    // print(minute);
    // print(tm);
    // now = DateTime.now();
    // if(localDate!=null)
    // {
    // print(now.toLocal());
    // }
    var tztime = _convertTime(year, month, day, hour, minute, sec);
    // print(tz.TZDateTime.now(tz.local));
    // print(tztime);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tztime.add(const Duration(seconds: 5)),
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      NotificationDetails(
          android:
              AndroidNotificationDetails('your channel id', title.toString(),
                  // sound: const RawResourceAndroidNotificationSound("athou"),
                  channelDescription: body,
                  playSound: true,
                  autoCancel: false)),
      androidAllowWhileIdle: true,
      //payload: now.toLocal().toString(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      // matchDateTimeComponents: // task.repeat == repeatList[0]
      //     //?
      //     DateTimeComponents.time
      // : DateTimeComponents.dayOfWeekAndTime
    );
  }

  tz.TZDateTime _convertTime(
      int year, int month, int day, int hour, int minutes, int second) {
    // final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    // tz.TZDateTime scheduleDate =
    //     tz.TZDateTime(tz.local, year, month, day, hour, minutes, second);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, year, month, day, hour, minutes, second + 5);
//check secheduled
    // if (scheduleDate.isBefore(now)) {
    //   ///
    //   print("before");
    //   scheduleDate = scheduleDate.add(const Duration(minutes: 1));
    // } else {
    //   print("correct");
    // }
    // print(scheduleDate);
    return scheduleDate;
  }

  Future<void> _configureLocalTimezone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  // getNotificationDetail() async {
  //   final NotificationAppLaunchDetails? notificationAppLaunchDetails =
  //       await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  //   // print(notificationAppLaunchDetails.toString());
  // }

  // getPendingNotification() async {
  //   final List<PendingNotificationRequest> pendingNotificationRequests =
  //       await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  //   // print(pendingNotificationRequests.length);
  //   // print(pendingNotificationRequests[0].payload);
  //   return pendingNotificationRequests;
  // }

  // getActiveNotification() async {
  //   final List<ActiveNotification>? activeNotifications =
  //       await flutterLocalNotificationsPlugin
  //           .resolvePlatformSpecificImplementation<
  //               AndroidFlutterLocalNotificationsPlugin>()
  //           ?.getActiveNotifications();
  // }

  cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
