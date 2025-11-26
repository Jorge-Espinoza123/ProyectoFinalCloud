import 'package:flutter/material.dart';
import 'package:hospital/views/medicina/uci/equipos_uci_patrimonio.dart';
import 'package:hospital/views/medicina/emergencia/6.10.2.equipos_area_emergencia.dart';
import 'package:hospital/views/medicina/sop/6.10.3.equipos_area_sop.dart';
import 'package:hospital/views/medicina/hospitalizacion/6.10.4.equipos_area_hospitalizacion.dart';
import 'package:hospital/views/mantenimiento/btn_fallas_reportadas_mantenimiento.dart';
import 'package:hospital/views/mantenimiento/btn_mantenimiento_mantenimiento.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_image_homepage_widget.dart';
import 'package:hospital/widgets/button_option_homepage_widget.dart';

class homepageMantenimiento extends StatelessWidget {
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
                  OptionButton(
                    icon: Icons.build,
                    text: 'Mantenimiento',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mantenimientoArea(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 24),
                  OptionButton(
                    icon: Icons.report_problem_outlined,
                    text: 'Fallas reportadas',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FallasReportadasView(),
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
                    text: 'SALA OPERACIONES',
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
                    text: 'HOSPITALIZACION',
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
            ],
          ),
        ),
      ),
    );
  }
}
