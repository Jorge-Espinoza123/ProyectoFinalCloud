// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hospital/widgets/appBar_interfaces_widget.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class RegistrarMantenimientoPage extends StatefulWidget {
//   final String area;
//   final String idEquipo;

//   const RegistrarMantenimientoPage({
//     super.key,
//     required this.area,
//     required this.idEquipo,
//   });

//   @override
//   State<RegistrarMantenimientoPage> createState() =>
//       _RegistrarMantenimientoPageState();
// }

// class _RegistrarMantenimientoPageState
//     extends State<RegistrarMantenimientoPage> {
//   final _formKey = GlobalKey<FormState>();

//   String tipoMantenimiento = 'Preventivo';
//   String prioridad = 'Media';

//   Map<String, dynamic>? _usuarioLogueado;

//   final TextEditingController _problemaController = TextEditingController();
//   final TextEditingController _diagnosticoController = TextEditingController();
//   final TextEditingController _trabajoController = TextEditingController();
//   final TextEditingController _recomendacionesController =
//       TextEditingController();

//   // Lista de archivos locales (copiados a la carpeta de la app)
//   List<File> _imagenesLocales = [];

//   bool _isSaving = false;

//   @override
//   void dispose() {
//     _problemaController.dispose();
//     _diagnosticoController.dispose();
//     _trabajoController.dispose();
//     _recomendacionesController.dispose();
//     super.dispose();
//   }

//   /// Solicita permisos necesarios (storage / photos) de forma segura.
//   Future<bool> _requestPermissions() async {
//     if (Platform.isAndroid) {
//       // Para Android 13+ se usa READ/WRITE_MEDIA (Permission.photos) pero
//       // permission_handler ofrece Permission.photos; pedimos ambos por seguridad.
//       final storageStatus = await Permission.storage.status;
//       final photosStatus = await Permission.photos.status;

//       if (!storageStatus.isGranted) {
//         await Permission.storage.request();
//       }
//       if (!photosStatus.isGranted) {
//         await Permission.photos.request();
//       }

//       final s = await Permission.storage.isGranted;
//       final p = await Permission.photos.isGranted;

//       return s || p;
//     } else if (Platform.isIOS) {
//       final photosStatus = await Permission.photos.status;
//       if (!photosStatus.isGranted) {
//         await Permission.photos.request();
//       }
//       return await Permission.photos.isGranted;
//     }

//     // Otros platforms - permitir por defecto
//     return true;
//   }

//   /// Toma una foto con la cámara y guarda una copia local en la carpeta de la app.
//   Future<void> _tomarFoto() async {
//     final ok = await _requestPermissions();
//     if (!ok) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Permiso para guardar imágenes denegado')),
//       );
//       return;
//     }

//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);

//     if (pickedFile != null) {
//       final original = File(pickedFile.path);
//       final saved = await _saveImageLocally(original);
//       setState(() {
//         _imagenesLocales.add(saved);
//       });
//     }
//   }

//   /// Copia la imagen original a la carpeta de la app y devuelve el File copiado.
//   Future<File> _saveImageLocally(File original) async {
//     final dir = await getExternalStorageDirectory();
//     // path: /storage/emulated/0/Android/data/com.example.hospital/files/
//     final appDir = Directory('${dir!.path}/evidencias');
//     if (!await appDir.exists()) await appDir.create(recursive: true);

//     final timestamp = DateTime.now().millisecondsSinceEpoch;
//     final fileName = 'evidencia_$timestamp${extensionFromPath(original.path)}';
//     final newPath = '${appDir.path}/$fileName';
//     final saved = await original.copy(newPath);
//     return saved;
//   }

//   String extensionFromPath(String path) {
//     final idx = path.lastIndexOf('.');
//     if (idx == -1) return '.jpg';
//     return path.substring(idx);
//   }

