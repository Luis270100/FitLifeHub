import 'package:exercise/domain/entities/exercise_type.dart';

extension ExerciseTypeExtension on String {
  ExerciseType setExerciseType() {
    switch (this) {
      case 'cardio':
        return ExerciseType.cardio;
      case 'olympic_weightlifting':
        return ExerciseType.olympicWeightlifting;
      case 'plyometrics':
        return ExerciseType.plyometrics;
      case 'powerlifting':
        return ExerciseType.powerlifting;
      case 'strength':
        return ExerciseType.strength;
      case 'stretching':
        return ExerciseType.stretching;
      case 'strongman':
        return ExerciseType.strongman;
      default:
        return ExerciseType.cardio;
    }
  }
}
