// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/user_medicina_model.dart';

// class UsuarioMedicinaService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<String?> registrarUsuario(UsuarioMedicinaModel usuario) async {
//     try {
//       // 1. Crear en Firebase Auth
//       UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(
//             email: usuario.correo,
//             password: usuario.password,
//           );

//       String uidAuth = userCredential.user!.uid;

//       // 2. Obtener número consecutivo para docId
//       CollectionReference usuariosRef = _firestore
//           .collection('hospital')
//           .doc('Categorias')
//           .collection('perfil_profesional')
//           .doc(usuario.rol)
//           .collection('usuarios');

//       QuerySnapshot snapshot = await usuariosRef.get();
//       int count = snapshot.docs.length + 1;
//       String docId = 'usuario_${count.toString().padLeft(2, '0')}';

//       // 3. Registrar en Firestore
//       await usuariosRef.doc(docId).set(usuario.toMap(uidAuth, docId));

//       return docId;
//     } catch (e) {
//       return 'ERROR: ${e.toString()}';
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_medicina_model.dart';

class UsuarioMedicinaService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registrarUsuario(UsuarioMedicinaModel usuario) async {
    try {
      CollectionReference usuariosRef = _firestore
          .collection('hospital')
          .doc('Categorias')
          .collection('perfil_profesional')
          .doc(usuario.rol)
          .collection('usuarios');

      // --- VALIDAR CORREO ---
      final correoQuery =
          await usuariosRef.where('email', isEqualTo: usuario.correo).get();
      if (correoQuery.docs.isNotEmpty) {
        return 'ERROR: El correo ya está registrado';
      }

      // --- VALIDAR USUARIO ---
      final usuarioQuery =
          await usuariosRef.where('usuario', isEqualTo: usuario.usuario).get();
      if (usuarioQuery.docs.isNotEmpty) {
        return 'ERROR: El nombre de usuario ya está en uso';
      }

      // --- CREAR EN AUTH ---
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: usuario.correo,
            password: usuario.password,
          );
      String uidAuth = userCredential.user!.uid;

      // --- OBTENER ÚLTIMO ID ---
      QuerySnapshot lastDoc =
          await usuariosRef
              .orderBy('id_usuario', descending: true)
              .limit(1)
              .get();

      int nextIdNumber = 1;

      if (lastDoc.docs.isNotEmpty) {
        String lastId = lastDoc.docs.first['id_usuario'];
        nextIdNumber = int.parse(lastId.split('_')[1]) + 1;
      }

      String docId = 'usuario_${nextIdNumber.toString().padLeft(2, '0')}';

      // --- GUARDAR EN FIRESTORE ---
      await usuariosRef.doc(docId).set(usuario.toMap(uidAuth, docId));

      return docId;
    } catch (e) {
      return 'ERROR: ${e.toString()}';
    }
  }
}
