import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioMedicinaModel {
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String correo;
  final String usuario;
  final String password;
  final String area;
  final String rol;

  UsuarioMedicinaModel({
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.usuario,
    required this.password,
    required this.area,
    required this.rol,
  });

  Map<String, dynamic> toMap(String uidAuth, String docId) {
    return {
      'uid': uidAuth,
      'nombre': nombre,
      'apellidoPaterno': apellidoPaterno,
      'apellidoMaterno': apellidoMaterno,
      'usuario': usuario,
      'email': correo,
      'rol': rol,
      'area': area,
      // 'auth_uid': uidAuth,
      'id_usuario': docId,
      'password': password,
      'creado': FieldValue.serverTimestamp(),
    };
  }
}
