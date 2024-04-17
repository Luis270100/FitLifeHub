import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';

class CommonDi {
  static GetIt? _getIt;

  static GetIt get getIt => _getIt!;

  static Future<void> init(GetIt getIt) async {
    final analytics = FirebaseAnalytics.instance;

    getIt.registerSingleton<FirebaseAnalytics>(analytics);

    _getIt = getIt;
  }
}
