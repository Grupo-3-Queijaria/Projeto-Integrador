import 'package:flutter/material.dart';
import '../../controllers/tecnologia_controller.dart';
import '../../models/tecnologia_model.dart';
import 'add_tecnologia_view.dart';
import 'edit_tecnologia_view.dart';

class TecnologiaListView extends StatelessWidget {
  final TecnologiaController controller = TecnologiaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tecnologias'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddTecnologiaView()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Tecnologia>>(
        stream: controller.listarTecnologias(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Tecnologia> tecnologias = snapshot.data!;

          return ListView.builder(
            itemCount: tecnologias.length,
            itemBuilder: (context, index) {
              Tecnologia tecnologia = tecnologias[index];
              return ListTile(
                title: Text(tecnologia.tipo),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Raça: ${tecnologia.racaBovina}'),
                    Text('Quantidade de Leite: ${tecnologia.qtdLeite}'),
                    Text('Data: ${tecnologia.data.toIso8601String()}'),
                    Text('Observação: ${tecnologia.observacao}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditTecnologiaView(
                              tecnologia: tecnologia,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        controller.deletarTecnologia(tecnologia.id!.toString());
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
