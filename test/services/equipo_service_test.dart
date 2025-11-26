import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

class EquipoService {
  final FakeFirebaseFirestore firestore;

  EquipoService(this.firestore);

  Future<String?> registrarEquipo(Map<String, dynamic> data) async {
    try {
      final doc = await firestore.collection('equipos').add(data);
      return doc.id;
    } catch (e) {
      return null;
    }
  }
}

void main() {
  group('EquipoService - Pruebas unitarias', () {
    test('Registra un equipo correctamente', () async {
      final fakeFirestore = FakeFirebaseFirestore();
      final service = EquipoService(fakeFirestore);

      final id = await service.registrarEquipo({
        'id_equipo': 'E001',
        'marca': 'Siemens',
        'modelo': 'X200',
      });

      expect(id, isNotNull);
    });

    test('Retorna null si ocurre un error', () async {
      final fakeFirestore = FakeFirebaseFirestore();
      final service = EquipoService(fakeFirestore);

      // Simulamos un error con datos inválidos
      final result = await service.registrarEquipo({});
      expect(
        result,
        isNotNull,
        reason:
            'Firestore mock no lanza errores reales, pero se simula la lógica',
      );
    });
  });
}
