import 'package:flutter/material.dart';
import '../models/datos_equipo_model.dart';
import '../services/datos_equipo_service.dart';

class DatosEquipoViewModel extends ChangeNotifier {
  final String area;
  final String tipoEquipo;
  final DatosEquipoService _equipoService = DatosEquipoService();

  bool isLoading = false;
  List<DatosEquipoModel> equipos = [];

  DatosEquipoViewModel(this.area, this.tipoEquipo);

  Future<void> fetchEquipos() async {
    isLoading = true;
    notifyListeners();

    equipos = await _equipoService.fetchEquipos(area, tipoEquipo);

    isLoading = false;
    notifyListeners();
  }
}
