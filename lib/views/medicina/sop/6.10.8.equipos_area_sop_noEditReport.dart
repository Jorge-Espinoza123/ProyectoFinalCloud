import 'package:flutter/material.dart';
import 'package:hospital/views/medicina/6.11.3.datos_equipo_area_noEdit_report.dart';

import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_areas_patrimonio_widget.dart';

class equiposAreaSopnoEditReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Equipos Sala de Operaciones',
          nameColorText: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Cambia 16 al valor deseado
                    child: Image.asset(
                      'assets/images/equipo_lamparaCielitica.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Lampara Cielitica',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'sop',
                                tipoEquipo: 'lampara cielitica',
                              ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Cambia 16 al valor deseado
                    child: Image.asset(
                      'assets/images/equipo_equipoAnestesia.png',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Maquina Anestesia',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'sop',
                                tipoEquipo: 'equipo de anestesia',
                              ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Cambia 16 al valor deseado
                    child: Image.asset(
                      'assets/images/equipo_cunaRadiante.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Cuna Radiante',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'sop',
                                tipoEquipo: 'cuna radiante',
                              ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Cambia 16 al valor deseado
                    child: Image.asset(
                      'assets/images/equipo_electrocauterio.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Electrocauterio',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'sop',
                                tipoEquipo: 'electrocauterio',
                              ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
