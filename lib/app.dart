import 'package:common/utils/themes/dark_theme.dart';
import 'package:common/utils/themes/light_theme.dart';
import 'package:fit_life_hub/router/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FitLifeHub',
      theme: LightTheme.theme(),
      darkTheme: DarkTheme.theme(),
      routerConfig: router,
    );
  }
}
