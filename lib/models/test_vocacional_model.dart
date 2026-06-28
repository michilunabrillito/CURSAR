class PreguntaModel {
  final String preguntaId;
  final String texto;
  final List<String> opciones;

  PreguntaModel({
    required this.preguntaId,
    required this.texto,
    required this.opciones,
  });

  factory PreguntaModel.fromMap(String id, Map<String, dynamic> map) {
    return PreguntaModel(
      preguntaId: id,
      texto: map['texto'] ?? '',
      opciones: List<String>.from(map['opciones'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'preguntaId': preguntaId,
      'texto': texto,
      'opciones': opciones,
    };
  }
}

class RespuestaModel {
  final String respuestaId;
  final String userUid;
  final String preguntaId;
  final String opcionSeleccionada;
  final DateTime? createdAt;

  RespuestaModel({
    required this.respuestaId,
    required this.userUid,
    required this.preguntaId,
    required this.opcionSeleccionada,
    this.createdAt,
  });

  factory RespuestaModel.fromMap(String id, Map<String, dynamic> map) {
    return RespuestaModel(
      respuestaId: id,
      userUid: map['userUid'] ?? '',
      preguntaId: map['preguntaId'] ?? '',
      opcionSeleccionada: map['opcionSeleccionada'] ?? '',
      createdAt: (map['createdAt'] as dynamic)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'respuestaId': respuestaId,
      'userUid': userUid,
      'preguntaId': preguntaId,
      'opcionSeleccionada': opcionSeleccionada,
      'createdAt': createdAt,
    };
  }
}

class ResultadoModel {
  final String resultadoId;
  final String userUid;
  final String areaInteres;
  final List<String> ofertasRecomendadas;
  final DateTime? createdAt;

  ResultadoModel({
    required this.resultadoId,
    required this.userUid,
    required this.areaInteres,
    required this.ofertasRecomendadas,
    this.createdAt,
  });

  factory ResultadoModel.fromMap(String id, Map<String, dynamic> map) {
    return ResultadoModel(
      resultadoId: id,
      userUid: map['userUid'] ?? '',
      areaInteres: map['areaInteres'] ?? '',
      ofertasRecomendadas: List<String>.from(map['ofertasRecomendadas'] ?? []),
      createdAt: (map['createdAt'] as dynamic)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resultadoId': resultadoId,
      'userUid': userUid,
      'areaInteres': areaInteres,
      'ofertasRecomendadas': ofertasRecomendadas,
      'createdAt': createdAt,
    };
  }
}
