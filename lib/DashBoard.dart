import 'package:flutter/material.dart';
import 'package:menu_hamburguer/CustomAppBar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded (
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildDashBoardCards(),
            ),
            ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildUserList(),
              ),
              ),  
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
    );
  }

  Widget buildDashBoardCards() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        buildDashboardCard("Desistentes", "2", "Produtores", Colors.red),
        buildDashboardCard("Complementação", "5", "Produtores", Colors.yellow),
        buildDashboardCard("Ativos", "10", "Produtores", Colors.green),
        buildDashboardCard("Total", "17", "Produtores", Colors.blue),
      ],
    );
  }

  Widget buildDashboardCard(
      String title, String count, String subtitle, Color color) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D2838),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            count,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // Função para renderizar a listagem de usuários
  Widget buildUserList() {
    final List<Map<String, String>> users = [
      {
        'name': 'Maria Das Dores',
        'email': 'mariaqueijos@gmail.com',
        'qualidade': 'XXXXXXXX',
      },
      {
        'name': 'Maria Das Dores',
        'email': 'mariaqueijos@gmail.com',
        'qualidade': '00000-0000/00001',
      },
      {
        'name': 'Maria Das Dores',
        'email': 'mariaqueijos@gmail.com',
        'qualidade': '00000-0000/00001',
      },
      {
        'name': 'Maria Das Dores',
        'email': 'mariaqueijos@gmail.com',
        'qualidade': '00000-0000/00001',
      },
    ];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome: ${user['name']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Email:${user['email']}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Qualidade: ${user['qualidade']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Data:',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
