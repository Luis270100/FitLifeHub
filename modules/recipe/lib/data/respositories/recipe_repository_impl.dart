import 'package:dio/dio.dart';
import 'package:recipe/domain/entities/recipe.dart';
import 'package:recipe/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  const RecipeRepositoryImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<Recipe> loadRecipe(String id) {
    // /$id/information?apiKey=$apiKey
    throw UnimplementedError();
  }
}
