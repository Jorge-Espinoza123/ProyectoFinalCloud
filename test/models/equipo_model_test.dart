import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/models/equipo_model.dart';

void main() {
  group('EquipoModel', () {
    test('Convierte correctamente a mapa', () {
      final equipo = EquipoModel(
        denominacion: 'Electrocardiógrafo',
        marca: 'Philips',
        modelo: 'ECG-100',
        serie: '12345',
        codigoInterno: 'INT-001',
        codigoPatrimonial: 'PAT-001',
        area: 'UCI',
        vidaUtil: '10',
      );

      final map = equipo.toMap();

      expect(map['denominacion'], 'Electrocardiógrafo');
      expect(map['marca'], 'Philips');
      expect(map['vida_util'], '10');
    });
  });
}
