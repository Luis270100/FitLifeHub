import 'package:exercise/domain/entities/difficulty.dart';

extension DifficultyExtension on String {
  Difficulty setDifficulty() {
    switch (this) {
      case 'beginner':
        return Difficulty.beginner;
      case 'intermediate':
        return Difficulty.intermediate;
      case 'expert':
        return Difficulty.expert;
      default:
        return Difficulty.beginner;
    }
  }
}
