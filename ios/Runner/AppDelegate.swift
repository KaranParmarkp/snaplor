import UIKit
import Flutter
import flutter_local_notifications
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
      if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
      }

      GeneratedPluginRegistrant.register(with: self)
      print("fcmToken",Messaging.messaging().fcmToken)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let extHelper = FirebaseMessaging.FIRMessagingExtensionHelper.init()
        extHelper.exportDeliveryMetricsToBigQuery(withMessageInfo: response.notification.request.content.userInfo)
    }

    func application(application: UIApplication,
                    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       Messaging.messaging().apnsToken = deviceToken
   }
}
