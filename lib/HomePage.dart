import 'package:flutter/material.dart';
import 'package:menu_hamburguer/DashBoard.dart';
import 'CustomAppBar.dart';
import 'RegistroPropriedades.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF0D2838),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/Perfil.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Crystian Kasuga',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer e permanece na HomePage
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Registro de Propriedades'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistroPropriedades(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: DashBoard()
        ),
      
    );
  }
}
