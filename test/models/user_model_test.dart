import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/models/user_model.dart';

void main() {
  group('UsuarioModel', () {
    test('toMap incluye los campos esperados', () {
      final usuario = UsuarioModel(
        nombre: 'Ana',
        apellidoPaterno: 'Garcia',
        apellidoMaterno: 'Lopez',
        correo: 'ana@example.com',
        usuario: 'anag',
        password: 'password123',
        rol: 'mantenimiento',
      );

      final map = usuario.toMap(authUid: 'uid_fake', idUsuario: 'usuario_01');

      expect(map['nombre'], 'Ana');
      expect(map['apellidoPaterno'], 'Garcia');
      expect(map['email'], 'ana@example.com');
      expect(map['rol'], 'mantenimiento');
      expect(map['uid'], 'uid_fake');
      expect(map['id_usuario'], 'usuario_01');
      expect(map.containsKey('creado'), true);
    });
  });
}
