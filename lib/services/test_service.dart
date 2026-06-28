import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/test_vocacional_model.dart';

class TestService {
  CollectionReference _testRef(String subcol) =>
      FirebaseFirestore.instance
          .collection('testVocacional')
          .doc('data')
          .collection(subcol);

  Future<List<PreguntaModel>> obtenerPreguntas() async {
    final snapshot = await _testRef('preguntas').get();
    return snapshot.docs
        .map((doc) =>
            PreguntaModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> guardarRespuesta(RespuestaModel respuesta) async {
    await _testRef('respuestas')
        .doc(respuesta.respuestaId)
        .set(respuesta.toMap());
  }

  Future<void> guardarResultado(ResultadoModel resultado) async {
    await _testRef('resultados')
        .doc(resultado.resultadoId)
        .set(resultado.toMap());
  }

  Future<List<ResultadoModel>> obtenerResultados(String userUid) async {
    final snapshot =
        await _testRef('resultados').where('userUid', isEqualTo: userUid).get();
    return snapshot.docs
        .map((doc) =>
            ResultadoModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }
}