//   /// Genera el PDF con las imágenes (las pasadas ya deben ser locales).
//   Future<File> _generarPdf(
//     String nuevoId,
//     String nombre,
//     String apellidoPaterno,
//     String apellidoMaterno,
//     String tipo,
//     String problema,
//     String prioridad,
//     String diagnostico,
//     String trabajo,
//     String recomendaciones,
//     List<File> imagenes,
//   ) async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.MultiPage(
//         build:
//             (context) => [
//               pw.Text(
//                 'Orden de Trabajo de Mantenimiento',
//                 style: pw.TextStyle(fontSize: 20),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('ID: $nuevoId'),
//               pw.Text('Equipo ID: ${widget.idEquipo}'),
//               pw.Text('Área: ${widget.area}'),
//               pw.Text(
//                 'Nombre Técnico: $nombre $apellidoPaterno $apellidoMaterno',
//               ),
//               pw.Text('Tipo: $tipo'),
//               pw.Text('Problema: $problema'),
//               pw.Text('Prioridad: $prioridad'),
//               pw.Text('Diagnóstico: $diagnostico'),
//               pw.Text('Trabajo Realizado: $trabajo'),
//               pw.Text('Recomendaciones: $recomendaciones'),
//               pw.SizedBox(height: 20),
//               pw.Text('Evidencias Fotográficas:'),
//               pw.SizedBox(height: 8),
//               ...imagenes.map((img) {
//                 try {
//                   final bytes = img.readAsBytesSync();
//                   return pw.Padding(
//                     padding: const pw.EdgeInsets.symmetric(vertical: 5),
//                     child: pw.Image(pw.MemoryImage(bytes), width: 300),
//                   );
//                 } catch (_) {
//                   return pw.Container();
//                 }
//               }).toList(),
//             ],
//       ),
//     );

//     // Guardar PDF en almacenamiento externo de la app
//     final dir = await getExternalStorageDirectory();
//     final appDir = Directory('${dir!.path}/evidencias');
//     if (!await appDir.exists()) await appDir.create(recursive: true);

//     final file = File('${appDir.path}/$nuevoId.pdf');
//     await file.writeAsBytes(await pdf.save());
//     return file;
//   }

//   /// Registra el mantenimiento: sube datos a Firestore, guarda pdf local y comparte.
//   Future<void> _registrarMantenimiento() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _isSaving = true);
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => const Center(child: CircularProgressIndicator()),
//     );

//     try {
//       // Validaciones básicas
//       final problema = _problemaController.text.trim();
//       final diagnostico = _diagnosticoController.text.trim();
//       final trabajo = _trabajoController.text.trim();
//       final recomendaciones = _recomendacionesController.text.trim();

//       // =======================================================
//       // 1) Obtener datos del técnico logueado (FirebaseAuth)
//       // =======================================================

//       // UID del usuario logueado
//       final uid = FirebaseAuth.instance.currentUser?.uid;

//       if (uid == null) {
//         Navigator.of(context).pop();
//         setState(() => _isSaving = false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No hay un técnico logueado.')),
//         );
//         return;
//       }

//       // Buscar usuario por UID
//       final query =
//           await FirebaseFirestore.instance
//               .collection('hospital')
//               .doc('Categorias')
//               .collection('perfil_profesional')
//               .doc('mantenimiento')
//               .collection('usuarios')
//               .where('auth_uid', isEqualTo: uid)
//               .limit(1)
//               .get();

//       if (query.docs.isEmpty) {
//         Navigator.of(context).pop();
//         setState(() => _isSaving = false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('El técnico logueado no está registrado.'),
//           ),
//         );
//         return;
//       }

//       final usuarioData = query.docs.first.data();
//       final nombre = usuarioData['nombre'] ?? '';
//       final apellidoPaterno = usuarioData['apellidoPaterno'] ?? '';
//       final apellidoMaterno = usuarioData['apellidoMaterno'] ?? '';

//       // 2) Generar nuevo ID OTM (formato: OTM_N_001)
//       final mantenimientoCollection = FirebaseFirestore.instance
//           .collection('hospital')
//           .doc('Categorias')
//           .collection('areas_hospital')
//           .doc(widget.area)
//           .collection('mantenimiento');

