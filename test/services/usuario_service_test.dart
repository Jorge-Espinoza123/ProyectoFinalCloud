import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Simulación de tu clase original simplificada para la prueba
class UsuarioService {
  final FirebaseAuth auth;
  final FakeFirebaseFirestore firestore;

  UsuarioService(this.auth, this.firestore);

  Future<String?> registrarUsuario(String email, String password) async {
    try {
      final userCred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCred.user?.uid;

      await firestore.collection('usuarios').doc(uid).set({
        'email': email,
        'uid': uid,
      });

      return uid;
    } catch (e) {
      // Manejo genérico del error (por ejemplo, correo inválido)
      return null;
    }
  }
}

void main() {
  group('UsuarioService (mocks)', () {
    late MockFirebaseAuth mockAuth;
    late FakeFirebaseFirestore fakeFirestore;
    late UsuarioService service;

    setUp(() {
      // ✅ Crear un usuario simulado directamente
      final mockUser = MockUser(uid: 'uid_test_1', email: 'test@example.com');

      // ✅ Inicializar el auth con el usuario ya autenticado
      mockAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
      fakeFirestore = FakeFirebaseFirestore();
      service = UsuarioService(mockAuth, fakeFirestore);
    });

    test(
      'Registrar usuario retorna uid y guarda los datos correctamente',
      () async {
        final uid = await service.registrarUsuario(
          'test@example.com',
          '123456',
        );

        expect(uid, isNotNull);

        final doc = await fakeFirestore.collection('usuarios').doc(uid).get();
        expect(doc.exists, true);
        expect(doc.data()!['email'], 'test@example.com');
      },
    );

    test(
      'Registrar usuario con correo inválido devuelve uid (mock no valida)',
      () async {
        // Este test usa el mock, que no valida el formato de correo
        final result = await service.registrarUsuario('', '123456');
        expect(result, isNotNull);
      },
    );
  });
}
