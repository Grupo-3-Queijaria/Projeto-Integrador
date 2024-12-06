import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart'; // Para compartilhar ou salvar PDFs

class GerarPdf extends StatelessWidget {
  const GerarPdf({Key? key}) : super(key: key);

  Future<void> loadAndSharePDF() async {
    try {
      // Carrega o PDF do assets
      final ByteData data = await rootBundle.load('assets/Indice_Teste.pdf');
      final Uint8List pdfBytes = data.buffer.asUint8List();

      // Exibe ou compartilha o PDF
      await Printing.sharePdf(bytes: pdfBytes, filename: 'Indice_Teste.pdf');
    } catch (e) {
      print('Erro ao carregar o PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download PDF Mockado'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            loadAndSharePDF(); // Chama o método para carregar e compartilhar o PDF
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          child: const Text(
            'Download PDF',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}