// models/equipo_model.dart
// import 'package:cloud_firestore/cloud_firestore.dart';

class EquipoModel {
  final String denominacion;
  final String marca;
  final String modelo;
  final String serie;
  final String codigoInterno;
  final String codigoPatrimonial;
  final String area;
  final String vidaUtil;
  final String? idEquipo;

  EquipoModel({
    required this.denominacion,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.codigoInterno,
    required this.codigoPatrimonial,
    required this.area,
    required this.vidaUtil,
    this.idEquipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'denominacion': denominacion,
      'marca': marca,
      'modelo': modelo,
      'serie': serie,
      'codigoInterno': codigoInterno,
      'codigoPatrimonial': codigoPatrimonial,
      'area': area,
      'vida_util': vidaUtil,
      'id_equipo': idEquipo,
      'creado': DateTime.now(),
    };
  }
}
