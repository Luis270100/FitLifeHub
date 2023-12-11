import 'package:exercise/di/exercise_di.dart';
import 'package:exercise/presentation/views/exercises/exercises_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({
    super.key,
  });

  static const String route = '/exercises';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
      ),
      body: BlocProvider(
        create: (_) => ExerciseDi.getIt<ExercisesViewCubit>()..load(),
        child: BlocBuilder<ExercisesViewCubit, ExercisesViewState>(
          builder: (context, state) => const Center(
            child: Text('Exercises'),
          ),
        ),
      ),
    );
  }
}
