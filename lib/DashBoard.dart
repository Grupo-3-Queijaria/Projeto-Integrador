import 'package:flutter/material.dart';
import 'package:menu_hamburguer/GerarPdf.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Define o fundo do Scaffold
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Cartões do dashboard
          buildDashBoardCards(),

          const SizedBox(height: 16), // Espaçamento entre os widgets

          // Lista de usuários
          buildUserList(),
        ],
      ),
    );
  }

  Widget buildDashBoardCards() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true, // Ajusta o tamanho do GridView ao conteúdo
      physics: const NeverScrollableScrollPhysics(), // Desabilita o scroll interno
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

  Widget buildUserList() {
    final List<Map<String, String>> users = [
      {
        'name': 'Maria Das Dores',
        'email': 'mariaqueijos@gmail.com',
        'qualidade': 'XXXXXXXX',
        'data': '12/02/2024'
      },
      {
        'name': 'João da Silva',
        'email': 'joaodasilva@gmail.com',
        'qualidade': '00000-0000/00001',
        'data': '02/07/2023'
      },
      {
        'name': 'Ana Pereira',
        'email': 'anapereira@gmail.com',
        'qualidade': '00000-0000/00001',
        'data': '21/10/2023'
      },
      {
        'name': 'Carlos Alberto',
        'email': 'carlos@gmail.com',
        'qualidade': '00000-0000/00001',
        'data': '11/01/2024'
      },
    ];

    return ListView.builder(
      shrinkWrap: true, // Ajusta o tamanho do ListView ao conteúdo
      physics: const NeverScrollableScrollPhysics(), // Desabilita o scroll interno
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
                      color: Color(0xFF8B6914),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Email: ${user['email']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B6914),
                    ),
                  ),
                  Text(
                    'Qualidade: ${user['qualidade']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B6914),
                    ),
                  ),
                  Text(
                    'Data: ${user['Data']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B6914),
                    ),
                  ),
              
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {

                      final pdfGenerator = GerarPdf();
                            pdfGenerator.loadAndSharePDF(); // Chama a função para carregar e compartilhar a classe
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Gerar PDF',
                      style: TextStyle(color: Colors.white),
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
