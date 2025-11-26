import 'package:flutter/material.dart';
import 'package:hospital/views/patrimonio/1.homepage_patrimonio.dart';
import 'package:hospital/views/mantenimiento/1.homepage_mantenimiento.dart';
import 'package:hospital/views/medicina/uci/5.3.homepage_medicina_uci.dart';
// import 'package:hospital/views/2.loading_screen.dart';

class ControllerNavigationPages extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  int _activePageIndex = 0;

  int get activePageIndex => _activePageIndex;

  void changePage(int index) {
    _activePageIndex = index;
    notifyListeners();
  }

  List<Widget> get pages => [
    homepagePatrimonio(),
    homepageMedicinaUci(),
    homepageMantenimiento(),
    homepageMedicinaUci(),
  ];
}
