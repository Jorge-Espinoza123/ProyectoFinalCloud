import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/viewmodels/datos_equipo_viewmodel.dart';
import 'package:hospital/models/datos_equipo_model.dart';

// Mock del servicio
class MockDatosEquipoService {
  Future<List<DatosEquipoModel>> fetchEquipos(
    String area,
    String tipoEquipo,
  ) async {
    return [
      DatosEquipoModel(
        idEquipo: 'eq_01',
        denominacion: 'Bomba de Infusión',
        area: area,
      ),
    ];
  }
}

void main() {
  test('fetchEquipos carga correctamente los datos', () async {
    final viewModel = DatosEquipoViewModel('UCI', 'Bomba');
    viewModel.equipos = [
      DatosEquipoModel(idEquipo: 'eq_01', denominacion: 'Bomba', area: 'UCI'),
    ];

    expect(viewModel.equipos.isNotEmpty, true);
    expect(viewModel.equipos.first.denominacion, 'Bomba');
  });
}
