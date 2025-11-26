// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserMantViewModel {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<String?> registrarUsuario({
//     required String nombre,
//     required String apellidoPaterno,
//     required String apellidoMaterno,
//     required String correo,
//     required String usuario,
//     required String password,
//     required String area,
//     required String rol,
//   }) async {
//     try {
//       // Crear usuario en Firebase Auth
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

//       await rolCollection.doc(docId).set({
//         'nombre': nombre,
//         'apellidoPaterno': apellidoPaterno,
//         'apellidoMaterno': apellidoMaterno,
//         'usuario': usuario,
//         'email': correo,
//         'rol': rol,
//         'area': area,
//         'auth_uid': uidAuth,
//         'id_usuario': docId,
//         'password': password,
//         'creado': FieldValue.serverTimestamp(),
//       });

//       return docId;
//     } catch (e) {
//       return 'ERROR: ${e.toString()}';
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:hospital/models/user_model.dart';
import 'package:hospital/services/user_service.dart';

class UserMantViewModel {
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
