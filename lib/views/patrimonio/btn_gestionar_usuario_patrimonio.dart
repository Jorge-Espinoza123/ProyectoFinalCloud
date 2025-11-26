import 'package:flutter/material.dart';
import 'package:hospital/views/patrimonio/interface_nuevo_usuario_patrimonio.dart';
import 'package:hospital/views/patrimonio/visualizar_perfil_usuario_patrimonio.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
// import 'package:hospital/widgets/button_categoria_widget.dart';
import 'package:hospital/widgets/button_register_equipos_widget.dart';
import 'package:hospital/widgets/card_user_widget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';

// import 'package:cloud_functions/cloud_functions.dart';

// Future<void> eliminarUsuarioFirebase(String uid) async {
//   try {
//     final callable = FirebaseFunctions.instance.httpsCallable(
//       'eliminarUsuario',
//     );
//     final response = await callable.call({'uid': uid});

//     if (response.data['success'] != true) {
//       throw Exception('La eliminación falló desde la función');
//     }
//   } catch (e) {
//     print('Error en eliminarUsuarioFirebase: $e');
//     rethrow;
//   }
// }

class gestionUsuarioPatrimonio extends StatefulWidget {
  @override
  State<gestionUsuarioPatrimonio> createState() =>
      _gestionUsuarioPatrimonioState();
}

