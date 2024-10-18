import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget splashScreen = SplashScreenView(
      navigateRoute: const HomePage(),
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
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      home: splashScreen,
    );
  }
}
