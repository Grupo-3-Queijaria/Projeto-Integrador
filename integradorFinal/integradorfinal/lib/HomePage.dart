import 'package:flutter/material.dart';
import 'DashBoard.dart';
import 'CustomAppBar.dart';
import 'RegistroPropriedades.dart';
import 'TelaTecnologias.dart'; 

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
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Propriedades'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistroPropriedades(),
                  ),
                );
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Tecnologias'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TecnologiaScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: DashBoard(),
      ),
    );
  }
}