class _gestionUsuarioPatrimonioState extends State<gestionUsuarioPatrimonio> {
  TextEditingController _searchController = TextEditingController();
  String searchText = '';
  String selectedRol = '';
  @override
  Widget build(BuildContext context) {
    // TextEditingController _typeControllerRol = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Gestionar Usuarios',
          nameColorText: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  // Aquí puedes manejar la lógica de búsqueda o filtrado
                  // print('Texto buscado: $value');
                  setState(() {
                    searchText = value.toLowerCase();
                  });
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonRegisterEquipoWidget(
                      option1: 'patrimonio',
                      option2: 'mantenimiento',
                      option3: 'medicina',
                      option4: 'todo',
                      textoFondo: 'Rol',
                      typeController: (value) {
                        // _typeControllerRol.text = value!;
                        setState(() {
                          // selectedRol = value ?? '';
                          selectedRol = (value == 'todo') ? '' : value ?? '';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                      backgroundColor: Color.fromARGB(255, 6, 51, 106),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => rolNuevoUsuarioPatrimonio(),
                        ),
                      );
                    },
                    child: Text(
                      'Nuevo Usuario',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         CardUserWidget(
            //           NombreCompleto: 'Jose Diaz Suarez',
            //           user: 'JDiazS',
            //           rol: 'Patrimonio',
            //           userIcon: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => userPatrimonio(),
            //               ),
            //             );
            //           },
            //           deleteIcon: () {},
            //         ),
            //         CardUserWidget(
            //           NombreCompleto: 'Jose Diaz Suarez',
            //           user: 'JDiazS',
            //           rol: 'Patrimonio',
            //           userIcon: () {},
            //           deleteIcon: () {},
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // Expanded(
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream:
            //         FirebaseFirestore.instance
            //             .collection('hospital')
            //             .doc('Categorias')
            //             .collection('perfil_profesional')
            //             .doc('patrimonio') // cambiar dinámicamente si necesitas
            //             .collection('usuarios')
            //             .snapshots(),

            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(child: CircularProgressIndicator());
            //       }

            //       if (snapshot.hasError) {
            //         return Center(child: Text('Error al cargar usuarios'));
            //       }

            //       final docs = snapshot.data!.docs;

            //       if (docs.isEmpty) {
            //         return Center(child: Text('No hay usuarios registrados.'));
            //       }

            //       return Column(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.symmetric(vertical: 8),
            //             child: Text(
            //               'Total de usuarios: ${docs.length}',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 16,
            //               ),
            //             ),
            //           ),
            //           ...docs.map((doc) {
            //             final data = doc.data() as Map<String, dynamic>;
            //             return CardUserWidget(
            //               NombreCompleto:
            //                   '${data['nombre'] ?? ''} ${data['apellidoPaterno'] ?? ''} ${data['apellidoMaterno'] ?? ''}',
            //               user: data['usuario'] ?? 'Sin usuario',
            //               rol: data['rol'] ?? 'Sin rol',
            //               userIcon: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => userPatrimonio(),
            //                   ),
            //                 );
            //               },
            //               deleteIcon: () {
            //                 // Aquí puedes agregar la función para eliminar el usuario
            //                 doc.reference.delete();
            //               },
            //             );
            //           }).toList(),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance
                        .collectionGroup(
                          'usuarios',
                        ) // 🔍 buscará en todas las subcolecciones llamadas "usuarios"
                        .snapshots(),
                // builder: (context, snapshot) {
                //   if (snapshot.connectionState == ConnectionState.waiting) {
                //     return Center(child: CircularProgressIndicator());
                //   }

                //   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                //     return Center(child: Text('No hay usuarios registrados.'));
                //   }

                //   return ListView(
                //     children:
                //         snapshot.data!.docs.map((doc) {
                //           final data = doc.data() as Map<String, dynamic>;
                //           final nombreCompleto =
                //               '${data['nombre'] ?? ''} ${data['apellidoPaterno'] ?? ''} ${data['apellidoMaterno'] ?? ''}';

                //           return CardUserWidget(
                //             NombreCompleto: nombreCompleto.trim(),
                //             user: data['usuario'] ?? 'Sin usuario',
                //             rol: data['rol'] ?? 'Sin rol',
                //             userIcon: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder:
                //                       (context) => userPatrimonio(data: data),
                //                 ),
                //               );
                //             },
                //             deleteIcon: () {
                //               // Aquí podrías implementar la lógica para eliminar
                //             },
                //           );
                //         }).toList(),
                //   );
                // },
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No hay usuarios registrados.'));
                  }

                  // FILTRAR POR TEXTO Y ROL
                  final filteredDocs =
                      snapshot.data!.docs.where((doc) {
                        final data = doc.data() as Map<String, dynamic>;

                        final nombre =
                            (data['nombre'] ?? '').toString().toLowerCase();
                        final apellidoPaterno =
                            (data['apellidoPaterno'] ?? '')
                                .toString()
                                .toLowerCase();
                        final apellidoMaterno =
                            (data['apellidoMaterno'] ?? '')
                                .toString()
                                .toLowerCase();
                        final usuario =
                            (data['usuario'] ?? '').toString().toLowerCase();
                        final rol =
                            (data['rol'] ?? '').toString().toLowerCase();

                        final fullName =
                            '$nombre $apellidoPaterno $apellidoMaterno';

                        final matchesSearch =
                            fullName.contains(searchText.toLowerCase()) ||
                            usuario.contains(searchText.toLowerCase()) ||
                            rol.contains(searchText.toLowerCase());

                        final matchesRol =
                            selectedRol.isEmpty || rol == selectedRol;

                        return matchesSearch && matchesRol;
                      }).toList();

                  if (filteredDocs.isEmpty) {
                    return Center(
                      child: Text('No se encontraron coincidencias.'),
                    );
                  }

                  return ListView(
                    children:
                        filteredDocs.map((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final nombreCompleto =
                              '${data['nombre'] ?? ''} ${data['apellidoPaterno'] ?? ''} ${data['apellidoMaterno'] ?? ''}';

                          return CardUserWidget(
                            NombreCompleto: nombreCompleto.trim(),
                            user: data['usuario'] ?? 'Sin usuario',
                            rol: data['rol'] ?? 'Sin rol',
                            userIcon: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => userPatrimonio(data: data),
                                ),
                              );
                            },
                            deleteIcon: () async {
                              print('DATOS DEL USUARIO: $data');
                              print('UID DEL USUARIO: ${data['uid']}');

                              final confirm = await showDialog<bool>(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text('Eliminar Usuario'),
                                      content: Text(
                                        '¿Estás seguro de que deseas eliminar este usuario del sistema?',
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancelar'),
                                          onPressed:
                                              () => Navigator.of(
                                                context,
                                              ).pop(false),
                                        ),
                                        TextButton(
                                          child: Text('Eliminar'),
                                          onPressed:
                                              () => Navigator.of(
                                                context,
                                              ).pop(true),
                                        ),
                                      ],
                                    ),
                              );

                              if (confirm == true) {
                                try {
                                  await doc.reference
                                      .delete(); // Solo borra Firestore

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        ' Usuario eliminado de la base de datos.',
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('❌ Error al eliminar: $e'),
                                    ),
                                  );
                                }
                              }
                            },
                          );
                        }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