//       // Tomamos el tamaño actual y sumamos 1. (Si prefieres, se puede usar orderBy para evitar saltos).
//       final snapshot = await mantenimientoCollection.get();
//       final index = snapshot.size + 1;
//       final nuevoId = 'OTM_N_${index.toString().padLeft(3, '0')}';

//       // 3) Guardar evidencia local (ya fueron guardadas cuando se tomaron las fotos)
//       //    _imagenesLocales contiene las imágenes ya guardadas localmente.

//       // 4) Generar PDF (con las imágenes ya locales)
//       final pdfFile = await _generarPdf(
//         nuevoId,
//         nombre,
//         apellidoPaterno,
//         apellidoMaterno,
//         tipoMantenimiento,
//         problema,
//         prioridad,
//         diagnostico,
//         trabajo,
//         recomendaciones,
//         _imagenesLocales,
//       );

//       // 5) Guardar registro en Firestore (incluimos rutas locales de evidencias)
//       final evidenciasLocalesStrings = _imagenesLocales
//           .map((f) => f.path)
//           .toList(growable: false);

//       // 1. Obtener datos del equipo
//       final equipoDoc =
//           await FirebaseFirestore.instance
//               .collection('hospital')
//               .doc('Categorias')
//               .collection('areas_hospital')
//               .doc(widget.area)
//               .collection('equipos')
//               .doc(widget.idEquipo)
//               .get();

//       // 2. Validar si existe
//       if (!equipoDoc.exists) {
//         Navigator.of(context).pop();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No se encontraron datos del equipo')),
//         );
//         return;
//       }

//       // 3. Extraer los campos del equipo
//       final equipoData = equipoDoc.data()!;

//       await mantenimientoCollection.doc(nuevoId).set({
//         'id_otm': nuevoId,
//         'equipo_id': widget.idEquipo,

//         // DATOS DEL EQUIPO ↓↓↓
//         'denominacion': equipoData['denominacion'],
//         'marca': equipoData['marca'],
//         'modelo': equipoData['modelo'],
//         'codigoInterno': equipoData['codigoInterno'],
//         'codigoPatrimonial': equipoData['codigoPatrimonial'],

//         // DATOS DEL USUARIO ↓↓↓
//         'nombre': nombre,
//         'apellidoPaterno': apellidoPaterno,
//         'apellidoMaterno': apellidoMaterno,

//         // DATOS DEL MANTENIMIENTO ↓↓↓
//         'tipo': tipoMantenimiento,
//         'problema': problema,
//         'prioridad': prioridad,
//         'diagnostico': diagnostico,
//         'trabajo': trabajo,
//         'recomendaciones': recomendaciones,
//         'fecha': FieldValue.serverTimestamp(),

//         // RUTAS LOCALES ↓↓↓
//         'evidencias_locales': evidenciasLocalesStrings,
//         'pdf_local_path': pdfFile.path,
//       });

//       Navigator.of(context).pop(); // cerrar dialogo de progreso
//       setState(() => _isSaving = false);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Mantenimiento registrado: $nuevoId')),
//       );

//       // 6) Compartir PDF
//       await Share.shareXFiles([
//         XFile(pdfFile.path),
//       ], text: 'Orden de trabajo generada: $nuevoId');

