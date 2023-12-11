part of 'exercises_view_cubit.dart';

class ExercisesViewState extends Equatable {
  const ExercisesViewState({
    this.isLoading = false,
    this.exercises = const [],
    this.showSnackbar = false,
    this.snackbarMessage = '',
  });

  final bool isLoading;
  final List<Exercise> exercises;
  final bool showSnackbar;
  final String snackbarMessage;

  @override
  List<Object> get props => [
        isLoading,
        exercises,
        showSnackbar,
        snackbarMessage,
      ];
}
