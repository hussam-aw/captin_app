import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseHelper {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void configureFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message);
    });
  }

  void requestNotificationPermissions() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
