import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';

import '../main.dart';
import '../mediascreen.dart/NotificationDetailPage.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // request notification permission
  static Future init() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      try {
        final token = await _firebaseMessaging.getToken();
        await Future.delayed(Duration(milliseconds: 1500));

        if (token == null) {
          GlobalLists.fcmtokenvalue = "";
        } else {
          GlobalLists.fcmtokenvalue = token;
        }
      } catch (e) {}
    } else {}
  }

  static Future localNotiInit() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // Handle notification tap
      },
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
    // Request notification permissions for iOS (important for iOS >= 10)
    if (Platform.isIOS) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }

  // on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {
    print("Ruchita onnotificationTap ${notificationResponse}");
    print("Notification tapped with response: $notificationResponse");

    final String payload = notificationResponse.payload!;
    if (payload != null && payload.isNotEmpty) {
      print("Notification payload: $payload");
      final data = jsonDecode(payload);
      print("Navigator state: ${navigatorKey.currentState}");
      if (data['room'] != null) {
        final roomId = data['room'].toString();
        navigatorKey.currentState?.push(MaterialPageRoute(
          builder: (_) => NotiDetailpage(id: roomId),
        ));
      }
    }
  }

  static Future showSimpleNotification({
    String? title,
    String? body,
    String? payload,
  }) async {
    // Android Notification details
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    // iOS Notification details
    const DarwinNotificationDetails iOSNotificationDetails =
        DarwinNotificationDetails(
      interruptionLevel: InterruptionLevel.timeSensitive,
      presentSound: true,
      presentAlert: true,
      presentBadge: true,
    );

    // General Notification details
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
