import 'package:flutter/material.dart';
import 'package:hospital/models/equipo_model.dart';
import 'package:hospital/services/equipo_service.dart';

class newEquipoViewModel {
  final EquipoService _service = EquipoService();

  Future<String?> registrarEquipo({
    required String hospitalId,
    required EquipoModel equipo,
  }) async {
    try {
      return await _service.registrarEquipo(
        hospitalId: hospitalId,
        equipo: equipo,
      );
    } catch (e) {
      debugPrint('Error en ViewModel: $e');
      return null;
    }
  }
}
