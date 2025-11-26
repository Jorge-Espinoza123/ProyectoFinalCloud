import 'package:flutter/material.dart';
import 'package:hospital/viewmodels/time_loading_screen.dart';
import 'package:hospital/views/3.login.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LoadingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoadingViewModel(context);

    viewModel.startLoading(() {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => loginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
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
                  child: Column(
                    children: [
                      SizedBox(height: 300),
                      Image.asset('assets/images/logo_MedTech.png', width: 300),
                      Text(
                        'MedTech',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
