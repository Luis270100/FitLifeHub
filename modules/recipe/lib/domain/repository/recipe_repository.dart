import 'package:recipe/domain/entities/recipe.dart';

mixin RecipeRepository {
  Future<Recipe> loadRecipe(String id);
}
