class OfertaModel {
  final String ofertaId;
  final String institucionUid;
  final String nombre;
  final String descripcion;
  final String area;
  final String nivel;
  final int duracionAnios;
  final String modalidad;
  final String salidaLaboral;
  final String requisitos;
  final String tag;
  final bool aprobada;
  final DateTime? createdAt;

  OfertaModel({
    required this.ofertaId,
    required this.institucionUid,
    required this.nombre,
    required this.descripcion,
    required this.area,
    required this.nivel,
    required this.duracionAnios,
    required this.modalidad,
    required this.salidaLaboral,
    required this.requisitos,
    required this.tag,
    this.aprobada = false,
    this.createdAt,
  });

  factory OfertaModel.fromMap(String id, Map<String, dynamic> map) {
    return OfertaModel(
      ofertaId: id,
      institucionUid: map['institucionUid'] ?? '',
      nombre: map['nombre'] ?? '',
      descripcion: map['descripcion'] ?? '',
      area: map['area'] ?? '',
      nivel: map['nivel'] ?? '',
      duracionAnios: map['duracionAnios'] ?? 0,
      modalidad: map['modalidad'] ?? '',
      salidaLaboral: map['salidaLaboral'] ?? '',
      requisitos: map['requisitos'] ?? '',
      tag: map['tag'] ?? '',
      aprobada: map['aprobada'] ?? false,
      createdAt: (map['createdAt'] as dynamic)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ofertaId': ofertaId,
      'institucionUid': institucionUid,
      'nombre': nombre,
      'descripcion': descripcion,
      'area': area,
      'nivel': nivel,
      'duracionAnios': duracionAnios,
      'modalidad': modalidad,
      'salidaLaboral': salidaLaboral,
      'requisitos': requisitos,
      'tag': tag,
      'aprobada': aprobada,
      'createdAt': createdAt,
    };
  }
}
