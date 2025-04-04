import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:push_notifications_1/api/firebase_api.dart';
import 'package:push_notifications_1/firebase_options.dart';
import 'package:push_notifications_1/pages/home_page.dart';
import 'package:push_notifications_1/pages/notification_page.dart';
import 'package:push_notifications_1/pages/splash_screen.dart';
import 'package:push_notifications_1/pages/video_page.dart';

// Llave para manejar la navegación entre pantallas
final navigatorKey = GlobalKey<NavigatorState>();

//guarda la notificación que abrió la app
RemoteMessage? initialMessage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Mantiene el splash hasta que termine la inicialización
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseApi = FirebaseApi(); // Instancia Firebase con opciones configuradas
  await firebaseApi.initNotifications(); // Inicia la API antes del runApp()

  //guarda el mensaje si la app se apbrio desde la notif
  initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('pausa de segundos');
    await Future.delayed(const Duration(milliseconds: 100));
    print('inicia app');
    // Elimina el splash screen
    FlutterNativeSplash.remove();

    //Si la app se abrió desde una notificación, ir a NotificationPage
    if (initialMessage != null) {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => NotificationPage(),
          settings: RouteSettings(arguments: initialMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones Push',
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'home_page': (context) => const HomePage(),
        'notification_page': (context) => const NotificationPage(),
        'video_page': (context) => const VideoPage(),
      },
    );
  }
}
