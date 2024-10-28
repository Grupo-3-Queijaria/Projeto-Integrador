import 'package:flutter/material.dart';

class TecnologiasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Título
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Color(0xFF9D8E61)),
              ),
              child: Center(
                child: Text(
                  'tecnologias',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Kaisei Decol',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9D8E61),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), 
            Expanded(
              child: ListView.builder(
                itemCount: 5, 
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      width: 378,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 16),
                          // Substitui o ícone pelo uso da imagem "queijo.png"
                          Image.asset(
                            'assets/images/queijo.png',
                            width: 32,
                            height: 32,
                            color: Color(0xFF9D8E61),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: 79,
                            height: 1,
                            color: Color(0xFF9D8E61),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nome da Tecnologia',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Kaisei Decol',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF9D8E61),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: 152.95,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0D2838),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Center(
                                  child: Text(
                                    'ver produtores',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