//       // regresar
//       if (mounted) Navigator.of(context).pop();
//     } catch (e, st) {
//       Navigator.of(context).pop();
//       setState(() => _isSaving = false);
//       debugPrint('Error registrar mantenimiento: $e\n$st');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error al registrar mantenimiento: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appbarInterfacesWidget(
//         nameAppbar: 'Registrar Mantenimiento',
//         nameColorText: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               DropdownButtonFormField<String>(
//                 value: tipoMantenimiento,
//                 items:
//                     ['Preventivo', 'Correctivo', 'Diagnóstico']
//                         .map(
//                           (tipo) =>
//                               DropdownMenuItem(value: tipo, child: Text(tipo)),
//                         )
//                         .toList(),
//                 onChanged:
//                     (value) => setState(
//                       () => tipoMantenimiento = value ?? tipoMantenimiento,
//                     ),
//                 decoration: const InputDecoration(
//                   labelText: 'Tipo de mantenimiento',
//                 ),
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: _problemaController,
//                 decoration: const InputDecoration(
//                   labelText: 'Problema presentado',
//                 ),
//                 validator:
//                     (value) =>
//                         value == null || value.isEmpty
//                             ? 'Campo requerido'
//                             : null,
//               ),
//               const SizedBox(height: 12),
//               DropdownButtonFormField<String>(
//                 value: prioridad,
//                 items:
//                     ['Alta', 'Media', 'Baja']
//                         .map((p) => DropdownMenuItem(value: p, child: Text(p)))
//                         .toList(),
//                 onChanged:
//                     (value) => setState(() => prioridad = value ?? prioridad),
//                 decoration: const InputDecoration(labelText: 'Prioridad'),
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: _diagnosticoController,
//                 decoration: const InputDecoration(
//                   labelText: 'Diagnóstico técnico',
//                 ),
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: _trabajoController,
//                 decoration: const InputDecoration(
//                   labelText: 'Trabajo realizado',
//                 ),
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: _recomendacionesController,
//                 decoration: const InputDecoration(
//                   labelText: 'Recomendaciones/Observaciones',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('Evidencias fotográficas:'),
//               const SizedBox(height: 8),
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _tomarFoto,
//                     child: const Text('Tomar Foto'),
//                   ),
//                   ..._imagenesLocales.map(
//                     (img) => Stack(
//                       alignment: Alignment.topRight,
//                       children: [
//                         Image.file(
//                           img,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _imagenesLocales.remove(img);
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.black54,
//                               shape: BoxShape.circle,
//                             ),
//                             padding: const EdgeInsets.all(4),
//                             child: const Icon(
//                               Icons.close,
//                               size: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   OutlinedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text('Cancelar'),
//                   ),
//                   ElevatedButton(
//                     onPressed: _isSaving ? null : _registrarMantenimiento,
//                     child:
//                         _isSaving
//                             ? const SizedBox(
//                               width: 18,
//                               height: 18,
//                               child: CircularProgressIndicator(strokeWidth: 2),
//                             )
//                             : const Text('Registrar'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class RegistrarMantenimientoPage extends StatefulWidget {
  final String area;
  final String idEquipo;

  const RegistrarMantenimientoPage({
    super.key,
    required this.area,
    required this.idEquipo,
  });

  @override
  State<RegistrarMantenimientoPage> createState() =>
      _RegistrarMantenimientoPageState();
}

