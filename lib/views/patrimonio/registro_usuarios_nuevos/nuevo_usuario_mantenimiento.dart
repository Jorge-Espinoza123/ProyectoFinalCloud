import 'package:flutter/material.dart';
import 'package:hospital/models/user_model.dart';
import 'package:hospital/viewmodels/new_user_mant_viewmodel.dart';
import 'package:hospital/views/patrimonio/btn_gestionar_usuario_patrimonio.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';

import 'package:hospital/widgets/button_dual_option_widget.dart';
import 'package:hospital/widgets/textField_areas_widget.dart';
import 'package:hospital/widgets/text_areas_widget.dart';

class newUserMantenimiento extends StatefulWidget {
  @override
  State<newUserMantenimiento> createState() => _newUserMantenimientoState();
}

class _newUserMantenimientoState extends State<newUserMantenimiento> {
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
          nameAppbar: 'Nuevo Usuario Mantenimiento',
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
                  // final resultado = await viewModel.registrarUsuario(
                  //   nombre: _nombreController.text,
                  //   apellidoPaterno: _apellidoPaternoController.text,
                  //   apellidoMaterno: _apellidoMaternoController.text,
                  //   correo: _correoController.text,
                  //   usuario: _usuarioController.text,
                  //   password: _passwordController.text,
                  //   area: _typeControllerArea.text,
                  //   rol: 'mantenimiento',
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
                    rol: 'mantenimiento',
                  );

                  final viewModel = UserMantViewModel();
                  final resultado = await viewModel.registrarUsuario(usuario);

                  if (resultado != null && resultado.startsWith('usuario_')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Usuario registrado como $resultado en mantenimiento",
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
