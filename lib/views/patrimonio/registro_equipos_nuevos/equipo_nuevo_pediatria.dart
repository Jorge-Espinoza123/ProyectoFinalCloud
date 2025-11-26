// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/equipo_model.dart';
import 'package:hospital/viewmodels/new_equip_controller.dart';
// import '../../pruebas/new_equip_pediatria_controller.dart';
import 'package:hospital/views/patrimonio/btn_registrar_equipo_patrimonio.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_dual_option_widget.dart';
import 'package:hospital/widgets/button_register_equipos_widget.dart';
import 'package:hospital/widgets/textField_areas_widget.dart';
// import 'package:hospital/widgets/textField_fecha_widget.dart';
import 'package:hospital/widgets/textField_number_widget.dart';
import 'package:hospital/widgets/text_areas_widget.dart';

class newEquipPediatria extends StatefulWidget {
  @override
  State<newEquipPediatria> createState() => _newEquipPediatriaState();
}

class _newEquipPediatriaState extends State<newEquipPediatria> {
  TextEditingController _typeControllerEquipo = TextEditingController();
  TextEditingController _marcaController = TextEditingController();
  TextEditingController _modeloController = TextEditingController();
  TextEditingController _serieController = TextEditingController();
  TextEditingController _codigoInternoController = TextEditingController();
  TextEditingController _codigoPatrimonialController = TextEditingController();
  TextEditingController _vidaController = TextEditingController();
  // TextEditingController _ubicacion = TextEditingController();

  // final dayCtrl = TextEditingController();
  // final monthCtrl = TextEditingController();
  // final yearCtrl = TextEditingController();

  // final EquipoPediatriaViewModel _equipoPediatriaViewModel =
  //     EquipoPediatriaViewModel();

  final newEquipoViewModel _newEquipoViewModel = newEquipoViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Nuevo Equipo - Pediatria',
          nameColorText: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              TextAreasWidget(nameCategoria: 'Denominacion'),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 72, right: 72),
                child: Container(
                  height: 50,
                  child: ButtonRegisterEquipoWidget(
                    option1: 'electrocardiografo',
                    option2: 'monitor pediatrico',
                    option3: 'nebulizador',
                    option4: 'bomba infusion',
                    textoFondo: 'selecciona una opcion',
                    typeController: (value) {
                      _typeControllerEquipo.text = value!;
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Marca'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'insserta marca',
                typeController: _marcaController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Modelo'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Inserta modelo',
                typeController: _modeloController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Serie'),
              SizedBox(height: 8),
              TextfieldAreasWidget(
                nameOption: 'Inserta serie',
                typeController: _serieController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Codigo Interno'),
              SizedBox(height: 8),
              TextfieldNumberWidget(
                nameOption: 'Inserta Codigo Interno',
                typeController: _codigoInternoController,
              ),
              SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Codigo Patrimonial'),
              SizedBox(height: 8),
              TextfieldNumberWidget(
                nameOption: 'Inserta Codigo Patrimonial',
                typeController: _codigoPatrimonialController,
              ),
              SizedBox(height: 8),
              // TextAreasWidget(nameCategoria: 'Fecha de ingreso'),
              // SizedBox(height: 8),
              // TextfieldFechaWidget(
              //   dayController: dayCtrl,
              //   monthController: monthCtrl,
              //   yearController: yearCtrl,
              // ),
              // SizedBox(height: 8),
              TextAreasWidget(nameCategoria: 'Vida util estimada (años)'),

              SizedBox(height: 8),
              TextfieldNumberWidget(
                nameOption: 'Inserta vida util',
                typeController: _vidaController,
              ),
              // SizedBox(height: 8),
              // TextAreasWidget(nameCategoria: 'Ubicacion de prestamo'),
              // SizedBox(height: 8),
              // TextfieldAreasWidget(
              //   nameOption: 'Inserta ubicacion',
              //   typeController: _ubicacion,
              // ),
              SizedBox(height: 24),
              dualOption(
                nameOption1: 'Cancelar',
                nameOption2: 'Guardar',
                onPressedButton1: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => registerAreaPatrimonio(),
                    ),
                  );
                },
                onPressedButton2: () async {
                  // String? docId = await _equipoPediatriaViewModel
                  //     .registrarEquipo(
                  //       hospitalId: 'Categorias',
                  //       area: 'pediatria',
                  //       denominacion: _typeControllerEquipo.text,
                  //       marca: _marcaController.text,
                  //       modelo: _modeloController.text,
                  //       serie: _serieController.text,
                  //       codigoInterno: _codigoInternoController.text,
                  //       codigoPatrimonial: _codigoPatrimonialController.text,
                  //       vidaUtil: _vidaController.text,
                  //     );
                  final equipo = EquipoModel(
                    denominacion: _typeControllerEquipo.text,
                    marca: _marcaController.text,
                    modelo: _modeloController.text,
                    serie: _serieController.text,
                    codigoInterno: _codigoInternoController.text,
                    codigoPatrimonial: _codigoPatrimonialController.text,
                    area: 'pediatria',
                    vidaUtil: _vidaController.text,
                  );
                  String? docId = await _newEquipoViewModel.registrarEquipo(
                    hospitalId: 'Categorias',
                    equipo: equipo,
                  );

                  if (docId != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Equipo registrado como $docId")),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => registerAreaPatrimonio(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error al registrar el equipo")),
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
