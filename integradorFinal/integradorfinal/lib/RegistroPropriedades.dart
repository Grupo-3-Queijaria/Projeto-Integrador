import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SobreProdutor.dart';

class RegistroPropriedades extends StatefulWidget {
  const RegistroPropriedades({super.key});

  @override
  State<RegistroPropriedades> createState() => _RegistroPropriedadesState();
}

class _RegistroPropriedadesState extends State<RegistroPropriedades> {
  late Future<List<Map<String, dynamic>>> propriedades;

  @override
  void initState() {
    super.initState();
    propriedades = fetchPropriedades();
  }

  Future<List<Map<String, dynamic>>> fetchPropriedades() async {
    const String url =
        'https://23ce-177-72-31-253.ngrok-free.app/api/propriedades';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'ngrok-skip-browser-warning': 'true'},
      );
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => Map<String, dynamic>.from(e)).toList();
      } else {
        throw Exception('Erro ao carregar propriedades');
      }
    } catch (e) {
      throw Exception('Erro ao carregar dados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro de Propriedades',
          style: TextStyle(color: Color.fromARGB(255, 152, 142, 90)),
        ),
        backgroundColor: const Color(0xFF0D2838),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: propriedades,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma propriedade encontrada.'));
          } else {
            final propriedades = snapshot.data!;
            return ListView.builder(
              itemCount: propriedades.length,
              itemBuilder: (context, index) {
                final propriedade = propriedades[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    child: ExpansionTile(
                      title: Text(
                        propriedade['nomePropriedade'] ?? 'Sem Nome',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        'Produtor: ${propriedade['nomeProdutor'] ?? 'Desconhecido'}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email: ${propriedade['email'] ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Telefone: ${propriedade['telefone'] ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'CNPJ: ${propriedade['cnpj'] ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'CPF: ${propriedade['cpf'] ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 152, 142, 90),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                final idPropriedade =
                                    propriedade['idPropriedade'];
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
                                  child: const Text(
                                    'Ver Mais',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}