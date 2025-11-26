class UsuarioModel {
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String correo;
  final String usuario;
  final String password;
  // final String area;
  final String rol;

  UsuarioModel({
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.usuario,
    required this.password,
    // required this.area,
    required this.rol,
  });

  Map<String, dynamic> toMap({
    required String authUid,
    required String idUsuario,
  }) {
    return {
      'uid': authUid,
      'nombre': nombre,
      'apellidoPaterno': apellidoPaterno,
      'apellidoMaterno': apellidoMaterno,
      'usuario': usuario,
      'email': correo,
      'rol': rol,
      // 'area': area,
      // 'auth_uid': authUid,
      'id_usuario': idUsuario,
      'password': password,
      'creado': DateTime.now(),
    };
  }
}
