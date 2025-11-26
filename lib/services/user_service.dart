// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hospital/models/user_model.dart';

// class UsuarioService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<String?> registrarUsuario({required UsuarioModel usuario}) async {
//     try {
//       // 1. Crear usuario en Firebase Auth
//       UserCredential cred = await _auth.createUserWithEmailAndPassword(
//         email: usuario.correo,
//         password: usuario.password,
//       );

//       final String uid = cred.user!.uid;
//       final String hospitalId = 'Categorias';

//       // 2. Referencia a colección
//       CollectionReference userRef = _firestore
//           .collection('hospital')
//           .doc(hospitalId)
//           .collection('perfil_profesional')
//           .doc(usuario.rol)
//           .collection('usuarios');

//       // 3. Generar nuevo ID incremental
//       // QuerySnapshot snapshot = await userRef.get();
//       // int count = snapshot.docs.length + 1;
//       // String docId = 'usuario_${count.toString().padLeft(2, '0')}';

//       final String docId = await generarDocIdUnico(userRef);

//       // 4. Subir datos
//       await userRef.doc(docId).set({
//         ...usuario.toMap(authUid: uid, idUsuario: docId),
//         'creado': FieldValue.serverTimestamp(), // para precisión de tiempo
//       });

//       return docId;
//     } catch (e) {
//       return 'ERROR: ${e.toString()}';
//     }
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hospital/models/user_model.dart';

// class UsuarioService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // ✅ Función para generar ID único con formato usuario_01, usuario_02, etc.
//   Future<String> generarDocIdUnico(CollectionReference userRef) async {
//     int index = 1;
//     while (true) {
//       String docId = 'usuario_${index.toString().padLeft(2, '0')}';
//       final doc = await userRef.doc(docId).get();
//       if (!doc.exists) {
//         return docId;
//       }
//       index++;
//     }
//   }

//   // ✅ Método principal para registrar usuario
//   Future<String?> registrarUsuario({required UsuarioModel usuario}) async {
//     try {
//       // 1. Crear usuario en Firebase Auth
//       UserCredential cred = await _auth.createUserWithEmailAndPassword(
//         email: usuario.correo,
//         password: usuario.password,
//       );

//       final String uid = cred.user!.uid;
//       final String hospitalId = 'Categorias';

//       // 2. Referencia a colección Firestore
//       CollectionReference userRef = _firestore
//           .collection('hospital')
//           .doc(hospitalId)
//           .collection('perfil_profesional')
//           .doc(usuario.rol)
//           .collection('usuarios');

//       // 3. Obtener un ID único disponible
//       final String docId = await generarDocIdUnico(userRef);

//       // 4. Guardar en Firestore
//       await userRef.doc(docId).set({
//         ...usuario.toMap(authUid: uid, idUsuario: docId),
//         'creado': FieldValue.serverTimestamp(),
//       });

//       return docId;
//     } catch (e) {
//       return 'ERROR: ${e.toString()}';
//     }
//   }
// }

// Future<String> generarDocIdUnico(CollectionReference userRef) async {
//   int index = 1;
//   while (true) {
//     String docId = 'usuario_${index.toString().padLeft(2, '0')}';
//     final doc = await userRef.doc(docId).get();
//     if (!doc.exists) {
//       return docId;
//     }
//     index++;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hospital/models/user_model.dart';

class UsuarioService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  // ✅ Constructor que acepta instancias falsas o reales
  UsuarioService({FirebaseAuth? auth, FirebaseFirestore? firestore})
    : _auth = auth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  // ✅ Función para generar ID único con formato usuario_01, usuario_02, etc.
  Future<String> generarDocIdUnico(CollectionReference userRef) async {
    int index = 1;
    while (true) {
      String docId = 'usuario_${index.toString().padLeft(2, '0')}';
      final doc = await userRef.doc(docId).get();
      if (!doc.exists) {
        return docId;
      }
      index++;
    }
  }

  // ✅ Método principal para registrar usuario
  Future<String?> registrarUsuario({required UsuarioModel usuario}) async {
    try {
      // 1. Crear usuario en Firebase Auth
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: usuario.correo,
        password: usuario.password,
      );

      final String uid = cred.user!.uid;
      final String hospitalId = 'Categorias';

      // 2. Referencia a colección Firestore
      CollectionReference userRef = _firestore
          .collection('hospital')
          .doc(hospitalId)
          .collection('perfil_profesional')
          .doc(usuario.rol)
          .collection('usuarios');

      // 3. Obtener un ID único disponible
      final String docId = await generarDocIdUnico(userRef);

      // 4. Guardar en Firestore
      await userRef.doc(docId).set({
        ...usuario.toMap(authUid: uid, idUsuario: docId),
        'creado': FieldValue.serverTimestamp(),
      });

      return docId;
    } catch (e) {
      return 'ERROR: ${e.toString()}';
    }
  }
}

// 🔹 Si esta función no se usa externamente, puedes eliminarla o dejarla aquí.
Future<String> generarDocIdUnico(CollectionReference userRef) async {
  int index = 1;
  while (true) {
    String docId = 'usuario_${index.toString().padLeft(2, '0')}';
    final doc = await userRef.doc(docId).get();
    if (!doc.exists) {
      return docId;
    }
    index++;
  }
}
