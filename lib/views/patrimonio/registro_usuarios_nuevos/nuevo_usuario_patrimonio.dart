import 'package:flutter/material.dart';
import 'package:hospital/models/user_model.dart';
import 'package:hospital/viewmodels/new_user_pat_viewmodel.dart';
import 'package:hospital/views/patrimonio/btn_gestionar_usuario_patrimonio.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';

import 'package:hospital/widgets/button_dual_option_widget.dart';
import 'package:hospital/widgets/textField_areas_widget.dart';
import 'package:hospital/widgets/text_areas_widget.dart';

class newUserPatrimonio extends StatefulWidget {
  @override
  State<newUserPatrimonio> createState() => _newUserPatrimonioState();
}

class _newUserPatrimonioState extends State<newUserPatrimonio> {
  // TextEditingController _typeControllerRol = TextEditingController();
  // TextEditingController _typeControllerArea = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidoPaternoController = TextEditingController();
  TextEditingController _apellidoMaternoController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Nuevo Usuario Patrimonio',
          nameColorText: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 120,
                  color: Color.fromARGB(255, 6, 51, 106),
                ),
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Nombre'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Insertar Nombre',
                typeController: _nombreController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'apellido paterno'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Insertar apellido paterno',
                typeController: _apellidoPaternoController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'apellido materno'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Insertar apellido materno',
                typeController: _apellidoMaternoController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'correo'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Insertar correo',
                typeController: _correoController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Usuario'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Insertar Usuario',
                typeController: _usuarioController,
              ),

              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Contraseña'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Insertar Contraseña',
                typeController: _passwordController,
              ),
              // SizedBox(height: 8),
              // TextAreasWidget(nameCategoria: 'Rol'),
              // SizedBox(height: 8),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 72),
              //   child: ButtonCategoriaWidget(
              //     option1: 'patrimonio',
              //     option2: 'mantenimiento',
              //     option3: 'medicina',
              //     textoFondo: 'selecciona una opcion',
              //     typeController: (value) {
              //       _typeControllerRol.text = value!;
              //     },
              //   ),
              // ),
              // SizedBox(height: 8),
              // TextAreasWidget(nameCategoria: 'Area'),
              // SizedBox(height: 8),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 72),
              //   child: ButtonCategoriaWidget(
              //     option1: 'UCI',
              //     option2: 'Sala de Operaciones',
              //     option3: 'medicina',
              //     textoFondo: 'selecciona una opcion',
              //     typeController: (value) {
              //       _typeControllerArea.text = value!;
              //     },
              //   ),
              // ),
              SizedBox(height: 24),

              dualOption(
                nameOption1: 'Cancelar',
                nameOption2: 'Registrar',
                onPressedButton1: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => gestionUsuarioPatrimonio(),
                    ),
                  );
                },
                onPressedButton2: () async {
                  // try {
                  //   // Crear usuario con Auth
                  //   UserCredential userCredential = await _firebaseAuth
                  //       .createUserWithEmailAndPassword(
                  //         email: _correoController.text,
                  //         password: _passwordController.text,
                  //       );

                  //   String uidAuth = userCredential.user!.uid;

                  //   String hospitalId = 'Categorias';
                  //   // String rol = _typeControllerRol.text.trim().toLowerCase();

                  //   // if (rol.isEmpty ||
                  //   //     !(rol == 'medicina' ||
                  //   //         rol == 'mantenimiento' ||
                  //   //         rol == 'patrimonio')) {
                  //   //   ScaffoldMessenger.of(context).showSnackBar(
                  //   //     SnackBar(
                  //   //       content: Text("Rol inválido o no seleccionado"),
                  //   //     ),
                  //   //   );
                  //   //   return;
                  //   // }
                  //   String rol = 'patrimonio';

                  //   // Colección específica según el rol
                  //   CollectionReference rolCollection = FirebaseFirestore
                  //       .instance
                  //       .collection('hospital')
                  //       .doc(hospitalId)
                  //       .collection('perfil_profesional')
                  //       .doc(rol)
                  //       .collection('usuarios');

                  //   // Obtener cantidad de usuarios en esa colección
                  //   QuerySnapshot snapshot = await rolCollection.get();
                  //   int count = snapshot.docs.length + 1;
                  //   String docId =
                  //       'usuario_${count.toString().padLeft(2, '0')}';

                  //   // Guardar en Firestore
                  //   await rolCollection.doc(docId).set({
                  //     'nombre': _nombreController.text,
                  //     'apellidoPaterno': _apellidoPaternoController.text,
                  //     'apellidoMaterno': _apellidoMaternoController.text,
                  //     'usuario': _usuarioController.text,
                  //     'email': _correoController.text,
                  //     'rol': rol,
                  //     // 'area': _typeControllerArea.text,
                  //     'auth_uid': uidAuth,
                  //     'id_usuario': docId,
                  //     'creado': FieldValue.serverTimestamp(),
                  //   });

                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text("Usuario registrado como $docId en $rol"),
                  //     ),
                  //   );
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => gestionUsuarioPatrimonio(),
                  //     ),
                  //   );
                  // } catch (e) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text("Error: ${e.toString()}")),
                  //   );
                  // }

                  // final viewModel = UserPatViewModel();

                  // final resultado = await viewModel.registrarUsuario(
                  //   nombre: _nombreController.text,
                  //   apellidoPaterno: _apellidoPaternoController.text,
                  //   apellidoMaterno: _apellidoMaternoController.text,
                  //   correo: _correoController.text,
                  //   usuario: _usuarioController.text,
                  //   password: _passwordController.text,
                  //   rol: 'patrimonio',
                  //   // area: '', // Si no aplica para este rol
                  // );
                  final usuario = UsuarioModel(
                    nombre: _nombreController.text,
                    apellidoPaterno: _apellidoPaternoController.text,
                    apellidoMaterno: _apellidoMaternoController.text,
                    correo: _correoController.text,
                    usuario: _usuarioController.text,
                    password: _passwordController.text,
                    // area:
                    //     _typeControllerArea
                    //         .text, // este campo lo tienes vacío, ¡ojo!
                    rol: 'patrimonio',
                  );

                  final viewModel = UserPatViewModel();
                  final resultado = await viewModel.registrarUsuario(usuario);

                  if (resultado != null && resultado.startsWith('usuario_')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Usuario registrado como $resultado en patrimonio",
                        ),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => gestionUsuarioPatrimonio(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: $resultado")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
