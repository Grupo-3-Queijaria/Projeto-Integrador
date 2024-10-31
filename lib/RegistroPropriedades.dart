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
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    child: ListTile(
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
                    trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Ação ao clicar em cada item
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