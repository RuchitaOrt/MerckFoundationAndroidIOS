import UIKit
import Flutter
import Firebase
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
override func application(
  _ application: UIApplication,
  didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    FirebaseApp.configure()
    UNUserNotificationCenter.current().delegate = self
    GeneratedPluginRegistrant.register(with: self)
  return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
}
//
//
//latest working
// import UIKit
// import Flutter
// import Firebase
// import UserNotifications
//
// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//    
//     // Configure Firebase
//     FirebaseApp.configure()
//
//     // Set UNUserNotificationCenter delegate
//     UNUserNotificationCenter.current().delegate = self
//
//     // Request notification permissions
//     UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//       print("Notification permission granted: \(granted)")
//       if let error = error {
//         print("Error while requesting permission: \(error.localizedDescription)")
//       }
//     }
//
//     // Register for remote notifications
//     application.registerForRemoteNotifications()
//
//     // Set Firebase Messaging delegate
//     Messaging.messaging().delegate = self
//
//     // Register generated Flutter plugins
//     GeneratedPluginRegistrant.register(with: self)
//
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
//
//   // Pass device APNs token to Firebase
//   override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//     Messaging.messaging().apnsToken = deviceToken
//   }
//
//   // MARK: - Notification Handling
//
//   // Handle foreground notifications
//   override func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                        willPresent notification: UNNotification,
//                                        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//     completionHandler([.alert, .sound, .badge])
//   }
//
//   // Handle notification interaction (tap)
//   override func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                        didReceive response: UNNotificationResponse,
//                                        withCompletionHandler completionHandler: @escaping () -> Void) {
//     completionHandler()
//   }
// }
//
// // MARK: - Firebase Messaging Delegate
//
// extension AppDelegate: MessagingDelegate {
//   func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//     print("Firebase registration token: \(String(describing: fcmToken))")
//     // Optionally send token to your server here
//   }
// // }
// import UIKit
// import Flutter
// import Firebase
// import UserNotifications

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {

//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
    
//     FirebaseApp.configure()

//     UNUserNotificationCenter.current().delegate = self
//     application.registerForRemoteNotifications()
//     Messaging.messaging().delegate = self

//     GeneratedPluginRegistrant.register(with: self)

//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }

//   override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//     Messaging.messaging().apnsToken = deviceToken
//     super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
//   }

//   // MARK: - UNUserNotificationCenterDelegate methods

//   // Foreground notification handling
//   override func userNotificationCenter(_ center: UNUserNotificationCenter,
//                               willPresent notification: UNNotification,
//                               withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//     completionHandler([.alert, .sound, .badge])
//   }

//   // Notification tap handling
//   override func userNotificationCenter(_ center: UNUserNotificationCenter,
//                               didReceive response: UNNotificationResponse,
//                               withCompletionHandler completionHandler: @escaping () -> Void) {
//     // Handle notification tap here, e.g. send info to Flutter via method channels or post notification
//     completionHandler()
//   }

//   // MARK: - MessagingDelegate methods

//   func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//     print("Firebase registration token: \(String(describing: fcmToken))")
//     // Optionally send token to your server here
//   }
// }


