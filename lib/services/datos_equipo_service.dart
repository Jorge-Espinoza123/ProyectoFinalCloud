import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/datos_equipo_model.dart';

class DatosEquipoService {
  Future<List<DatosEquipoModel>> fetchEquipos(
    String area,
    String tipoEquipo,
  ) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('hospital')
            .doc('Categorias')
            .collection('areas_hospital')
            .doc(area)
            .collection('equipos')
            .where('denominacion', isEqualTo: tipoEquipo)
            .get();

    return snapshot.docs
        .map((doc) => DatosEquipoModel.fromFirestore(doc))
        .toList();
  }
}
