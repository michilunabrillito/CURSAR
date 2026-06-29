import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/institucion_model.dart';
import 'models/oferta_model.dart';

Future<void> seedData() async {
  final firestore = FirebaseFirestore.instance;

  final batch = firestore.batch();

  batch.set(
    firestore.collection('instituciones').doc('utn'),
    InstitucionModel(
      institucionUid: 'utn',
      nombre: 'UTN',
      descripcion: 'Universidad Tecnológica Nacional',
      direccion: 'Av. Mitre 750',
      ciudad: 'Buenos Aires',
      provincia: 'CABA',
      telefono: '011-4867-7500',
      email: 'info@utn.edu.ar',
      sitioWeb: 'https://www.utn.edu.ar',
      logoURL: '',
      estado: 'aprobada',
      createdAt: DateTime(2025, 1, 15),
    ).toMap(),
    SetOptions(merge: false),
  );

  final ofertas = [
    OfertaModel(
      ofertaId: 'oferta_utn_1',
      institucionUid: 'utn',
      nombre: 'Analista de Sistemas',
      descripcion:
          'Formación integral en análisis, diseño e implementación de sistemas informáticos. Incluye prácticas profesionalizantes en empresas del sector.',
      area: 'Tecnología',
      nivel: 'Terciario',
      duracionAnios: 3,
      modalidad: 'Presencial',
      salidaLaboral: 'Analista funcional, desarrollador, consultor TI',
      requisitos: 'Secundario completo',
      tag: 'INSCRIPCIONES ABIERTAS',
      aprobada: true,
      createdAt: DateTime(2026, 5, 10),
    ),
    OfertaModel(
      ofertaId: 'oferta_utn_2',
      institucionUid: 'utn',
      nombre: 'Ingeniería en Sistemas',
      descripcion:
          'Carrera de grado con enfoque en desarrollo de software, gestión de proyectos tecnológicos y arquitectura de sistemas.',
      area: 'Tecnología',
      nivel: 'Universitario',
      duracionAnios: 5,
      modalidad: 'Presencial',
      salidaLaboral: 'Ingeniero de software, arquitecto de sistemas, CTO',
      requisitos: 'Secundario completo. Curso de ingreso obligatorio.',
      tag: 'FECHAS IMPORTANTES',
      aprobada: true,
      createdAt: DateTime(2026, 5, 8),
    ),
    OfertaModel(
      ofertaId: 'oferta_utn_3',
      institucionUid: 'utn',
      nombre: 'Tecnicatura en Programación',
      descripcion:
          'Nueva carrera 2026. Formación rápida en desarrollo de software, bases de datos y aplicaciones web. 100% orientada a la inserción laboral.',
      area: 'Tecnología',
      nivel: 'Terciario',
      duracionAnios: 2,
      modalidad: 'Presencial',
      salidaLaboral: 'Programador junior, desarrollador web, tester QA',
      requisitos: 'Secundario completo. No requiere experiencia previa.',
      tag: 'NUEVO',
      aprobada: true,
      createdAt: DateTime(2026, 5, 15),
    ),
    OfertaModel(
      ofertaId: 'oferta_utn_4',
      institucionUid: 'utn',
      nombre: 'Ingeniería Civil',
      descripcion:
          'Formación en diseño, cálculo y construcción de obras civiles. Laboratorios equipados y convenios con empresas constructoras.',
      area: 'Ingeniería',
      nivel: 'Universitario',
      duracionAnios: 5,
      modalidad: 'Presencial',
      salidaLaboral: 'Ingeniero civil, proyectista, gerente de obra',
      requisitos: 'Secundario completo con orientación en exactas',
      tag: 'INSCRIPCIONES ABIERTAS',
      aprobada: true,
      createdAt: DateTime(2026, 5, 12),
    ),
    OfertaModel(
      ofertaId: 'oferta_utn_5',
      institucionUid: 'utn',
      nombre: 'Ingeniería Electrónica',
      descripcion:
          'Carrera orientada a sistemas embebidos, automatización industrial y telecomunicaciones. Laboratorio de microcontroladores incluido.',
      area: 'Ingeniería',
      nivel: 'Universitario',
      duracionAnios: 5,
      modalidad: 'Presencial',
      salidaLaboral: 'Ingeniero electrónico, automatizador, diseñador de hardware',
      requisitos: 'Secundario completo',
      tag: 'BECAS',
      aprobada: true,
      createdAt: DateTime(2026, 5, 6),
    ),
    OfertaModel(
      ofertaId: 'oferta_utn_6',
      institucionUid: 'utn',
      nombre: 'Licenciatura en Administración',
      descripcion:
          'Formación en gestión empresarial, recursos humanos y finanzas. Modalidad cursada flexible con horarios rotativos.',
      area: 'Administración',
      nivel: 'Universitario',
      duracionAnios: 4,
      modalidad: 'Presencial',
      salidaLaboral: 'Administrador de empresas, analista financiero, consultor',
      requisitos: 'Secundario completo',
      tag: 'FECHAS IMPORTANTES',
      aprobada: true,
      createdAt: DateTime(2026, 5, 3),
    ),
    OfertaModel(
      ofertaId: 'oferta_utn_7',
      institucionUid: 'utn',
      nombre: 'Desarrollo Web Full Stack',
      descripcion:
          'Curso de extensión universitaria. Aprendé HTML, CSS, JavaScript, React y Node.js. Proyecto final integrador con certificación UTN.',
      area: 'Tecnología',
      nivel: 'Terciario',
      duracionAnios: 1,
      modalidad: 'Virtual',
      salidaLaboral: 'Desarrollador full stack, freelancer, emprendedor digital',
      requisitos: 'Mayor de 18 años. Conocimientos básicos de computación.',
      tag: 'NUEVO',
      aprobada: true,
      createdAt: DateTime(2026, 5, 1),
    ),
  ];

  for (final oferta in ofertas) {
    batch.set(
      firestore.collection('ofertas').doc(oferta.ofertaId),
      oferta.toMap(),
      SetOptions(merge: false),
    );
  }

  await batch.commit();
}
