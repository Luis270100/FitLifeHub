import 'package:recipe/domain/entities/recipe.dart';

mixin RecipesRepository {
  Future<List<Recipe>> loadByIngredient(
    String ingredient,
    int amount,
  );
}
