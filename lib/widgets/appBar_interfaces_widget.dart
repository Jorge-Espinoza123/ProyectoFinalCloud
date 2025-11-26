import 'package:flutter/material.dart';

class appbarInterfacesWidget extends StatelessWidget
    implements PreferredSizeWidget {
  String nameAppbar;
  Color nameColorText;

  appbarInterfacesWidget({
    required this.nameAppbar,
    required this.nameColorText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 224, 223),
              Color.fromARGB(255, 35, 136, 224),
            ],
          ),
        ),
      ),
      title: Text(
        nameAppbar,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: nameColorText,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
