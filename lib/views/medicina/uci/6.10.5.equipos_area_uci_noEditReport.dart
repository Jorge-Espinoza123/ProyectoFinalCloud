import 'package:flutter/material.dart';

import 'package:hospital/views/medicina/6.11.3.datos_equipo_area_noEdit_report.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_areas_patrimonio_widget.dart';

class equiposAreaUcinoEditReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Equipos UCI',
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
                    borderRadius: BorderRadius.circular(16),
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
                                area: 'uci',
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
                    name_area: 'Ventiladores Mecanicos',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'uci',
                                tipoEquipo: 'ventilador mecanico',
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
                      'assets/images/equipo_bombaInfusion.jpg',
                      width: 400,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  cardWidget(
                    name_area: 'Bombas de Infusion',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'uci',
                                tipoEquipo: 'bomba infusion',
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
                    name_area: 'Desfribiladores',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => datosEquiposAreanoEditReport(
                                area: 'uci',
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
