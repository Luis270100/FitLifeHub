import 'package:auth/data/authentication_repository_impl.dart';
import 'package:auth/domain/data/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class AuthDi {
  static GetIt? _getIt;

  static GetIt get getIt => _getIt!;

  static Future<void> init(GetIt getIt) async {
    final authentication = FirebaseAuth.instance;

    getIt
      ..registerSingleton<FirebaseAuth>(authentication)
      ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(getIt()),
      );

    _getIt = getIt;
  }
}
