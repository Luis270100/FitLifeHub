import 'package:exercise/domain/entities/difficulty.dart';
import 'package:exercise/domain/entities/exercise.dart';
import 'package:exercise/domain/entities/exercise_type.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> loadExercisesByFilters({
    String muscle = '',
    Difficulty difficulty = Difficulty.none,
    ExerciseType type = ExerciseType.none,
  });

  Future<List<Exercise>> loadByName({
    required String name,
  });
}
