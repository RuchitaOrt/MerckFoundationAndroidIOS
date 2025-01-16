// ignore_for_file: unnecessary_brace_in_string_interps, unused_local_variable, unused_field, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:merckfoundation22dec/mediascreen.dart/NotificationDetailPage.dart';
import 'package:merckfoundation22dec/screens/splash.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/UtilityFile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

// Constants for the notification channel
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  configLocalNotification();
  // Show notification for background messages
}

void configLocalNotification() {
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/logo1');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);
}

Future<void> selectNotification(String payload) async {
  print("Notification payload: $payload");
  if (payload != null) {
    // Handle navigation or other actions here
  }
}

Future<void> showNotification(RemoteMessage message) async {
  print('showNotification called with message: $message');

  var title = message.notification?.title ?? 'No Title';
  var body = message.notification?.body ?? 'No Body';
  var imgurl = message.notification?.android?.imageUrl;

  print("Title: $title");
  print("Body: $body");

  var androidDetails;
  if (imgurl != null) {
    final String bigPicturePath =
        await _downloadAndSaveFile(imgurl, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      largeIcon: FilePathAndroidBitmap(bigPicturePath),
      contentTitle: title,
      htmlFormatContentTitle: true,
      summaryText: body,
      htmlFormatSummaryText: true,
    );

    androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channel.description,
      styleInformation: bigPictureStyleInformation,
    );
  } else {
    print("not Image avilble");

    androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channel.description,
    );
  }

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidDetails,
  );

  flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformChannelSpecifics,
    payload: jsonEncode(message.data),
  );
}

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  if (url == null || url.isEmpty) {
    throw ArgumentError("URL must not be null or empty");
  }
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final http.Response response = await http.get(Uri.parse(url));
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  if (Platform.isAndroid) {
    final permissionStatus = await Permission.notification.status;
    if (!permissionStatus.isGranted) {
      final permissionResult = await Permission.notification.request();
      if (permissionResult.isGranted) {
        print('Notification permission granted');
      } else {
        print('Notification permission denied');
      }
    }
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static String fcm_token;
  bool isroomfound = false;
  String roomid;

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Global navigator key
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  @override
  void initState() {
    super.initState();
    Utility().loadAPIConfig(context);
    settoken();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      print("Initial notification message: $message");
      if (message != null) {
        if (message.data['room'] != null) {
          isroomfound = true;
          roomid = message.data['room'].toString();
        }
        showNotification(
            message); // Show notification if app is opened from a terminated state
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground notification received: ${message.messageId}");
      print("Foreground notification received: $message");
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification tapped: ${message.messageId}');
      if (message.data['room'] != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) =>
                NotiDetailpage(id: message.data['room'].toString())));
      }
    });

    configLocalNotification();
  }

  Future<void> settoken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    var value = await messaging.getToken();
    print("FCM Token: $value");
    setState(() {
      GlobalLists.fcmtokenvalue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merck Foundation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: isroomfound
          ? NotiDetailpage(id: roomid)
          : SplashScreen(token: GlobalLists.fcmtokenvalue),
      navigatorKey: navigatorKey, // Assigning the navigatorKey
    );
  }
}

//newwwwww

//////////////////////////fcgcccccccccccccccccccccccccccccccc