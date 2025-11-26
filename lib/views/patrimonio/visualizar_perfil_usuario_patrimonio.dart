// import 'package:flutter/material.dart';
// import 'package:hospital/widgets/appBar_interfaces_widget.dart';
// import 'package:hospital/widgets/button_categoria_widget.dart';
// import 'package:hospital/widgets/textField_areas_widget.dart';
// import 'package:hospital/widgets/text_areas_widget.dart';

// class userPatrimonio extends StatefulWidget {
//   // final Map<String, dynamic> data;

//   // userPatrimonio({Key? key, required this.data}) : super(key: key);

//   @override
//   State<userPatrimonio> createState() => _userPatrimonioState();
// }

// class _userPatrimonioState extends State<userPatrimonio> {
//   TextEditingController _typeControllerRol = TextEditingController();
//   TextEditingController _typeControllerArea = TextEditingController();
//   TextEditingController _nombre = TextEditingController();
//   TextEditingController _apellidoPaterno = TextEditingController();
//   TextEditingController _apellidoMaterno = TextEditingController();
//   TextEditingController _usuario = TextEditingController();
//   TextEditingController _password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: appbarInterfacesWidget(
//           nameAppbar: 'Usuario',
//           nameColorText: Colors.black,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: Icon(
//                   Icons.account_circle_outlined,
//                   size: 120,
//                   color: Color.fromARGB(255, 6, 51, 106),
//                 ),
//               ),
//               SizedBox(height: 8),
//               TextAreasWidget(nameCategoria: 'Nombre'),
//               SizedBox(height: 8),
//               TextfieldAreasWidget(
//                 nameOption: 'Insertar Nombre',
//                 typeController: _nombre,
//               ),
//               SizedBox(height: 8),
//               TextAreasWidget(nameCategoria: 'apellido paterno'),
//               SizedBox(height: 8),
//               TextfieldAreasWidget(
//                 nameOption: 'Insertar apellido paterno',
//                 typeController: _apellidoPaterno,
//               ),
//               SizedBox(height: 8),
//               TextAreasWidget(nameCategoria: 'apellido materno'),
//               SizedBox(height: 8),
//               TextfieldAreasWidget(
//                 nameOption: 'Insertar apellido materno',
//                 typeController: _apellidoMaterno,
//               ),
//               SizedBox(height: 8),
//               TextAreasWidget(nameCategoria: 'Usuario'),
//               SizedBox(height: 8),
//               TextfieldAreasWidget(
//                 nameOption: 'Insertar Usuario',
//                 typeController: _usuario,
//               ),

//               SizedBox(height: 8),
//               TextAreasWidget(nameCategoria: 'Contraseña'),
//               SizedBox(height: 8),
//               TextfieldAreasWidget(
//                 nameOption: 'Insertar Contraseña',
//                 typeController: _password,
//               ),
//               SizedBox(height: 8),
//               TextAreasWidget(nameCategoria: 'Rol'),
//               SizedBox(height: 8),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 72),
//                 child: ButtonCategoriaWidget(
//                   option1: 'patrimonio',
//                   option2: 'mantenimiento',
//                   option3: 'medicina',
//                   textoFondo: 'selecciona una opcion',
//                   typeController: (value) {
//                     _typeControllerRol.text = value!;
//                   },
//                 ),
//               ),
//               SizedBox(height: 8),
//               TextAreasWidget(nameCategoria: 'Area'),
//               SizedBox(height: 8),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 72),
//                 child: ButtonCategoriaWidget(
//                   option1: 'UCI',
//                   option2: 'Sala de Operaciones',
//                   option3: 'medicina',
//                   textoFondo: 'selecciona una opcion',
//                   typeController: (value) {
//                     _typeControllerArea.text = value!;
//                   },
//                 ),
//               ),
//               SizedBox(height: 8),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/text_areas_widget.dart';
import 'package:hospital/widgets/text_label_widget.dart';

class userPatrimonio extends StatelessWidget {
  final Map<String, dynamic> data;

  const userPatrimonio({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nombre = data['nombre'] ?? '';
    String apellidoPaterno = data['apellidoPaterno'] ?? '';
    String apellidoMaterno = data['apellidoMaterno'] ?? '';
    String usuario = data['usuario'] ?? '';
    String password = data['password'] ?? '';
    String rol = data['rol'] ?? '';
    String area = data['area'] ?? '';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Usuario',
          nameColorText: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Icon(
                  Icons.account_circle_outlined,
                  size: 120,
                  color: Color.fromARGB(255, 6, 51, 106),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 300, // limite de ancho
                  child: Column(
                    children: [
                      TextAreasWidget(nameCategoria: 'Nombre'),
                      TextLabelWidget(nameLabel: nombre),
                      TextAreasWidget(nameCategoria: 'Apellido Paterno'),
                      TextLabelWidget(nameLabel: apellidoPaterno),
                      TextAreasWidget(nameCategoria: 'Apellido Materno'),
                      TextLabelWidget(nameLabel: apellidoMaterno),
                      TextAreasWidget(nameCategoria: 'Usuario'),
                      TextLabelWidget(nameLabel: usuario),
                      TextAreasWidget(nameCategoria: 'Contraseña'),
                      TextLabelWidget(nameLabel: password),
                      TextAreasWidget(nameCategoria: 'Rol'),
                      TextLabelWidget(nameLabel: rol),
                      TextAreasWidget(nameCategoria: 'Área'),
                      TextLabelWidget(
                        nameLabel: area.isNotEmpty ? area : 'No especificado',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
