import 'package:flutter/material.dart';
import 'package:hospital/views/medicina/uci/equipos_uci_patrimonio.dart';
import 'package:hospital/views/medicina/emergencia/6.10.2.equipos_area_emergencia.dart';
import 'package:hospital/views/medicina/sop/6.10.3.equipos_area_sop.dart';
import 'package:hospital/views/medicina/hospitalizacion/6.10.4.equipos_area_hospitalizacion.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_areas_patrimonio_widget.dart';

class verAreaPatrimonio extends StatelessWidget {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => equiposAreaUci()),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'SALA DE OPERACIONES',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => equiposAreaSop()),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'EMERGENCIA',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => equiposAreaEmergencia(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(
                  name_area: 'HOSPITALIZACION',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => equiposAreaHospitalizacion(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                cardWidget(name_area: 'PEDIATRIA', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'NEONATOLOGIA', onPressed: () {}),
                SizedBox(height: 16),
                cardWidget(name_area: 'PEDIATRIA', onPressed: () {}),
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
