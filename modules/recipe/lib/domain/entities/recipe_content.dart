import 'package:equatable/equatable.dart';
import 'package:recipe/domain/entities/step.dart';

class RecipeContent extends Equatable {
  const RecipeContent({
    this.id = '',
    this.title = '',
    this.image = '',
    this.sourceUrl = '',
    this.diets = const [],
    this.steps = const [],
  });

  final String id;
  final String title;
  final String image;
  final String sourceUrl;
  final List<String> diets;
  final List<Step> steps;

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        sourceUrl,
        diets,
        steps,
      ];
}
