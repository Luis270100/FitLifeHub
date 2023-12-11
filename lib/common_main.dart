import 'package:fit_life_hub/app.dart';
import 'package:fit_life_hub/di/app_di.dart';
import 'package:flutter/material.dart';


Future<void> commonMain() async {
  await initDi();
  runApp(const MyApp());
}
