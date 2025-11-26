// // viewmodels/equipo_hospitalizacion_viewmodel.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hospital/models/equipo_model.dart';

// class EquipoHospitalizacionViewModel {
//   Future<String?> registrarEquipo({
//     required String hospitalId,
//     required EquipoModel equipo,
//   }) async {
//     try {
//       final CollectionReference rolCollection = FirebaseFirestore.instance
//           .collection('hospital')
//           .doc(hospitalId)
//           .collection('areas_hospital')
//           .doc(equipo.area)
//           .collection('equipos');

//       // Obtener cantidad de documentos para generar ID
//       final QuerySnapshot snapshot = await rolCollection.get();
//       final int count = snapshot.docs.length + 1;
//       final String docId = 'equipo_${count.toString().padLeft(2, '0')}';

//       // Guardar equipo en Firestore
//       await rolCollection.doc(docId).set({
//         ...equipo.toMap(),
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

// class EquipoHospitalizacionViewModel {
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
