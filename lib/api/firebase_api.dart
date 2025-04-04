import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:push_notifications_1/main.dart';
import 'package:push_notifications_1/pages/notification_page.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // await _firebaseMessaging.requestPermission();
    final firebaseToken = await _firebaseMessaging.getToken();
    print('Token: $firebaseToken');

    // Configurar listeners
    FirebaseMessaging.instance.getInitialMessage().then(manejarMensaje);//si la app esta cerrada
    FirebaseMessaging.onMessageOpenedApp.listen(manejarMensaje);//si la appp esta en segundo plano
    FirebaseMessaging.onMessage.listen((message) {
      print('Mensaje recibido en primer plano: ${message.notification?.title}');
      manejarMensaje(message);
    });
  }

  void manejarMensaje(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.push(
      CupertinoPageRoute(
        builder: (context) => NotificationPage(),
        settings: RouteSettings(arguments: message),
      ),
    );
  }
}
