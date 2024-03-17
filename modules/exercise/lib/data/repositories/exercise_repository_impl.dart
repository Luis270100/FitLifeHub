import 'package:dio/dio.dart';
import 'package:exercise/domain/entities/difficulty.dart';
import 'package:exercise/domain/entities/exercise.dart';
import 'package:exercise/domain/entities/exercise_type.dart';
import 'package:exercise/domain/repository/exercise_repository.dart';
import 'package:exercise/utils/extensions/difficulty_extension.dart';
import 'package:exercise/utils/extensions/exercise_type_extension.dart';
import 'package:exercise/utils/extensions/muscle_extension.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  const ExerciseRepositoryImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<List<Exercise>> loadExercisesByFilters({
    String muscle = '',
    Difficulty difficulty = Difficulty.none,
    ExerciseType type = ExerciseType.none,
  }) async {
    try {
      var url = '';

      if (muscle.isNotEmpty) {
        url += '?muscle=$muscle';
      }

      if (difficulty != Difficulty.none) {
        url += url.isEmpty
            ? '?difficulty=${difficulty.value}'
            : '&?difficulty=${difficulty.value}';
      }

      if (type != ExerciseType.none) {
        url += url.isEmpty ? '?type=${type.value}' : '&?type=${type.value}';
      }

      final response = await dio.get<List<dynamic>>(
        url,
      );

      return _manageResponse(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Exercise>> loadByName({required String name}) async {
    try {
      final response = await dio.get<List<dynamic>>(
        '?name=$name',
      );

      return _manageResponse(response);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  List<Exercise> _manageResponse(Response<List<dynamic>> response) {
    if (response.statusCode != 200 || response.data == null) {
      throw Exception(response.statusMessage);
    }

    return response.data!
        .map((dynamic json) => _toDomain(json as Map<String, dynamic>))
        .toList();
  }

  Exercise _toDomain(Map<String, dynamic> json) => Exercise(
        name: json['name'] as String? ?? '',
        type: (json['type'] as String? ?? '').setExerciseType(),
        muscle: (json['muscle'] as String? ?? '').setMuscle(),
        equipment: json['equipment'] as String? ?? '',
        difficulty: (json['difficulty'] as String? ?? '').setDifficulty(),
        instructions: json['instructions'] as String? ?? '',
      );
}
