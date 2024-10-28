import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tecnologia_model.dart';

class TecnologiaController {
  final CollectionReference tecnologiasCollection =
      FirebaseFirestore.instance.collection('tecnologias');

  // Função para adicionar uma nova tecnologia
  Future<void> adicionarTecnologia(Tecnologia tecnologia) async {
    await tecnologiasCollection.add(tecnologia.toJson());
  }

  // Função para atualizar uma tecnologia existente
  Future<void> atualizarTecnologia(String id, Tecnologia tecnologia) async {
    await tecnologiasCollection.doc(id).update(tecnologia.toJson());
  }

  // Função para deletar uma tecnologia
  Future<void> deletarTecnologia(String id) async {
    await tecnologiasCollection.doc(id).delete();
  }

  // Função para listar as tecnologias em tempo real usando um Stream
  Stream<List<Tecnologia>> listarTecnologias() {
    return tecnologiasCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Tecnologia.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
