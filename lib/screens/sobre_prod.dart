import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProdutorScreen(),
    );
  }
}

class ProdutorScreen extends StatelessWidget {
  final CollectionReference produtorRef =
      FirebaseFirestore.instance.collection('produtores');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: produtorRef.doc('ID_DO_PRODUTOR').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os dados'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Produtor não encontrado'));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;
          String nomeQueijaria = data['nomeQueijaria'] ?? 'Nome da Queijaria';
          String nomeProduto = data['nomeProduto'] ?? 'Nome do Produto';
          String status = data['status'] ? 'ATIVO' : 'INATIVO';
          List<String> tecnologias = List<String>.from(data['tecnologias'] ?? []);

          return SingleChildScrollView(
            child: Column(
              children: [
                // Navbar e Título
                Container(
                  width: 430,
                  height: 56,
                  color: Color(0xFF0D2838),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () {},
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 32,
                        height: 32,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 409,
                  height: 54,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Color(0xFF9D8E61)),
                  ),
                  child: Center(
                    child: Text(
                      nomeQueijaria,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9D8E61),
                      ),
                    ),
                  ),
                ),
                // Detalhes e Foto do Produtor
                Container(
                  width: 378,
                  height: 822,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Color(0xFF9D8E61)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 319,
                        height: 37,
                        decoration: BoxDecoration(
                          color: Color(0xFF0D2838),
                          borderRadius: BorderRadius.circular(19.5),
                        ),
                        child: Center(
                          child: Text(
                            nomeProduto,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          """
SOBRE O PRODUTOR:
Status: $status
Raças: ${data['racas'] ?? 'N/A'}
Funcionários: ${data['funcionarios'] ?? 'N/A'}

ENDEREÇO:
Logradouro: ${data['logradouro'] ?? 'N/A'}
Bairro: ${data['bairro'] ?? 'N/A'}
Rua: ${data['rua'] ?? 'N/A'}
CEP: ${data['cep'] ?? 'N/A'}
Cidade: ${data['cidade'] ?? 'N/A'}
Número: ${data['numero'] ?? 'N/A'}
UF: ${data['uf'] ?? 'N/A'}
                          """,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      
                      // Lista de Tecnologias
                      SizedBox(height: 24),
                      Text(
                        'Tecnologias',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: tecnologias.map((tec) {
                          return Container(
                            width: 106,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF273C4E)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tec,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.code, size: 16), // Placeholder para a imagem
                              ],
                            ),
                          );
                        }).toList(),
                      ),

                      // Botões de ação
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton('APCBRH', Icons.article),
                          _buildButton('CONTRATO', Icons.description),
                        ],
                      ),

                      // Placeholder para o gráfico
                      SizedBox(height: 24),
                      Container(
                        width: 300,
                        height: 200,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text('Gráfico aqui'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Função auxiliar para criar botões com ícones e textos
  Widget _buildButton(String label, IconData icon) {
    return Container(
      width: 166.53,
      height: 28.05,
      decoration: BoxDecoration(
        color: Color(0xFF0D2838),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
