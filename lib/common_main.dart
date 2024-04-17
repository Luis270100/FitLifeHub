import 'package:firebase_core/firebase_core.dart';
import 'package:fit_life_hub/app.dart';
import 'package:fit_life_hub/di/app_di.dart';
import 'package:fit_life_hub/firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> commonMain() async {
  await Firebase.initializeApp(
    name: 'FitLifeHub',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDi();
  runApp(const MyApp());
}
