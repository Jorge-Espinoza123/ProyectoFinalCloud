// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';

// class UserMedViewModel {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<String?> registrarUsuarioMedicina({
//     required String nombre,
//     required String apellidoPaterno,
//     required String apellidoMaterno,
//     required String correo,
//     required String usuario,
//     required String password,
//     required String area,
//   }) async {
//     try {
//       // Crear usuario con Auth
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: correo, password: password);

//       String uidAuth = userCredential.user!.uid;

//       String hospitalId = 'Categorias';
//       String rol = 'medicina';

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

import '../models/user_medicina_model.dart';
import '../services/user_medicina_service.dart';

class UserMedViewModel {
  final UsuarioMedicinaService _usuarioService = UsuarioMedicinaService();

  Future<String?> registrarUsuario(UsuarioMedicinaModel usuario) async {
    return await _usuarioService.registrarUsuario(usuario);
  }
}
