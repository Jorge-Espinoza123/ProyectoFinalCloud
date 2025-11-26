import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editDatosEquipArea extends StatefulWidget {
  final DocumentReference docRef;
  final Map<String, dynamic> data;

  const editDatosEquipArea({
    super.key,
    required this.docRef,
    required this.data,
  });

  @override
  State<editDatosEquipArea> createState() => _EditDatosEquipAreaState();
}

class _EditDatosEquipAreaState extends State<editDatosEquipArea> {
  late TextEditingController _marcaController;
  late TextEditingController _modeloController;
  late TextEditingController _codigoInternoController;
  late TextEditingController _codigoPatrimonialController;

  @override
  void initState() {
    super.initState();
    _marcaController = TextEditingController(text: widget.data['marca']);
    _modeloController = TextEditingController(text: widget.data['modelo']);
    _codigoInternoController = TextEditingController(
      text: widget.data['codigoInterno'],
    );
    _codigoPatrimonialController = TextEditingController(
      text: widget.data['codigoPatrimonial'],
    );
  }

  @override
  void dispose() {
    _marcaController.dispose();
    _modeloController.dispose();
    _codigoInternoController.dispose();
    _codigoPatrimonialController.dispose();
    super.dispose();
  }

  Future<void> _guardarCambios() async {
    await widget.docRef.update({
      'marca': _marcaController.text.trim(),
      'modelo': _modeloController.text.trim(),
      'codigoInterno': _codigoInternoController.text.trim(),
      'codigoPatrimonial': _codigoPatrimonialController.text.trim(),
    });

    Navigator.pop(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('✅ Datos actualizados')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Equipo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _marcaController,
              decoration: InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: _codigoInternoController,
              decoration: InputDecoration(labelText: 'Código Interno'),
            ),
            TextField(
              controller: _codigoPatrimonialController,
              decoration: InputDecoration(labelText: 'Código Patrimonial'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _guardarCambios,
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
