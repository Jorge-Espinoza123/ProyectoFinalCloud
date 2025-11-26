import 'package:flutter/material.dart';
import 'package:hospital/views/medicina/emergencia/6.10.6.equipos_area_emergencia_noEditReport.dart';
import 'package:hospital/views/medicina/6.11.2.datos_equipo_area_noEdit.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_image_homepage_widget.dart';

class homepageMedicinaEmergencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Home - Emergencia',
          nameColorText: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),

          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 110,
                      ),
                      backgroundColor: Color.fromARGB(255, 225, 69, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => equiposAreaEmergencianoEditReport(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.report_problem_outlined,
                          size: 48.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Reportar Falla',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Equipos de UCI',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                    imagePath: 'assets/images/equipo_monitorMultiparametro.jpg',
                    text: 'Monitores',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DatosEquiposAreaNoEdit(
                                area: 'emergencia',
                                tipoEquipo: 'monitor multiparametro',
                              ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 24),
                  ImageButton(
                    imagePath: 'assets/images/equipo_oximetro.jpg',
                    text: 'Oximetro',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DatosEquiposAreaNoEdit(
                                area: 'emergencia',
                                tipoEquipo: 'oximetro de pulso portatil',
                              ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                    imagePath: 'assets/images/equipo_ventiladorMecanico.jpg',
                    text: 'ventiladores',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DatosEquiposAreaNoEdit(
                                area: 'emergencia',
                                tipoEquipo: 'ventilador mecanico portatil',
                              ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 24),
                  ImageButton(
                    imagePath: 'assets/images/equipo_desfibrilador.jpg',
                    text: 'Desfibrilador',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DatosEquiposAreaNoEdit(
                                area: 'emergencia',
                                tipoEquipo: 'desfibrilador',
                              ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),

              Row(
                children: [
                  SizedBox(
                    width: 200,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      onPressed: () {
                        print('momita');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_services_outlined,
                            size: 24.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8.0),
                          Flexible(
                            child: Text(
                              'Ver más equipos',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
