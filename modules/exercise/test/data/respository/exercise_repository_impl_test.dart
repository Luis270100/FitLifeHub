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
      'type': 'strongman',
      'muscle': 'middle_back',
      'equipment': 'machine',
      'difficulty': 'intermediate',
      'instructions': 'To begin, seat yourself on the rower.',
    },
    {
      'name': 'Elliptical trainer',
      'type': 'cardio',
      'muscle': 'traps',
      'equipment': 'machine',
      'difficulty': 'expert',
      'instructions': 'To begin, seat yourself on the rower.',
    },
  ];

  const exercises = [
    Exercise(
      name: 'Rower',
      type: ExerciseType.strongman,
      muscle: Muscle.middleBack,
      equipment: 'machine',
      difficulty: Difficulty.intermediate,
      instructions: 'To begin, seat yourself on the rower.',
    ),
    Exercise(
      name: 'Elliptical trainer',
      muscle: Muscle.traps,
      equipment: 'machine',
      difficulty: Difficulty.expert,
      instructions: 'To begin, seat yourself on the rower.',
    ),
  ];

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

  group('load exercises with filters', () {
    test('should return a list of exercise by muscle', () async {
      //   Arrange
      dioAdapter.onGet(
        '?muscle=back',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadExercisesByFilters(
        muscle: 'back',
      );

      //   Assert
      expect(result, exercises);
    });

    test('should return a list of exercise by difficulty', () async {
      //   Arrange
      dioAdapter.onGet(
        '?difficulty=beginner',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadExercisesByFilters(
        difficulty: Difficulty.beginner,
      );

      //   Assert
      expect(result, exercises);
    });

    test('should return a list of exercise by type', () async {
      //   Arrange
      dioAdapter.onGet(
        '?type=cardio',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadExercisesByFilters(
        type: ExerciseType.cardio,
      );

      //   Assert
      expect(result, exercises);
    });

    test('should return a list of exercise by muscle, difficulty and type', () async {
      //   Arrange
      dioAdapter.onGet(
        '?muscle=back&?difficulty=beginner&?type=cardio',
        (request) => request.reply(200, data),
      );

      //   Act
      final result = await repository.loadExercisesByFilters(
        muscle: 'back',
        difficulty: Difficulty.beginner,
        type: ExerciseType.cardio,
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
}
