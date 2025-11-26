import 'package:flutter/material.dart';
import 'package:hospital/models/login_model.dart';
import 'package:hospital/viewmodels/login_viewmodel.dart';
// import 'package:hospital/views/4.navigation_pages.dart';
import 'package:hospital/widgets/button_categoria_widget.dart';
import 'package:hospital/widgets/textField_areas_widget.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _typeControllerRol = TextEditingController();
  TextEditingController _usuario = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //circunferencia parte superior
          ClipPath(
            clipper: topClipper(),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 0, 224, 223),
                    Color.fromARGB(255, 35, 136, 224),
                  ],
                ),
              ),
            ),
          ),
          //circunferencia parte inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomClipper(),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 0, 224, 223),
                      Color.fromARGB(255, 35, 136, 224),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Imagen en la parte superior
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),

                  Image.asset(
                    'assets/images/logo_medicPersonal.png',
                    width: 300,
                  ),
                ],
              ),
            ),
          ),

          //Imagen en la parte inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),

                  Image.asset('assets/images/logo_MedTech.png', width: 100),
                  Text(
                    'MedTech',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          //Contenido para Login
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextfieldAreasWidget(
                  nameOption: 'Ingrese Usuario',
                  typeController: _usuario,
                ),
                SizedBox(height: 20),
                TextfieldAreasWidget(
                  nameOption: 'Contraseña',
                  typeController: _password,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 72, right: 72),
                  child: Container(
                    height: 50,
                    child: ButtonCategoriaWidget(
                      option1: 'patrimonio',
                      option2: 'mantenimiento',
                      option3: 'medicina',
                      textoFondo: 'seleccione',
                      typeController: (value) {
                        _typeControllerRol.text = value!;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 6, 51, 106),
                  ),
                  onPressed: () async {
                    final viewModel = LoginViewModel();
                    final resultado = await viewModel.loginUsuario(
                      usuarioOCorreo: _usuario.text.trim(),
                      password: _password.text.trim(),
                      rol: _typeControllerRol.text.trim().toLowerCase(),
                    );

                    if (resultado['error'] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${resultado['error']}")),
                      );
                      return;
                    }

                    final rol = resultado['rol'];
                    final area = (resultado['area'] ?? '').toLowerCase();

                    // Redireccionar por rol y área
                    if (rol == 'patrimonio') {
                      Navigator.pushReplacementNamed(context, '/patrimonio');
                    } else if (rol == 'mantenimiento') {
                      Navigator.pushReplacementNamed(context, '/mantenimiento');
                    } else if (rol == 'medicina') {
                      if (area == 'uci') {
                        Navigator.pushReplacementNamed(context, '/medicinaUci');
                      } else if (area == 'sala de operaciones') {
                        Navigator.pushReplacementNamed(context, '/medicinaSop');
                      } else if (area == 'neonatologia') {
                        Navigator.pushReplacementNamed(
                          context,
                          '/medicinaNeonatologia',
                        );
                      } else if (area == 'hospitalizacion') {
                        Navigator.pushReplacementNamed(
                          context,
                          '/medicinaHospitalizacion',
                        );
                      } else if (area == 'emergencia') {
                        Navigator.pushReplacementNamed(
                          context,
                          '/medicinaEmergencia',
                        );
                      } else if (area == 'pediatria' || area == 'pediatría') {
                        Navigator.pushReplacementNamed(
                          context,
                          '/medicinaPediatria',
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Área médica no válida: $area"),
                          ),
                        );
                      }
                    }
                  },

                  child: Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hospital/widgets/button_categoria_widget.dart';
// import 'package:hospital/widgets/textField_areas_widget.dart';

// class loginPage extends StatefulWidget {
//   const loginPage({super.key});

//   @override
//   State<loginPage> createState() => _loginPageState();
// }

