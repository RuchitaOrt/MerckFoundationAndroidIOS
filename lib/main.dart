import 'dart:convert';
import 'dart:io';

import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:merckfoundation22dec/mediascreen.dart/NotificationDetailPage.dart';
import 'package:merckfoundation22dec/model/Note.dart';
import 'package:merckfoundation22dec/screens/splash.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/UtilityFile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' show rootBundle;

// import 'package:flutter/material.dart';
// import 'package:merckfoundation22dec/screens/splash.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  configLocalNotification();
}

void configLocalNotification() {
  var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/logo1');
  var initializationSettingsIOS = new IOSInitializationSettings();
  var initializationSettings = new InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);
}

Future selectNotification(String payload) async {
  print("payload");
  print('selectNotification ${payload}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // bool load = await onDoneLoading();
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  PdfView.platform = SurfaceAndroidPdfViewer();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static String fcm_token;
  bool isroomfound = false;
  String roomid;

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    // firebaseCloudMessaging_Listeners();
    Utility().loadAPIConfig(context);
    settoken();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      print("message");
      print(message);
      if (message.data['room'] != null) {
        isroomfound = true;
        roomid = message.data['room'].toString();
        
      }
      if (message != null) {
        print("notification nessage");
        showNotification(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("onlisten");

      var title = message.notification.title;
      var body = message.notification.body;
      String imgurl = message.notification.android.imageUrl;
      print("imgurl");
      print(imgurl);
      //   final String largeIconPath = await _downloadAndSaveFile(
      //     'https://via.placeholder.com/48x48', 'largeIcon');
      final String bigPicturePath =
          await _downloadAndSaveFile(imgurl, 'bigPicture');
          final attachmentPicturePath = await getImageFilePathFromAssets(imgurl);
      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
              largeIcon: FilePathAndroidBitmap(bigPicturePath),
              contentTitle: title.toString(),
              htmlFormatContentTitle: true,
              summaryText: body.toString(),
              htmlFormatContent: true,
              htmlFormatTitle: true,
              htmlFormatSummaryText: true);

      final AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('big text channel id',
              'big text channel name', 'big text channel description',
              styleInformation: bigPictureStyleInformation);
     var iOSPlatformChannelSpecifics = new IOSNotificationDetails(
attachments: [
  IOSNotificationAttachment(attachmentPicturePath)
]
    );
      final NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
            channel.id, channel.name, channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: '@mipmap/logo1',
            styleInformation: bigPictureStyleInformation),
iOS: iOSPlatformChannelSpecifics


      );
      var data = message.data['room'];
      print(data);
      Note newNote = Note(
          title: title.toString(), description: body.toString(), screen: data);
      String noteJsonString = newNote.toJsonString();
      await flutterLocalNotificationsPlugin.show(
          0, title.toString(), "", platformChannelSpecifics,
          payload: noteJsonString);

     
    });

   
    configLocalNotification();
    super.initState();
  }

  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");
  Future selectNotification(String payload) async {
    print("payload");
    print('selectNotification ${payload}');
    print("print");
  
    await navigatorKey.currentState.push(MaterialPageRoute(
        builder: (_) => NotiDetailpage(
              id: "10",
            )));
  }

  void configLocalNotification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/logo1');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
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
        home: SplashScreen(
                token: GlobalLists.fcmtokenvalue,
              ),
        
        // isroomfound == true
        //     ? NotiDetailpage(
        //         id: roomid,
        //       )
        //     : SplashScreen(
        //         token: GlobalLists.fcmtokenvalue,
        //       ),
        navigatorKey: navigatorKey);
  }

  settoken() async {
    //  GlobalLists.tokenval = fcm_token;
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    print("token");
    var value = await messaging.getToken(
      vapidKey: "BGpdLRs......",
    );
    print("these is token vaue");
    setState(() {
      print(value);
      GlobalLists.fcmtokenvalue = value;
    });
   
  }

  void showNotification(message) async {
    print('showNotification  $message');

    var title = message['notification']['title'];
    var body = message['notification']['body'];
    var imgurl = message['notification']['imageUrl'];
    print("imgurl");
    print(imgurl);
//
//  final String largeIconPath = await _downloadAndSaveFile(
//         'https://via.placeholder.com/48x48', 'largeIcon');
    final String bigPicturePath =
        await _downloadAndSaveFile(imgurl, 'bigPicture');
        final attachmentPicturePath = await getImageFilePathFromAssets(imgurl);
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
            largeIcon: FilePathAndroidBitmap(bigPicturePath),
            contentTitle: 'Merck Foundation',
            htmlFormatContentTitle: true,
            summaryText: 'summary <i>text</i>',
            htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'default_notification_channel_id',
        'Notification Channel',
        'MerckFoundation',
        playSound: true,
        enableVibration: true,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation:
            BigTextStyleInformation(message['notification']['body']));
   
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails(
attachments: [
  IOSNotificationAttachment(attachmentPicturePath)
]
    );
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
//

    flutterLocalNotificationsPlugin.show(
        0, title.toString(), "", platformChannelSpecifics,
        payload: jsonEncode(message));
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
  Future<String> getImageFilePathFromAssets(String asset) async {
  final byteData = await rootBundle.load(asset);

  final file =
      File('${(await getTemporaryDirectory()).path}/${asset.split('/').last}');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file.path;
}
}
