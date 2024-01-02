import 'package:get_it/get_it.dart';
import 'package:recipe/data/respositories/recipe_repository_impl.dart';
import 'package:recipe/data/respositories/recipes_repository_impl.dart';
import 'package:recipe/domain/repository/recipe_repository.dart';
import 'package:recipe/domain/repository/recipes_repository.dart';
import 'package:recipe/presentation/views/home/home_recipe_view_cubit.dart';
import 'package:recipe/utils/dio/recipe_dio.dart';
import 'package:recipe/utils/dio/recipes_dio.dart';

class RecipeDi {
  static GetIt? _getIt;

  static GetIt get getIt => _getIt!;

  static Future<void> init(GetIt getIt) async {
    getIt
      ..registerLazySingleton<RecipeRepository>(
        () => RecipeRepositoryImpl(
          getIt<RecipeDio>().instance,
        ),
      )
      ..registerLazySingleton<RecipesRepository>(
        () => RecipesRepositoryImpl(
          getIt<RecipesDio>().instance,
        ),
      )
      ..registerFactory(
        () => HomeRecipeViewCubit(
          getIt<RecipesRepository>(),
        ),
      );

    _getIt = getIt;
  }
}
