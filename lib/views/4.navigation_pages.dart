import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hospital/viewmodels/navigation_pages_controller.dart';

class NavigationPages extends StatefulWidget {
  const NavigationPages({super.key});

  @override
  State<NavigationPages> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<NavigationPages> {
  final ControllerNavigationPages navController = ControllerNavigationPages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navController.pages[navController.activePageIndex],
      backgroundColor: Colors.orange,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 0, 224, 223),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromARGB(255, 0, 224, 223),
        items: [
          Icon(Icons.help_outlined, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.call, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index) {
          navController.changePage(index);
          setState(() {});
        },
      ),
    );
  }
}
