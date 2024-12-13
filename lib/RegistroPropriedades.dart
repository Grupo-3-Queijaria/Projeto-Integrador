import 'package:flutter/material.dart';
import 'package:menu_hamburguer/CustomAppBar.dart';

class RegistroPropriedades extends StatelessWidget {
  const RegistroPropriedades({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> propriedades = [
      {
        'nome': 'Flor da Terra',
        'produto': 'Produto: Queijos Finos',
        'imagem': 'assets/flor_terra.png',
        'produtor': 'João Adolfo',
        'email': 'mariaqueijos@gmail.com',
        'telefone': '[+55] 45 9999-9999',
        'cnpj': '00000-0000/00001',
        'cpf': '000.000.000-00',
      },
      {
        'nome': 'Ludwig',
        'produto': 'Produto: Queijos Artesanais',
        'imagem': 'assets/ludwig.png',
        'produtor': 'Carlos Antônio',
      },
      {
        'nome': 'Elis',
        'produto': 'Produto: Queijos Especiais',
        'imagem': 'assets/elis.png',
        'produtor': 'Roberto Mesquita',
      },
      {
        'nome': 'Átani',
        'produto': 'Produto: Queijos Especiais',
        'imagem': 'assets/atani.png',
        'produtor': 'Margarete Venceslau',
      },
      {
        'nome': 'Vila Belli',
        'produto': 'Produto: Queijos Especiais',
        'imagem': 'assets/vila_belli.png',
        'produtor': 'Tânia Oliveira',
      },
      {
        'nome': 'Falcão',
        'produto': 'Produto: Queijos Especiais',
        'imagem': 'assets/falcao.png',
        'produtor': 'Fabio Junior',
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(),

      body: Column(
        children: [
          // Título estilizado "REGISTRO DE PROPRIEDADES"
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'REGISTRO DE PROPRIEDADES',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B6914),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),

          // Lista de propriedades
          Expanded(
            child: ListView.builder(
              itemCount: propriedades.length,
              itemBuilder: (context, index) {
                final propriedade = propriedades[index];
                bool isExpanded = false;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return ExpansionTile(
                          leading: Image.asset(
                            propriedade['imagem']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            propriedade['nome']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                propriedade['produtor']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                (propriedade['produto']!),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          trailing: AnimatedRotation(
                            turns: isExpanded
                                ? 0.5
                                : 0.0, // 0.5 volta completa (180 graus)
                            duration: const Duration(milliseconds: 300),
                            child: const Icon(Icons.arrow_drop_down),
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              isExpanded = expanded;
                            });
                          },
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: ${propriedade['email']}'),
                                  Text('Telefone: ${propriedade['telefone']}'),
                                  Text('CNPJ: ${propriedade['cnpj']}'),
                                  Text('CPF: ${propriedade['cpf']}'),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Ação do botão "Ver Mais"
                                    },
                                    child: const Text('Ver Mais'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10), // Espaço entre os itens
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5), // Cor de fundo da tela
    );
  }
}
