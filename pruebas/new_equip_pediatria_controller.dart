// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class EquipoPediatriaViewModel {
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
