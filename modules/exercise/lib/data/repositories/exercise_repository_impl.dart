import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:exercise/domain/entities/exercise.dart';
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
      print('Here is the response');
      print(response);

      return [];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<List<Exercise>> loadByDifficulty({required String difficulty}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Exercise>> loadByName({required String name}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Exercise>> loadByType({required String type}) {
    throw UnimplementedError();
  }
}
