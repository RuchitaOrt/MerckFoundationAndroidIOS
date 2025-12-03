import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/NotificationDetailPage.dart';
import 'package:merckfoundation22dec/screens/splash.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/PushNotification.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late RemoteMessage? initialMessage; // globally accessible

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {}
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // FirebaseCrashlytics.instance.recordFlutterError(details);
  };

  await PushNotifications.init();
  await PushNotifications.localNotiInit();
  setupFirebaseMessagingListeners();
  initialMessage = (await FirebaseMessaging.instance.getInitialMessage());


  runApp(MyApp());
}

// Firebase messaging listeners setup
void setupFirebaseMessagingListeners() {
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {});
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("Ruchita $message");
    if (message.notification != null) {
      print("Ruchita ${message.notification}");
      print("Ruchita ${navigatorKey.currentState}");
      navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
          builder: (_) => NotiDetailpage(id: message.data['room'].toString())));
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print("RUCHITA $payloadData");

    if (message.notification != null) {
      PushNotifications.showSimpleNotification(
        title: message.notification!.title!,
        body: message.notification!.body!,
        payload: payloadData,
      );
    }
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isroomfound = false;
  String? roomid;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    Future.delayed(Duration(milliseconds: 500), () {
      if (initialMessage != null && initialMessage!.data['room'] != null) {
        navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
            builder: (_) =>
                NotiDetailpage(id: initialMessage!.data['room'].toString())));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => SplashScreen(token: GlobalLists.fcmtokenvalue),
        ));
      }
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
