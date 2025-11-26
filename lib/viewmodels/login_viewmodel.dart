import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> loginUsuario({
    required String usuarioOCorreo,
    required String password,
    required String rol,
  }) async {
    try {
      String hospitalId = 'Categorias';
      CollectionReference usuariosRef = _firestore
          .collection('hospital')
          .doc(hospitalId)
          .collection('perfil_profesional')
          .doc(rol)
          .collection('usuarios');

      // Buscar usuario por correo o nombre de usuario
      QuerySnapshot query =
          await usuariosRef
              .where('rol', isEqualTo: rol)
              .where('usuario', isEqualTo: usuarioOCorreo)
              .get();

      if (query.docs.isEmpty) {
        query =
            await usuariosRef
                .where('rol', isEqualTo: rol)
                .where('email', isEqualTo: usuarioOCorreo)
                .get();
      }

      if (query.docs.isEmpty) {
        return {'error': 'Usuario no encontrado con ese rol'};
      }

      var userData = query.docs.first.data() as Map<String, dynamic>;
      String correo = userData['email'];

      // Iniciar sesión con correo y contraseña
      await _auth.signInWithEmailAndPassword(email: correo, password: password);

      return {
        'success': true,
        'rol': userData['rol'],
        'area': userData['area'] ?? '',
      };
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
