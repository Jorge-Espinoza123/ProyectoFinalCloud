import 'package:flutter_test/flutter_test.dart';

int calcularVidaRestante(int vidaUtil, int aniosUso) {
  return vidaUtil - aniosUso;
}

void main() {
  test('Calcular vida útil restante correctamente', () {
    expect(calcularVidaRestante(10, 3), 7);
    expect(calcularVidaRestante(5, 5), 0);
  });
}
