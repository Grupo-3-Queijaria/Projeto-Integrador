import 'package:flutter/material.dart';
import 'package:menu_hamburguer/CustomAppBar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: buildDashBoardCards(),
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
        buildDashboardCard("Em complementação", "5", "Produtores", Colors.yellow[700]!),
        buildDashboardCard("Ativos", "10", "Produtores", Colors.green),
        buildDashboardCard("Total", "17", "Produtores", Colors.blue),
    ],
  );
}

  Widget buildDashboardCard(String title, String count, String subtitle, Color color) {
    return Container(
      padding: const EdgeInsets.all(16.0 ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(15),
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
}