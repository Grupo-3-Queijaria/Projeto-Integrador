import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart'; // Certifique-se de importar corretamente o MainDrawer

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: MainDrawer(), // Adiciona o menu lateral
      body: Center(
        child: Text('Bem-vindo à Home!'),
      ),
    );
  }
}
