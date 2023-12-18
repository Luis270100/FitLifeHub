import 'package:dio/dio.dart';
import 'package:exercise/data/repositories/exercise_repository_impl.dart';
import 'package:exercise/domain/entities/difficulty.dart';
import 'package:exercise/domain/entities/exercise.dart';
import 'package:exercise/domain/entities/exercise_type.dart';
import 'package:exercise/domain/entities/muscle.dart';
import 'package:exercise/domain/repository/exercise_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ExerciseRepository repository;
  late Dio dio;
  late DioAdapter dioAdapter;

  const baseURL = 'https://api.api-ninjas.com/v1/exercises';

  setUp(() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
      ),
    );
    dioAdapter = DioAdapter(dio: dio);
    repository = ExerciseRepositoryImpl(
      dio,
    );
  });

  const data = [
    {
      'name': 'Rower',
      'type': 'cardio',
      'muscle': 'middle_back',
      'equipment': 'machine',
      'difficulty': 'intermediate',
      'instructions': 'To begin, seat yourself on the rower.',
    },
    {
      'name': 'Elliptical trainer',
      'type': 'cardio',
      'muscle': 'quadriceps',
      'equipment': 'machine',
      'difficulty': 'intermediate',
      'instructions': 'To begin, seat yourself on the rower.',
    },
  ];

  const exercises = [
    Exercise(
      name: 'Rower',
      muscle: Muscle.middleBack,
      equipment: 'machine',
      difficulty: Difficulty.intermediate,
      instructions: 'To begin, seat yourself on the rower.',
    ),
    Exercise(
      name: 'Elliptical trainer',
      muscle: Muscle.quadriceps,
      equipment: 'machine',
      difficulty: Difficulty.intermediate,
      instructions: 'To begin, seat yourself on the rower.',
    ),
  ];

  group('load exercise by category', () {
    test('should return a list of exercise by category', () async {
      //   Arrange
      dioAdapter.onGet(
        '?muscle=chest',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadByCategory(category: 'chest');

      //   Assert
      expect(result, exercises);
    });

    test('should return an Exception', () async {
      //   Arrange
      final error = DioException(
        error: {'message': 'Some beautiful error!'},
        requestOptions: RequestOptions(path: '?muscle=chest'),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '?muscle=chest'),
        ),
        type: DioExceptionType.badResponse,
      );

      dioAdapter.onGet(
        '?muscle=chest',
        (request) => request.throws(500, error),
      );

      // Act
      final response = repository.loadByCategory(category: 'chest');

      //   Assert
      expect(() async => response, throwsA(isA<Exception>()));
    });
  });

  group('load exercise by difficulty', () {
    test('should return a list of exercise by difficulty', () async {
      //   Arrange
      dioAdapter.onGet(
        '?difficulty=${Difficulty.beginner.value}',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadByDifficulty(
        difficulty: Difficulty.beginner,
      );

      //   Assert
      expect(result, exercises);
    });

    test('should return an Exception', () async {
      //   Arrange
      final error = DioException(
        error: {'message': 'Some beautiful error!'},
        requestOptions: RequestOptions(path: '?difficulty=beginner'),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '?difficulty=beginner'),
        ),
        type: DioExceptionType.badResponse,
      );

      dioAdapter.onGet(
        '?muscle=chest',
        (request) => request.throws(500, error),
      );

      // Act
      final response = repository.loadByDifficulty(
        difficulty: Difficulty.beginner,
      );

      //   Assert
      expect(() async => response, throwsA(isA<Exception>()));
    });
  });

  group('load exercise by name', () {
    test('should return a list of exercise by name', () async {
      //   Arrange
      dioAdapter.onGet(
        '?name=press',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadByName(
        name: 'press',
      );

      //   Assert
      expect(result, exercises);
    });

    test('should return an Exception', () async {
      //   Arrange
      final error = DioException(
        error: {'message': 'Some beautiful error!'},
        requestOptions: RequestOptions(path: '?name=press'),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '?name=press'),
        ),
        type: DioExceptionType.badResponse,
      );

      dioAdapter.onGet(
        '?name=press',
        (request) => request.throws(500, error),
      );

      // Act
      final response = repository.loadByName(
        name: 'press',
      );

      //   Assert
      expect(() async => response, throwsA(isA<Exception>()));
    });
  });

  group('load exercise by type', () {
    test('should return a list of exercise by type', () async {
      //   Arrange
      dioAdapter.onGet(
        '?type=${ExerciseType.cardio.value}',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadByType(
        type: ExerciseType.cardio,
      );

      //   Assert
      expect(result, exercises);
    });

    test('should return an Exception', () async {
      //   Arrange
      final error = DioException(
        error: {'message': 'Some beautiful error!'},
        requestOptions: RequestOptions(path: '?type=cardio'),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '?type=cardio'),
        ),
        type: DioExceptionType.badResponse,
      );

      dioAdapter.onGet(
        '?type=cardio',
        (request) => request.throws(500, error),
      );

      // Act
      final response = repository.loadByType(
        type: ExerciseType.cardio,
      );

      //   Assert
      expect(() async => response, throwsA(isA<Exception>()));
    });
  });

  test('should handle response with status different than 200', () async {
    //   Arrange
    dioAdapter.onGet(
      '?type=${ExerciseType.cardio.value}',
          (request) => request.reply(401, null),
    );

    //   Act
    final response = repository.loadByType(
      type: ExerciseType.cardio,
    );

    //   Assert
    expect(() async => response, throwsA(isA<Exception>()));
  });

}
