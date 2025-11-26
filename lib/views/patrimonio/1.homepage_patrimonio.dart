import 'package:flutter/material.dart';
// import 'package:hospital/views/5.3.homepage_medicina_uci.dart';
import 'package:hospital/views/medicina/uci/equipos_uci_patrimonio.dart';
import 'package:hospital/views/medicina/emergencia/6.10.2.equipos_area_emergencia.dart';
import 'package:hospital/views/medicina/sop/6.10.3.equipos_area_sop.dart';
import 'package:hospital/views/medicina/hospitalizacion/6.10.4.equipos_area_hospitalizacion.dart';
import 'package:hospital/views/patrimonio/btn_ver_mas_areas_patrimonio.dart';
import 'package:hospital/views/patrimonio/btn_gestionar_usuario_patrimonio.dart';
import 'package:hospital/views/patrimonio/btn_registrar_equipo_patrimonio.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_image_homepage_widget.dart';
import 'package:hospital/widgets/button_option_homepage_widget.dart';

class homepagePatrimonio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Home',
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
                  //button option homepage, ahi esta esta este widget
                  OptionButton(
                    icon: Icons.monitor,
                    text: 'Registrar equipo',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => registerAreaPatrimonio(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 24),
                  OptionButton(
                    icon: Icons.manage_accounts,
                    text: 'Gestiona usuarios',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => gestionUsuarioPatrimonio(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Áreas criticas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                    imagePath: 'assets/images/area_UCI.jpg',
                    text: 'UCI',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => equiposAreaUci()),
                      );
                    },
                  ),
                  SizedBox(width: 24),
                  ImageButton(
                    imagePath: 'assets/images/area_emergencia.jpeg',
                    text: 'EMERGENCIAS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => equiposAreaEmergencia(),
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
                    imagePath: 'assets/images/area_cirugia.jpg',
                    text: 'Sala Operaciones',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => equiposAreaSop()),
                      );
                    },
                  ),
                  SizedBox(width: 24),
                  ImageButton(
                    imagePath: 'assets/images/area_Neonatologia.jpg',
                    text: 'Hospitalizacion',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => equiposAreaHospitalizacion(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => verAreaPatrimonio(),
                          ),
                        );
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
                              'Ver más areas',
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
