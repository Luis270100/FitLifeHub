import 'package:equatable/equatable.dart';
import 'package:exercise/domain/entities/difficulty.dart';
import 'package:exercise/domain/entities/exercise_type.dart';
import 'package:exercise/domain/entities/muscle.dart';

class Exercise extends Equatable {
  const Exercise({
    this.name = '',
    this.type = ExerciseType.cardio,
    this.muscle = Muscle.general,
    this.equipment = '',
    this.difficulty = Difficulty.beginner,
    this.instructions = '',
  });

  final String name;
  final ExerciseType type;
  final Muscle muscle;
  final String equipment;
  final Difficulty difficulty;
  final String instructions;

  @override
  List<Object?> get props => [
        name,
        type,
        muscle,
        equipment,
        difficulty,
        instructions,
      ];
}
