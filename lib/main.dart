import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

// import 'package:intl/intl.dart';

// interfaces
import 'package:hospital/views/1.welcome.dart';
import 'package:hospital/views/patrimonio/1.homepage_patrimonio.dart';
import 'package:hospital/views/mantenimiento/1.homepage_mantenimiento.dart';
import 'package:hospital/views/medicina/uci/5.3.homepage_medicina_uci.dart';
import 'package:hospital/views/medicina/sop/5.4.homepage_medicina_sop.dart';
import 'package:hospital/views/medicina/pediatria/5.5.homepage_medicina_pediatria.dart';
import 'package:hospital/views/medicina/neonatologia/5.6.homepage_medicina_neonatologia.dart';
import 'package:hospital/views/medicina/hospitalizacion/5.7.homepage_medicina_hospitalizacion.dart';
import 'package:hospital/views/medicina/emergencia/5.8.homepage_medicina_emergencia.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // BLOQUEAR ORIENTACIÓN A VERTICAL
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDateFormatting('es', null);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => welcomePage(),
        '/patrimonio': (context) => homepagePatrimonio(),
        '/mantenimiento': (context) => homepageMantenimiento(),
        '/medicinaUci': (context) => homepageMedicinaUci(),
        '/medicinaSop': (context) => homepageMedicinaSop(),
        '/medicinaPediatria': (context) => homepageMedicinaPediatria(),
        '/medicinaEmergencia': (context) => homepageMedicinaEmergencia(),
        '/medicinaHospitalizacion':
            (context) => homepageMedicinaHospitalizacion(),
        '/medicinaNeonatologia': (context) => homepageMedicinaNeonatologia(),
      },
    ),
  );
}
