// import 'package:flutter_test/flutter_test.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:hospital/models/datos_equipo_model.dart';

// void main() {
//   test('Crea correctamente un objeto desde Firestore', () async {
//     final fakeFirestore = FakeFirebaseFirestore();
//     final docRef = await fakeFirestore.collection('equipos').add({
//       'denominacion': 'Monitor',
//       'marca': 'Philips',
//       'modelo': 'MX200',
//     });

//     final snapshot = await docRef.get();
//     final model = DatosEquipoModel.fromFirestore(snapshot);

//     expect(model.denominacion, 'Monitor');
//   });
// }

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

// Suponiendo tu modelo:
class DatosEquipoModel {
  final String id_equipo;
  final String denominacion;
  final String marca;
  final String modelo;

  DatosEquipoModel({
    required this.id_equipo,
    required this.denominacion,
    required this.marca,
    required this.modelo,
  });

  factory DatosEquipoModel.fromFirestore(Map<String, dynamic> data) {
    return DatosEquipoModel(
      id_equipo: data['id_equipo'] ?? '',
      denominacion: data['denominacion'] ?? '',
      marca: data['marca'] ?? '',
      modelo: data['modelo'] ?? '',
    );
  }
}

void main() {
  group('DatosEquipoModel - Pruebas de Firestore', () {
    test('Crea correctamente un objeto desde Firestore', () async {
      final fakeFirestore = FakeFirebaseFirestore();

      // Simulamos un documento de equipo
      await fakeFirestore
          .collection('hospital')
          .doc('categorias')
          .collection('areas_hospital')
          .doc('uci')
          .collection('equipos')
          .doc('equipo_01')
          .set({
            'id_equipo': '12345',
            'denominacion': 'Monitor multiparámetro',
            'marca': 'Philips',
            'modelo': 'IntelliVue MX550',
          });

      final snapshot =
          await fakeFirestore
              .collection('hospital')
              .doc('categorias')
              .collection('areas_hospital')
              .doc('uci')
              .collection('equipos')
              .doc('equipo_01')
              .get();

      final datos = DatosEquipoModel.fromFirestore(snapshot.data()!);

      expect(datos.id_equipo, '12345');
      expect(datos.marca, 'Philips');
      expect(datos.modelo, 'IntelliVue MX550');
    });
  });
}
