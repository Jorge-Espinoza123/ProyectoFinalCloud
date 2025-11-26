import 'package:flutter/material.dart';
import 'package:hospital/views/medicina/datos_equipo_area_general.dart';
import 'package:hospital/views/mantenimiento/6.11.4.datos_equipos_area_mantenimiento.dart';

import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_areas_patrimonio_widget.dart';

class mantenimientoAreaEmergencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Equipos Emergencia',
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
                    name_area: 'Monitor Multiparametro',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreaMantenimiento(
                                area: 'emergencia',
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
                      'assets/images/equipo_ventiladorMecanico.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Ventilador Mecanico',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreaMantenimiento(
                                area: 'emergencia',
                                tipoEquipo: 'ventilador mecanico portatil',
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
                              (context) => datosEquiposAreaMantenimiento(
                                area: 'emergencia',
                                tipoEquipo: 'oximetro de pulso portatil',
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
                      'assets/images/equipo_desfibrilador.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Desfibrilador',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreaMantenimiento(
                                area: 'emergencia',
                                tipoEquipo: 'desfibrilador',
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
