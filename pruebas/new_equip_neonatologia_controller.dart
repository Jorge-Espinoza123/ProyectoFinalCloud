// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class EquipoNeonatologiaViewModel {
//   Future<String?> registrarEquipo({
//     required String hospitalId,
//     required String area,
//     required String denominacion,
//     required String marca,
//     required String modelo,
//     required String serie,
//     required String codigoInterno,
//     required String codigoPatrimonial,
//     required String vidaUtil,
//   }) async {
//     try {
//       final CollectionReference rolCollection = FirebaseFirestore.instance
//           .collection('hospital')
//           .doc(hospitalId)
//           .collection('areas_hospital')
//           .doc(area)
//           .collection('equipos');

//       // Obtener cantidad de documentos para generar ID
//       final QuerySnapshot snapshot = await rolCollection.get();
//       final int count = snapshot.docs.length + 1;
//       final String docId = 'equipo_${count.toString().padLeft(2, '0')}';

//       // Guardar equipo en Firestore
//       await rolCollection.doc(docId).set({
//         'denominacion': denominacion,
//         'marca': marca,
//         'modelo': modelo,
//         'serie': serie,
//         'codigoInterno': codigoInterno,
//         'codigoPatrimonial': codigoPatrimonial,
//         'area': area,
//         'vida_util': vidaUtil,
//         'id_equipo': docId,
//         'creado': FieldValue.serverTimestamp(),
//       });

//       return docId;
//     } catch (e) {
//       debugPrint('Error al registrar equipo: $e');
//       return null;
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hospital/models/equipo_model.dart';
// import 'package:hospital/services/equipo_service.dart';

// class EquipoNeonatologiaViewModel {
//   final EquipoService _service = EquipoService();

//   Future<String?> registrarEquipo({
//     required String hospitalId,
//     required EquipoModel equipo,
//   }) async {
//     try {
//       return await _service.registrarEquipo(
//         hospitalId: hospitalId,
//         equipo: equipo,
//       );
//     } catch (e) {
//       debugPrint('Error en ViewModel: $e');
//       return null;
//     }
//   }
// }
