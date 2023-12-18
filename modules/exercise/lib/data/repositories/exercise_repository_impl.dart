import 'package:dio/dio.dart';
import 'package:exercise/domain/entities/difficulty.dart';
import 'package:exercise/domain/entities/exercise.dart';
import 'package:exercise/domain/entities/exercise_type.dart';
import 'package:exercise/domain/repository/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  const ExerciseRepositoryImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<List<Exercise>> loadByCategory({required String category}) async {
    try {
      final response = await dio.get<List<dynamic>>(
        '?muscle=$category',
      );

      return _manageResponse(response);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Exercise>> loadByDifficulty({
    required Difficulty difficulty,
  }) async {
    try {
      final response = await dio.get<List<dynamic>>(
        '?difficulty=${difficulty.value}',
      );

      return _manageResponse(response);
    } on Exception catch (e) {
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

  @override
  Future<List<Exercise>> loadByType({required ExerciseType type}) async {
    try {
      final response = await dio.get<List<dynamic>>(
        '?type=${type.value}',
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
        type: json['type'] as String? ?? '',
        muscle: json['muscle'] as String? ?? '',
        equipment: json['equipment'] as String? ?? '',
        difficulty: json['difficulty'] as String? ?? '',
        instructions: json['instructions'] as String? ?? '',
      );
}
