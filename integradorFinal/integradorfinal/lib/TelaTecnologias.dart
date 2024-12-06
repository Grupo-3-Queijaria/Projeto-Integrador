import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SobreProdutor.dart';


class Propriedade {
  final int idPropriedade;
  final String nomePropriedade;
  final String nomeProdutor;
  final List<String> tecnologias;

  Propriedade({
    required this.idPropriedade,
    required this.nomePropriedade,
    required this.nomeProdutor,
    required this.tecnologias,
  });

  factory Propriedade.fromJson(Map<String, dynamic> json) {
    return Propriedade(
      idPropriedade: json['idPropriedade'],
      nomePropriedade: json['nomePropriedade'],
      nomeProdutor: json['nomeProdutor'],
      tecnologias: json['tecnologia']
          .toString()
          .split(',')
          .map((e) => e.trim())
          .toList(),
    );
  }
}


class TecnologiaScreen extends StatefulWidget {
  @override
  _TecnologiaScreenState createState() => _TecnologiaScreenState();
}

class _TecnologiaScreenState extends State<TecnologiaScreen> {
  Map<String, List<Propriedade>> tecnologiasMap = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPropriedades();
  }

  Future<void> fetchPropriedades() async {
    try {
      final response = await http.get(Uri.parse(
          'https://23ce-177-72-31-253.ngrok-free.app/api/propriedades'), headers: {'ngrok-skip-browser-warning': 'true'});
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        Map<String, List<Propriedade>> tempMap = {};
        for (var item in data) {
          Propriedade propriedade = Propriedade.fromJson(item);
          for (String tecnologia in propriedade.tecnologias) {
            if (!tempMap.containsKey(tecnologia)) {
              tempMap[tecnologia] = [];
            }
            tempMap[tecnologia]!.add(propriedade);
          }
        }

        setState(() {
          tecnologiasMap = tempMap;
          isLoading = false;
        });
      } else {
        throw Exception('Erro ao carregar propriedades');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Erro: $e');
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFF0D2838),
      title: Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: Image.asset(
          'assets/queijos-finos.png',
          height: 45,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: tecnologiasMap.entries.map((entry) {
                return TecnologiaCard(
                  tecnologia: entry.key,
                  propriedades: entry.value,
                );
              }).toList(),
            ),
    );
  }
}

class TecnologiaCard extends StatefulWidget {
  final String tecnologia;
  final List<Propriedade> propriedades;

  TecnologiaCard({required this.tecnologia, required this.propriedades});

  @override
  _TecnologiaCardState createState() => _TecnologiaCardState();
}

class _TecnologiaCardState extends State<TecnologiaCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Color(0xFF9D8E61)),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          children: [
            ListTile(
             leading: Image.asset(
  'assets/queijo.png', 
  width: 40, 
  height: 40, 
),
              title: Text(
                widget.tecnologia,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D2838),
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Esconder propriedades' : 'Ver propriedades',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.propriedades
                      .map((propriedade) => GestureDetector(
                            onTap: () {
                              final idPropriedade = propriedade.idPropriedade;
                              if (idPropriedade != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SobreProdutor(idPropriedade: idPropriedade), // Tela já existente
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('ID da propriedade não encontrado!'),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              '- ${propriedade.nomePropriedade} (${propriedade.nomeProdutor})',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
