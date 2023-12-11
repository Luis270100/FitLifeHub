import 'package:exercise/domain/entities/exercise.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> loadByCategory({
    required String category,
  });

  Future<List<Exercise>> loadByType({
    required String type,
  });

  Future<List<Exercise>> loadByName({
    required String name,
  });

  Future<List<Exercise>> loadByDifficulty({
    required String difficulty,
  });
}
