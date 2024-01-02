import 'package:dio/dio.dart';
import 'package:recipe/domain/entities/recipe.dart';
import 'package:recipe/domain/repository/recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  const RecipesRepositoryImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<List<Recipe>> loadByIngredient(String ingredient, int amount) {
    // &query=pasta&number=30
    throw UnimplementedError();
  }
}
