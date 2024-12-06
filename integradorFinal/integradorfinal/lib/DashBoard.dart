import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'GerarPDF.dart';
import 'SobreProdutor.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late Future<List<PropriedadeDTO>> propriedadesData;
  late Future<Map<String, int>> statusCounts;

  @override
  void initState() {
    super.initState();
    propriedadesData = fetchPropriedades();
    statusCounts = fetchStatusCounts();
  }

  Future<List<PropriedadeDTO>> fetchPropriedades() async {
    const String url = 'https://23ce-177-72-31-253.ngrok-free.app/api/propriedades';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true'
      });
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => PropriedadeDTO.fromJson(json)).toList();
      } else {
        throw Exception('Erro ao carregar propriedades');
      }
    } catch (e) {
      throw Exception('Erro ao carregar dados: $e');
    }
  }

  Future<Map<String, int>> fetchStatusCounts() async {
    final propriedades = await propriedadesData;
    Map<String, int> statusCounts = {
      'Desistentes': 0,
      'Complementação': 0,
      'Ativos': 0,
      'Total': propriedades.length,
    };

    for (var propriedade in propriedades) {
      if (propriedade.status == 0) {
        statusCounts['Desistentes'] = statusCounts['Desistentes']! + 1;
      } else if (propriedade.status == 1) {
        statusCounts['Complementação'] = statusCounts['Complementação']! + 1;
      } else if (propriedade.status == 2) {
        statusCounts['Ativos'] = statusCounts['Ativos']! + 1;
      }
    }

    return statusCounts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          FutureBuilder<Map<String, int>>(
            future: statusCounts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Nenhum dado encontrado.'));
              } else {
                final statusCounts = snapshot.data!;
                return buildDashBoardCards(statusCounts);
              }
            },
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<PropriedadeDTO>>(
            future: propriedadesData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Nenhum produtor encontrado.'));
              } else {
                final propriedades = snapshot.data!;
                return buildUserList(propriedades);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildDashBoardCards(Map<String, int> statusCounts) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        buildDashboardCard("Desistentes", statusCounts['Desistentes']!.toString(), "Produtores", Colors.red),
        buildDashboardCard("Complementação", statusCounts['Complementação']!.toString(), "Produtores", Colors.yellow),
        buildDashboardCard("Ativos", statusCounts['Ativos']!.toString(), "Produtores", Colors.green),
        buildDashboardCard("Total", statusCounts['Total']!.toString(), "Produtores", Colors.blue),
      ],
    );
  }

  Widget buildDashboardCard(String title, String count, String subtitle, Color color) {
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

  Widget buildUserList(List<PropriedadeDTO> propriedades) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: propriedades.length,
    itemBuilder: (context, index) {
      final propriedade = propriedades[index];
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
                  'Nome: ${propriedade.nomePropriedade}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Email: ${propriedade.email}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Status: ${propriedade.status}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),

                // Botão "Ver Detalhes"
                ElevatedButton(
                  onPressed: () {
                                final idPropriedade = propriedade.idPropriedade;
                                if (idPropriedade != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SobreProdutor(
                                          idPropriedade: idPropriedade),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'ID da propriedade não encontrado!'),
                                    ),
                                  );
                                }
                              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Ver Detalhes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),

                // Botão "Gerar PDF"
                ElevatedButton(
                  onPressed: () {
                    final pdfGenerator = GerarPdf();
                    pdfGenerator.loadAndSharePDF(); // Chama a função de gerar PDF
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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

class PropriedadeDTO {
  final int idPropriedade;
  final String nomePropriedade;
  final String email;
  final String cidade;
  final int status;

  PropriedadeDTO({
    required this.idPropriedade,
    required this.nomePropriedade,
    required this.email,
    required this.cidade,
    required this.status,
  });

  factory PropriedadeDTO.fromJson(Map<String, dynamic> json) {
    return PropriedadeDTO(
      idPropriedade: json['idPropriedade'],
      nomePropriedade: json['nomePropriedade'],
      email: json['email'],
      cidade: json['cidade'],
      status: json['status'],
    );
  }
}
