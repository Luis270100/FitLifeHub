import 'package:dio/dio.dart';
import 'package:exercise/data/repositories/exercise_repository_impl.dart';
import 'package:exercise/domain/entities/exercise.dart';
import 'package:exercise/domain/repository/exercise_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late ExerciseRepository repository;
  late Dio dio;

  setUp(() {
    dio = MockDio();
    repository = ExerciseRepositoryImpl(
      dio,
    );
  });

  const exercises = [
    Exercise(
      name: 'name',
      type: 'type',
      muscle: 'muscle',
      equipment: 'equipment',
      difficulty: 'difficulty',
      instructions: 'description',
    ),
  ];

  // group('load exercise by repository', () {
  // test('should return a list of exercise by category', () async {
  //   //   Arrange
  //   when(
  //     () => dio.get<Map<String, dynamic>>(
  //       'https://api.api-ninjas.com/v1/exercises?muscle=chest',
  //     ),
  //   ).thenAnswer((_) async => {'data': exercises});
  //
  //   //   Act
  //   final result = await repository.loadByCategory(category: 'chest');
  //
  //   //   Assert
  //   expect(result, exercises);
  //   });
  // });
}
