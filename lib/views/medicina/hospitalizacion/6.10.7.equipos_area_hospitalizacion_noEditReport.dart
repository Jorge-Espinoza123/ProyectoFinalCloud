import 'package:flutter/material.dart';
import 'package:hospital/views/medicina/6.11.3.datos_equipo_area_noEdit_report.dart';

import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_areas_patrimonio_widget.dart';

class equiposAreaHospitalizacionnoEditReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Equipos Hospitalizacion',
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
                      'assets/images/equipo_monitorMultiparametro.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Monitores Multiparametros',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'hospitalizacion',
                                tipoEquipo: 'monitor multiparametro',
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
                      'assets/images/equipo_mezcladorGases.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Mezclador de Gases',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'hospitalizacion',
                                tipoEquipo: 'mezclador de gases',
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
                      'assets/images/equipo_oximetro.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Oximetro',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'hospitalizacion',
                                tipoEquipo: 'oximetro de pulso de mesa',
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
                      'assets/images/equipo_bombaNutricion.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Bomba de Nutricion Enteral',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'hospitalizacion',
                                tipoEquipo: 'bomba de nutricion enteral',
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
