import 'package:exercise/data/repositories/exercise_repository_impl.dart';
import 'package:exercise/domain/repository/exercise_repository.dart';
import 'package:exercise/presentation/views/exercises/exercises_view_cubit.dart';
import 'package:exercise/utils/dio/exercise_dio.dart';
import 'package:get_it/get_it.dart';

class ExerciseDi {
  static GetIt? _getIt;

  static GetIt get getIt => _getIt!;

  static Future<void> init(GetIt getIt) async {
    getIt
      ..registerLazySingleton<ExerciseDio>(ExerciseDio.new)
      ..registerLazySingleton<ExerciseRepository>(
        () => ExerciseRepositoryImpl(
          getIt<ExerciseDio>().instance,
        ),
      )
      ..registerFactory(
        () => ExercisesViewCubit(getIt<ExerciseRepository>()),
      );

    _getIt = getIt;
  }
}
