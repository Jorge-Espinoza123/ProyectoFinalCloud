import 'package:flutter/material.dart';
import 'package:hospital/views/patrimonio/registro_usuarios_nuevos/nuevo_usuario_patrimonio.dart';
import 'package:hospital/views/patrimonio/registro_usuarios_nuevos/nuevo_usuario_mantenimiento.dart';
import 'package:hospital/views/patrimonio/registro_usuarios_nuevos/nuevo_usuario_medicina.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';

class rolNuevoUsuarioPatrimonio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Rol de nuevo Usuario',
          nameColorText: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  backgroundColor: Color.fromARGB(255, 6, 51, 106),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => newUserPatrimonio(),
                    ),
                  );
                },
                child: Text(
                  'patrimonio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                  backgroundColor: Color.fromARGB(255, 6, 51, 106),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => newUserMantenimiento(),
                    ),
                  );
                },
                child: Text(
                  'Mantenimiento',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                  backgroundColor: Color.fromARGB(255, 6, 51, 106),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => newUserMedicina()),
                  );
                },
                child: Text(
                  'Personal Medico',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
