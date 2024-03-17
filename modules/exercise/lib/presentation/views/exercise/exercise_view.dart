import 'package:exercise/domain/entities/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({
    required this.exercise,
    super.key,
  });

  static const String route = '/exercise';
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text(exercise.name),
            Text(exercise.difficulty.value),
            Text(exercise.equipment),
            Text(exercise.muscle.value),
            Text(exercise.type.value),
            Text(exercise.instructions),
          ],
        ),
      ),
    );
  }
}
