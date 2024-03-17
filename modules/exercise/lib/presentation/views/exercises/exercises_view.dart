import 'package:common/extensions/build_context_extension.dart';
import 'package:common/presentation/widgets/snackbar.dart';
import 'package:exercise/di/exercise_di.dart';
import 'package:exercise/presentation/views/exercise/exercise_view.dart';
import 'package:exercise/presentation/views/exercises/exercises_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        child: BlocConsumer<ExercisesViewCubit, ExercisesViewState>(
          listenWhen: (previous, current) =>
              previous.showSnackbar != current.showSnackbar,
          listener: (context, state) {
            if (state.showSnackbar) {
              showSnackBar(context, state.snackbarMessage);
              context.read<ExercisesViewCubit>().toggleSnackbar();
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: state.exercises.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () => context.push(
                      ExerciseView.route,
                      extra: state.exercises[index],
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.exercises[index].name,
                                  style: context.titleMedium!.copyWith(
                                    color: context.primary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      textAlign: TextAlign.left,
                                      state.exercises[index].muscle.value,
                                      style: context.bodyMedium!.copyWith(
                                        color: context.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      state.exercises[index].difficulty.value,
                                      style: context.bodySmall!.copyWith(
                                        color: context.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: context.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
