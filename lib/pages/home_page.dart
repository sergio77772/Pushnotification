import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_open_outlined),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Menú de Opciones',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.wb_sunny_outlined,
                color: Colors.black87,
                size: 24,
              ),
              title: const Text(
                'Mañana',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.wb_twilight_sharp,
                color: Colors.black87,
                size: 24,
              ),
              title: const Text(
                'Tarde',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.nightlight_outlined,
                color: Colors.black87,
                size: 24,
              ),
              title: const Text(
                'Noche',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {},
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.notifications_outlined,
                color: Colors.black87,
                size: 24,
              ),
              title: const Text(
                'Notificaciones',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                // Navigator.push(
                //         context,
                //         CupertinoPageRoute(
                //           builder: (context) => NotificationPage(),
                //         ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: Colors.black87,
                size: 24,
              ),
              title: const Text(
                'Configuraciones',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      body: const Center(
        child: Text('Bienvenido a la Pantalla de inicio!'),
      ),
    );
  }
}
