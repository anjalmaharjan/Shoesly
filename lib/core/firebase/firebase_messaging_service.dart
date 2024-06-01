import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shoesly/core/firebase/local_notification_service.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String> generateFirebaseToken() async {
    var token = await _firebaseMessaging.getToken();
    return token!;
  }

  void requestPersmission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      registerForegroundNotification();
    }
  }

  static void registerForegroundNotification() =>
      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) async =>
            await LocalNotificationService().initLocalNotification(message),
      );
}
