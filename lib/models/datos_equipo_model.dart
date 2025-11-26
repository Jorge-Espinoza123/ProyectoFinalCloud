import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DatosEquipoModel {
  final String idEquipo;
  final String denominacion;
  final String? marca;
  final String? modelo;
  final String? codigoInterno;
  final String? codigoPatrimonial;
  final int? vidaUtil;
  final String area;
  final Timestamp? creado;
  final DocumentReference? reference;

  DatosEquipoModel({
    required this.idEquipo,
    required this.denominacion,
    required this.area,
    this.marca,
    this.modelo,
    this.codigoInterno,
    this.codigoPatrimonial,
    this.vidaUtil,
    this.creado,
    this.reference,
  });

  factory DatosEquipoModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DatosEquipoModel(
      idEquipo: data['id_equipo'] ?? '',
      denominacion: data['denominacion'] ?? '',
      area: data['area'] ?? '',
      marca: data['marca'],
      modelo: data['modelo'],
      codigoInterno: data['codigoInterno'],
      codigoPatrimonial: data['codigoPatrimonial'],
      vidaUtil:
          data['vida_util'] is int
              ? data['vida_util']
              : int.tryParse(data['vida_util']?.toString() ?? ''),
      creado: data['creado'],
      reference: doc.reference,
    );
  }

  String get fechaIngresoFormateada {
    if (creado == null) return '';
    final DateTime fecha = creado!.toDate();
    return DateFormat.yMMMMd('es').add_jm().format(fecha);
  }
}
