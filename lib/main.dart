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
      imageSrc: "assets/queijos-finos.jpeg",
      text: "Queijos Finos Biopark",
      textStyle: const TextStyle(fontSize: 30.0),
      backgroundColor: Colors.white,
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
        title: Image.asset(
          'assets/queijos-finos.jpeg',
          height: 40,
          ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
