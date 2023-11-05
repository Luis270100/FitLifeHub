import 'package:fit_life_hub/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> mainProd() async {
  await dotenv.load(fileName: '.env.prod');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
