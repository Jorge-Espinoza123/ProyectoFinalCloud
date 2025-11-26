import 'package:flutter/material.dart';
import 'package:hospital/views/patrimonio/registro_equipos_nuevos/equipo_nuevo_sop.dart';
import 'package:hospital/views/patrimonio/registro_equipos_nuevos/equipo_nuevo_uci.dart';
import 'package:hospital/views/patrimonio/registro_equipos_nuevos/equipo_nuevo_emergencia.dart';
import 'package:hospital/views/patrimonio/registro_equipos_nuevos/equipo_nuevo_hospitalizacion.dart';
import 'package:hospital/views/patrimonio/registro_equipos_nuevos/equipo_nuevo_pediatria.dart';
import 'package:hospital/views/patrimonio/registro_equipos_nuevos/equipo_nuevo_neonatologia.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_areas_patrimonio_widget.dart';

class registerAreaPatrimonio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Areas',
          nameColorText: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'UCI',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => newEquipUci()),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'SALA DE OPERACIONES',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => newEquipSop()),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'EMERGENCIA',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newEquipEmergencia(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'HOSPITALIZACION',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newEquipHospitalizacion(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'PEDIATRIA',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newEquipPediatria(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'NEONATOLOGIA',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newEquipNeonatologia(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(name_area: 'GINECO OBSTETRICIA', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'TRAUMATOLOGIA', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'CARDIOLOGIA', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'ONCOLOGIA', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'RADIOLOGIA', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'LABORATORIO CLINICO', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'FARMACIA', onPressed: () {}),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
