import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SobreProdutor extends StatelessWidget {
  final int idPropriedade;

  SobreProdutor({required this.idPropriedade});


  Future<Map<String, dynamic>> fetchDados() async {
    const String baseUrl = 'https://23ce-177-72-31-253.ngrok-free.app/api/propriedades';
    
  
    final responsePropriedade = await http.get(
      Uri.parse('$baseUrl/$idPropriedade'),
      headers: {'ngrok-skip-browser-warning': 'true'},
    );

    if (responsePropriedade.statusCode != 200) {
      throw Exception('Erro ao carregar detalhes da propriedade');
    }


    final String amostrasUrl = '$baseUrl/$idPropriedade/amostras';
    final responseAmostras = await http.get(
      Uri.parse(amostrasUrl),
      headers: {'ngrok-skip-browser-warning': 'true'},
    );

    if (responseAmostras.statusCode != 200) {
      throw Exception('Erro ao carregar amostras');
    }

   
    final propriedadeData = jsonDecode(responsePropriedade.body);
    final amostrasData = jsonDecode(responseAmostras.body);

  
    print('Detalhes da Propriedade: $propriedadeData');
    print('Amostras: $amostrasData');

    return {
      'propriedade': propriedadeData,
      'amostras': amostrasData,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do Produtor',
          style: TextStyle(color: Color.fromARGB(255, 152, 142, 90)),
        ),
        backgroundColor: const Color(0xFF0D2838),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchDados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Nenhum dado encontrado.'));
          } else {
            final propriedadeData = snapshot.data!['propriedade'];
            final amostrasData = snapshot.data!['amostras'];

            return SingleChildScrollView(
              child: Column(
                children: [
                  
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    color: const Color(0xFFEDEDED),
                    child: Column(
                      children: [
                        CircleAvatar(
  radius: 60,
  backgroundColor: Colors.grey[300],
  backgroundImage: AssetImage('assets/perfilFazenda.jpg'),
),

                        const SizedBox(height: 16),
                        Text(
                          propriedadeData['nomePropriedade'] ?? 'Nome da Propriedade',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          propriedadeData['nomeProdutor'] ?? 'Nome do Produtor',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          propriedadeData['cpf'] ?? 'Nome do Produtor',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Status:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
  propriedadeData['status'] == 1
      ? 'ATIVO'
      : propriedadeData['status'] == 0
          ? 'INATIVO'
          : 'EM COMPLEMENTAÇÃO', 
  style: TextStyle(
    fontSize: 16,
    color: propriedadeData['status'] == 1
        ? Colors.green 
        : propriedadeData['status'] == 0
            ? Colors.red 
            : Colors.amber, 
  ),
),

                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Telefone: ${propriedadeData['telefone'] ?? 'Não informado'}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Tecnologia: ${propriedadeData['tecnologia'] ?? 'N/A'}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Endereço:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${propriedadeData['rua'] ?? 'Rua não informada'}, ${propriedadeData['numero'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${propriedadeData['bairro'] ?? ''}, ${propriedadeData['cidade'] ?? ''} - ${propriedadeData['UF'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'CNPJ: ${propriedadeData['cnpj'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tabela de Amostras
                  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tabela de Amostras',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Quantidade Leite')),
                DataColumn(label: Text('Quantidade Queijo')),
                DataColumn(label: Text('Data')),
              ],
              rows: List.generate(amostrasData.length, (index) {
                final amostra = amostrasData[index];

                final idAmostra = amostra['id'] ?? 'N/A';
                final dataAmostra = amostra['data'] ?? 'Data não informada';
                final quantidadeLeite = amostra['quantidadeleite'] ?? 0;
                final quantidadeQueijo = amostra['quantidadeQueijo'] ?? 0;
               
                return DataRow(cells: [
                  DataCell(Text(idAmostra.toString())),
                  DataCell(Text(quantidadeLeite.toString())),
                  DataCell(Text(quantidadeQueijo.toString())),
                  DataCell(Text(dataAmostra)),
                ]);
              }),
            ),
          ),
        ],
      ),
    ),
  ),
),

                  const SizedBox(height: 32),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
