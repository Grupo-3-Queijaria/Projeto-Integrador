import 'package:flutter/material.dart';
import 'login.dart'; // Importando o arquivo de login
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget splashScreen = SplashScreenView(
      navigateRoute: LoginScreen(), 
      duration: 3000, 
      imageSize: 130,
      imageSrc: "assets/queijos-finos.png",
      textStyle: const TextStyle(
        fontSize: 30.0,
        color: Colors.white,
      ),
      backgroundColor: const Color(0xFF0D2838), 
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen,
    );
  }
}
