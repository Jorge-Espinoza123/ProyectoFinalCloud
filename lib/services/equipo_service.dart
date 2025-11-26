// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hospital/models/equipo_model.dart';

// class EquipoService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<String?> registrarEquipo({
//     required String hospitalId,
//     required EquipoModel equipo,
//   }) async {
//     try {
//       final CollectionReference rolCollection = _firestore
//           .collection('hospital')
//           .doc(hospitalId)
//           .collection('areas_hospital')
//           .doc(equipo.area)
//           .collection('equipos');

//       // Obtener cantidad de documentos para generar un ID
//       final QuerySnapshot snapshot = await rolCollection.get();
//       final int count = snapshot.docs.length + 1;
//       final String docId = 'equipo_${count.toString().padLeft(2, '0')}';

//       await rolCollection.doc(docId).set({
//         ...equipo.toMap(),
//         'id_equipo': docId,
//         'creado': FieldValue.serverTimestamp(),
//       });

//       return docId;
//     } catch (e) {
//       debugPrint('Error en EquipoService.registrarEquipo: $e');
//       return null;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hospital/models/equipo_model.dart';

class EquipoService {
  final FirebaseFirestore firestore;

  EquipoService({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  Future<String?> registrarEquipo({
    required String hospitalId,
    required EquipoModel equipo,
  }) async {
    try {
      final CollectionReference rolCollection = firestore
          .collection('hospital')
          .doc(hospitalId)
          .collection('areas_hospital')
          .doc(equipo.area)
          .collection('equipos');

      final QuerySnapshot snapshot = await rolCollection.get();
      final int count = snapshot.docs.length + 1;
      final String docId = 'equipo_${count.toString().padLeft(2, '0')}';

      await rolCollection.doc(docId).set({
        ...equipo.toMap(),
        'id_equipo': docId,
        'creado': FieldValue.serverTimestamp(),
      });

      return docId;
    } catch (e) {
      debugPrint('Error en EquipoService.registrarEquipo: $e');
      return null;
    }
  }
}
