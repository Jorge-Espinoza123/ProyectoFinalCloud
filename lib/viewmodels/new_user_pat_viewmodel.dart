// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserPatViewModel {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<String?> registrarUsuario({
//     required String nombre,
//     required String apellidoPaterno,
//     required String apellidoMaterno,
//     required String correo,
//     required String usuario,
//     required String password,
//     required String rol,
//     String? area, // El área puede ser nula para patrimonio
//   }) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: correo, password: password);

//       String uidAuth = userCredential.user!.uid;
//       String hospitalId = 'Categorias';

//       CollectionReference rolCollection = FirebaseFirestore.instance
//           .collection('hospital')
//           .doc(hospitalId)
//           .collection('perfil_profesional')
//           .doc(rol)
//           .collection('usuarios');

//       QuerySnapshot snapshot = await rolCollection.get();
//       int count = snapshot.docs.length + 1;
//       String docId = 'usuario_${count.toString().padLeft(2, '0')}';

//       Map<String, dynamic> userData = {
//         'nombre': nombre,
//         'apellidoPaterno': apellidoPaterno,
//         'apellidoMaterno': apellidoMaterno,
//         'usuario': usuario,
//         'email': correo,
//         'rol': rol,
//         'auth_uid': uidAuth,
//         'id_usuario': docId,
//         'password': password,
//         'creado': FieldValue.serverTimestamp(),
//       };
//       if (area != null && area.isNotEmpty) {
//         userData['area'] = area;
//       }

//       // ⚠️ 5. Guardar en Firestore (esto te faltaba)
//       await rolCollection.doc(docId).set(userData);

//       return docId;
//     } catch (e) {
//       return 'ERROR: ${e.toString()}';
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:hospital/models/user_model.dart';
import 'package:hospital/services/user_service.dart';

class UserPatViewModel {
  final UsuarioService _service = UsuarioService();

  Future<String?> registrarUsuario(UsuarioModel usuario) async {
    try {
      return await _service.registrarUsuario(usuario: usuario);
    } catch (e) {
      debugPrint('Error en UsuarioViewModel: $e');
      return null;
    }
  }
}
