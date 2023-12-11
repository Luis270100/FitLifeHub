import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  const Exercise({
    this.name = '',
    this.type = '',
    this.muscle = '',
    this.equipment = '',
    this.difficulty = '',
    this.instructions = '',
  });

  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
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
