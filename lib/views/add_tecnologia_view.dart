import 'package:flutter/material.dart';
import '../../controllers/tecnologia_controller.dart';
import '../../models/tecnologia_model.dart';

class AddTecnologiaView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TecnologiaController controller = TecnologiaController();

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _racaBovinaController = TextEditingController();
  final TextEditingController _qtdLeiteController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tecnologia'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _tipoController,
                  decoration: InputDecoration(labelText: 'Tipo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o tipo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _racaBovinaController,
                  decoration: InputDecoration(labelText: 'Raça Bovina'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a raça bovina';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _qtdLeiteController,
                  decoration: InputDecoration(labelText: 'Quantidade de Leite'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade de leite';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dataController,
                  decoration: InputDecoration(labelText: 'Data'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _observacaoController,
                  decoration: InputDecoration(labelText: 'Observação'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final novaTecnologia = Tecnologia(
                        tipo: _tipoController.text,
                        racaBovina: _racaBovinaController.text,
                        qtdLeite: int.parse(_qtdLeiteController.text),
                        data: DateTime.parse(_dataController.text),
                        observacao: _observacaoController.text,
                      );

                      controller.adicionarTecnologia(novaTecnologia);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
