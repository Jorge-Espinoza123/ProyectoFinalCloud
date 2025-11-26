import 'dart:async';
import 'package:flutter/material.dart';

class LoadingViewModel {
  final BuildContext context;

  LoadingViewModel(this.context);

  void startLoading(Function onComplete) {
    Timer(Duration(seconds: 3), () {
      onComplete();
    });
  }
}