// class _loginPageState extends State<loginPage> {
//   TextEditingController _typeControllerRol = TextEditingController();
//   TextEditingController _usuario = TextEditingController();
//   TextEditingController _password = TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           // Circunferencia parte superior
//           ClipPath(
//             clipper: topClipper(),
//             child: Container(
//               height: 250,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [
//                     Color.fromARGB(255, 0, 224, 223),
//                     Color.fromARGB(255, 35, 136, 224),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Circunferencia parte inferior
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ClipPath(
//               clipper: BottomClipper(),
//               child: Container(
//                 height: 150,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(255, 0, 224, 223),
//                       Color.fromARGB(255, 35, 136, 224),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Imagen superior
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               height: 350,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 30),
//                   Image.asset(
//                     'assets/images/logo_medicPersonal.png',
//                     width: 300,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Imagen inferior
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 160,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 20),
//                   Image.asset('assets/images/logo_MedTech.png', width: 100),
//                   Text(
//                     'MedTech',
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//           // Contenido de login
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100),
//                 Text(
//                   'Iniciar Sesión',
//                   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 TextfieldAreasWidget(
//                   nameOption: 'Ingrese Usuario (correo)',
//                   typeController: _usuario,
//                 ),
//                 SizedBox(height: 20),
//                 TextfieldAreasWidget(
//                   nameOption: 'Contraseña',
//                   typeController: _password,
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 72, right: 72),
//                   child: Container(
//                     height: 50,
//                     child: ButtonCategoriaWidget(
//                       option1: 'patrimonio',
//                       option2: 'mantenimiento',
//                       option3: 'medicina',
//                       textoFondo: 'seleccione',
//                       typeController: (value) {
//                         _typeControllerRol.text = value!;
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 6, 51, 106),
//                   ),
//                   onPressed: () async {
//                     final email = _usuario.text.trim();
//                     final password = _password.text.trim();
//                     final rol = _typeControllerRol.text.trim().toLowerCase();

//                     if (email.isEmpty || password.isEmpty || rol.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Todos los campos son obligatorios"),
//                         ),
//                       );
//                       return;
//                     }

//                     try {
//                       // Login con Firebase Auth
//                       UserCredential userCredential = await _auth
//                           .signInWithEmailAndPassword(
//                             email: email,
//                             password: password,
//                           );

//                       final uid = userCredential.user!.uid;

//                       // Obtener información de Firestore
//                       final userQuery =
//                           await _firestore
//                               .collection('hospital')
//                               .doc('Categorias')
//                               .collection('perfil_profesional')
//                               .where('uid', isEqualTo: uid)
//                               .get();

//                       if (userQuery.docs.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("Usuario no encontrado en Firestore"),
//                           ),
//                         );
//                         return;
//                       }

//                       final userDoc = userQuery.docs.first;
//                       final area =
//                           (userDoc['area'] ?? '').toString().toLowerCase();

//                       // Redireccionar según rol y área
//                       if (rol == 'patrimonio') {
//                         Navigator.pushReplacementNamed(context, '/patrimonio');
//                       } else if (rol == 'mantenimiento') {
//                         Navigator.pushReplacementNamed(
//                           context,
//                           '/mantenimiento',
//                         );
//                       } else if (rol == 'medicina') {
//                         switch (area) {
//                           case 'uci':
//                             Navigator.pushReplacementNamed(
//                               context,
//                               '/medicinaUci',
//                             );
//                             break;
//                           case 'sala de operaciones':
//                             Navigator.pushReplacementNamed(
//                               context,
//                               '/medicinaSop',
//                             );
//                             break;
//                           case 'neonatologia':
//                             Navigator.pushReplacementNamed(
//                               context,
//                               '/medicinaNeonatologia',
//                             );
//                             break;
//                           case 'hospitalizacion':
//                             Navigator.pushReplacementNamed(
//                               context,
//                               '/medicinaHospitalizacion',
//                             );
//                             break;
//                           case 'emergencia':
//                             Navigator.pushReplacementNamed(
//                               context,
//                               '/medicinaEmergencia',
//                             );
//                             break;
//                           case 'pediatria':
//                           case 'pediatría':
//                             Navigator.pushReplacementNamed(
//                               context,
//                               '/medicinaPediatria',
//                             );
//                             break;
//                           default:
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text("Área médica no válida: $area"),
//                               ),
//                             );
//                         }
//                       }
//                     } on FirebaseAuthException catch (e) {
//                       String mensaje = '';
//                       if (e.code == 'user-not-found') {
//                         mensaje = 'Usuario no encontrado';
//                       } else if (e.code == 'wrong-password') {
//                         mensaje = 'Contraseña incorrecta';
//                       } else {
//                         mensaje = 'Error: ${e.message}';
//                       }
//                       ScaffoldMessenger.of(
//                         context,
//                       ).showSnackBar(SnackBar(content: Text(mensaje)));
//                     }
//                   },
//                   child: Text(
//                     'Ingresar',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Clipper superior
// class topClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height - 50,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// // Clipper inferior
// class BottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, 50);
//     path.quadraticBezierTo(size.width / 2, 0, size.width, 50);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
