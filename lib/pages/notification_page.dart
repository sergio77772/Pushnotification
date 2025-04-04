// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   const NotificationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage?;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Notificaciones')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // const Text(
//           //   "Esto es una notificación de prueba",
//           //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           // ),
//           const SizedBox(height: 20),
//           if (message != null) ...[
//             Center(child: Text(message.notification?.title ?? "Sin título")),
//             Text(message.notification?.body ?? "Sin cuerpo"),
//             // Text(message.data.toString()),
//           ],
//         ],
//       ),
//     );
//   }
// }


// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   const NotificationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage?;

//     // ID del video de YouTube (ajústalo según el mensaje recibido)
//     const String videoId = "zjv8TQ0gBkg";
//     final String thumbnailUrl = "https://img.youtube.com/vi/$videoId/0.jpg";

//     return Scaffold(
//       appBar: AppBar(title: const Text('Notificaciones')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           if (message != null) ...[
//             Text(
//               message.notification?.title ?? "Sin título",
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
//             Text(
//               message.notification?.body ?? "Sin cuerpo",
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
            
//             // Vista previa del video con miniatura
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, 'video_page');
//               },
//               child: Column(
//                 children: [
//                   Image.network(
//                     thumbnailUrl,
//                     height: 200,
//                     width: 300,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'video_page');
//                     },
//                     child: const Text("Ver Video"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }



import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_notifications_1/pages/video_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?; //obtierne el msj

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notificación',style: TextStyle(fontSize: 18, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: message == null //mira si hay un msj
              ? const Text(
                  "No hay notificaciones",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                )
              : Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        message.notification?.title ?? "Sin título",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        message.notification?.body ?? "Sin contenido",
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                           Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => VideoPage(),
                        ));
                        },
                        child: const Text(
                          "Ver Video",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