class _RegistrarMantenimientoPageState
    extends State<RegistrarMantenimientoPage> {
  final _formKey = GlobalKey<FormState>();

  String tipoMantenimiento = 'Preventivo';
  String prioridad = 'Media';

  final TextEditingController _problemaController = TextEditingController();
  final TextEditingController _diagnosticoController = TextEditingController();
  final TextEditingController _trabajoController = TextEditingController();
  final TextEditingController _recomendacionesController =
      TextEditingController();

  List<File> _imagenesLocales = [];

  bool _isSaving = false;

  @override
  void dispose() {
    _problemaController.dispose();
    _diagnosticoController.dispose();
    _trabajoController.dispose();
    _recomendacionesController.dispose();
    super.dispose();
  }

  Future<bool> _requestPermissions() async {
    if (Platform.isAndroid) {
      // Para cámara
      final cameraStatus = await Permission.camera.status;
      if (!cameraStatus.isGranted) {
        await Permission.camera.request();
      }

      // Para guardar imágenes en Android 13+ (API 33+)
      final mediaStatus = await Permission.photos.status;
      if (!mediaStatus.isGranted) {
        await Permission.photos.request();
      }

      // Para Android 12 o menor
      final storageStatus = await Permission.storage.status;
      if (!storageStatus.isGranted) {
        await Permission.storage.request();
      }

      return await Permission.camera.isGranted &&
          (await Permission.photos.isGranted ||
              await Permission.storage.isGranted);
    }

    if (Platform.isIOS) {
      final cameraStatus = await Permission.camera.status;
      final photosStatus = await Permission.photos.status;

      if (!cameraStatus.isGranted) await Permission.camera.request();
      if (!photosStatus.isGranted) await Permission.photos.request();

      return await Permission.camera.isGranted &&
          await Permission.photos.isGranted;
    }

    return false;
  }

  Future<void> _tomarFoto() async {
    final ok = await _requestPermissions();
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permiso para guardar imágenes denegado')),
      );
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final original = File(pickedFile.path);
      final saved = await _saveImageLocally(original);
      setState(() {
        _imagenesLocales.add(saved);
      });
    }
  }

  Future<File> _saveImageLocally(File original) async {
    final dir = await getExternalStorageDirectory();
    final appDir = Directory('${dir!.path}/evidencias');
    if (!await appDir.exists()) await appDir.create(recursive: true);

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'evidencia_$timestamp${extensionFromPath(original.path)}';
    final newPath = '${appDir.path}/$fileName';
    final saved = await original.copy(newPath);
    return saved;
  }

  String extensionFromPath(String path) {
    final idx = path.lastIndexOf('.');
    if (idx == -1) return '.jpg';
    return path.substring(idx);
  }

  Future<File> _generarPdf(
    String nuevoId,
    String nombre,
    String apellidoPaterno,
    String apellidoMaterno,
    String tipo,
    String problema,
    String prioridad,
    String diagnostico,
    String trabajo,
    String recomendaciones,
    List<File> imagenes,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build:
            (context) => [
              pw.Text(
                'Orden de Trabajo de Mantenimiento',
                style: pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              pw.Text('ID: $nuevoId'),
              pw.Text('Equipo ID: ${widget.idEquipo}'),
              pw.Text('Área: ${widget.area}'),
              pw.Text(
                'Nombre Técnico: $nombre $apellidoPaterno $apellidoMaterno',
              ),
              pw.Text('Tipo: $tipo'),
              pw.Text('Problema: $problema'),
              pw.Text('Prioridad: $prioridad'),
              pw.Text('Diagnóstico: $diagnostico'),
              pw.Text('Trabajo Realizado: $trabajo'),
              pw.Text('Recomendaciones: $recomendaciones'),
              pw.SizedBox(height: 20),
              pw.Text('Evidencias Fotográficas:'),
              pw.SizedBox(height: 8),
              ...imagenes.map((img) {
                try {
                  final bytes = img.readAsBytesSync();
                  return pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 5),
                    child: pw.Image(pw.MemoryImage(bytes), width: 300),
                  );
                } catch (_) {
                  return pw.Container();
                }
              }).toList(),
            ],
      ),
    );

    final dir = await getExternalStorageDirectory();
    final appDir = Directory('${dir!.path}/evidencias');
    if (!await appDir.exists()) await appDir.create(recursive: true);

    final file = File('${appDir.path}/$nuevoId.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  Future<void> _registrarMantenimiento() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final problema = _problemaController.text.trim();
      final diagnostico = _diagnosticoController.text.trim();
      final trabajo = _trabajoController.text.trim();
      final recomendaciones = _recomendacionesController.text.trim();

      // ======= Usar datos genéricos para técnico =======
      final nombre = '';
      final apellidoPaterno = '';
      final apellidoMaterno = '';
      final rolUsuario = '';
      final areaUsuario = '';

      // ======= Generar nuevo ID OTM =======
      final mantenimientoCollection = FirebaseFirestore.instance
          .collection('hospital')
          .doc('Categorias')
          .collection('areas_hospital')
          .doc(widget.area)
          .collection('mantenimiento');

      final snapshot = await mantenimientoCollection.get();
      final index = snapshot.size + 1;
      final nuevoId = 'OTM_N_${index.toString().padLeft(3, '0')}';

      // ======= Generar PDF =======
      final pdfFile = await _generarPdf(
        nuevoId,
        nombre,
        apellidoPaterno,
        apellidoMaterno,
        tipoMantenimiento,
        problema,
        prioridad,
        diagnostico,
        trabajo,
        recomendaciones,
        _imagenesLocales,
      );

      final evidenciasLocalesStrings = _imagenesLocales
          .map((f) => f.path)
          .toList(growable: false);

      // ======= Obtener datos del equipo =======
      final equipoDoc =
          await FirebaseFirestore.instance
              .collection('hospital')
              .doc('Categorias')
              .collection('areas_hospital')
              .doc(widget.area)
              .collection('equipos')
              .doc(widget.idEquipo)
              .get();

      if (!equipoDoc.exists) {
        Navigator.of(context).pop();
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se encontraron datos del equipo')),
        );
        return;
      }

      final equipoData = equipoDoc.data()!;

      // ======= Guardar mantenimiento en Firestore =======
      await mantenimientoCollection.doc(nuevoId).set({
        'id_otm': nuevoId,
        'equipo_id': widget.idEquipo,
        'denominacion': equipoData['denominacion'],
        'marca': equipoData['marca'],
        'modelo': equipoData['modelo'],
        'codigoInterno': equipoData['codigoInterno'],
        'codigoPatrimonial': equipoData['codigoPatrimonial'],
        'nombre': nombre,
        'apellidoPaterno': apellidoPaterno,
        'apellidoMaterno': apellidoMaterno,
        'rol': rolUsuario,
        'area': areaUsuario,
        'tipo': tipoMantenimiento,
        'problema': problema,
        'prioridad': prioridad,
        'diagnostico': diagnostico,
        'trabajo': trabajo,
        'recomendaciones': recomendaciones,
        'fecha': FieldValue.serverTimestamp(),
        'evidencias_locales': evidenciasLocalesStrings,
        'pdf_local_path': pdfFile.path,
      });

      Navigator.of(context).pop();
      setState(() => _isSaving = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mantenimiento registrado: $nuevoId')),
      );

      await Share.shareXFiles([
        XFile(pdfFile.path),
      ], text: 'Orden de trabajo generada: $nuevoId');

      if (mounted) Navigator.of(context).pop();
    } catch (e, st) {
      Navigator.of(context).pop();
      setState(() => _isSaving = false);
      debugPrint('Error registrar mantenimiento: $e\n$st');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar mantenimiento: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarInterfacesWidget(
        nameAppbar: 'Registrar Mantenimiento',
        nameColorText: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: tipoMantenimiento,
                items:
                    ['Preventivo', 'Correctivo', 'Diagnóstico']
                        .map(
                          (tipo) =>
                              DropdownMenuItem(value: tipo, child: Text(tipo)),
                        )
                        .toList(),
                onChanged:
                    (value) => setState(
                      () => tipoMantenimiento = value ?? tipoMantenimiento,
                    ),
                decoration: const InputDecoration(
                  labelText: 'Tipo de mantenimiento',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _problemaController,
                decoration: const InputDecoration(
                  labelText: 'Problema presentado',
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Campo requerido'
                            : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: prioridad,
                items:
                    ['Alta', 'Media', 'Baja']
                        .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                onChanged:
                    (value) => setState(() => prioridad = value ?? prioridad),
                decoration: const InputDecoration(labelText: 'Prioridad'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _diagnosticoController,
                decoration: const InputDecoration(
                  labelText: 'Diagnóstico técnico',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _trabajoController,
                decoration: const InputDecoration(
                  labelText: 'Trabajo realizado',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _recomendacionesController,
                decoration: const InputDecoration(
                  labelText: 'Recomendaciones/Observaciones',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Evidencias fotográficas:'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: _tomarFoto,
                    child: const Text('Tomar Foto'),
                  ),
                  ..._imagenesLocales.map(
                    (img) => Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(
                          img,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _imagenesLocales.remove(img);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: _isSaving ? null : _registrarMantenimiento,
                    child:
                        _isSaving
                            ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Text('Registrar'),
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
