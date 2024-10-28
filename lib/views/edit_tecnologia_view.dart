import 'package:flutter/material.dart';
import '../../controllers/tecnologia_controller.dart';
import '../../models/tecnologia_model.dart';

class EditTecnologiaView extends StatelessWidget {
  final Tecnologia tecnologia;
  final _formKey = GlobalKey<FormState>();
  final TecnologiaController controller = TecnologiaController();

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _racaBovinaController = TextEditingController();
  final TextEditingController _qtdLeiteController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();

  EditTecnologiaView({required this.tecnologia}) {
    _tipoController.text = tecnologia.tipo;
    _racaBovinaController.text = tecnologia.racaBovina;
    _qtdLeiteController.text = tecnologia.qtdLeite.toString();
    _dataController.text = tecnologia.data.toIso8601String();
    _observacaoController.text = tecnologia.observacao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Tecnologia'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                    final tecnologiaAtualizada = Tecnologia(
                      id: tecnologia.id,
                      tipo: _tipoController.text,
                      racaBovina: _racaBovinaController.text,
                      qtdLeite: int.parse(_qtdLeiteController.text),
                      data: DateTime.parse(_dataController.text),
                      observacao: _observacaoController.text,
                    );
                    controller.atualizarTecnologia(
                        tecnologia.id!.toString(), tecnologiaAtualizada);
                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
