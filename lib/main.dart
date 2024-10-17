import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget splashScreen = SplashScreenView(
      navigateRoute: const HomeScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/queijos-finos.png",
      text: "Seja muito bem vindo ao melhor app de Engenharia de Soft",
      textStyle: const TextStyle(
        fontSize: 30.0,
        color: Colors.white,
      ),
      backgroundColor: const Color(0xFF0D2838),
    );

    return MaterialApp(
      home: splashScreen,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D2838),
        title: Image.asset(
          'assets/queijos-finos.png',
          height: 40,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              print("Botão de notificação pressionada");
            },
          )
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF0D2838),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Bem-vindo à Home Page!'),
      ),
    );
  }
}
