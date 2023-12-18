import 'package:exercise/domain/entities/difficulty.dart';
import 'package:exercise/domain/entities/exercise.dart';
import 'package:exercise/domain/entities/exercise_type.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> loadByCategory({
    required String category,
  });

  Future<List<Exercise>> loadByType({
    required ExerciseType type,
  });

  Future<List<Exercise>> loadByName({
    required String name,
  });

  Future<List<Exercise>> loadByDifficulty({
    required Difficulty difficulty,
  });
}
