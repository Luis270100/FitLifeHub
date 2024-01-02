import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe/domain/repository/recipes_repository.dart';

part 'home_recipe_view_state.dart';

class HomeRecipeViewCubit extends Cubit<HomeRecipeViewState> {
  HomeRecipeViewCubit(
    this._recipesRepository,
  ) : super(const HomeRecipeViewState());

  final RecipesRepository _recipesRepository;
}
