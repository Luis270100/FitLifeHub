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

  ExercisesViewState copyWith({
    bool? isLoading,
    List<Exercise>? exercises,
    bool? showSnackbar,
    String? snackbarMessage,
  }) =>
      ExercisesViewState(
        isLoading: isLoading ?? this.isLoading,
        exercises: exercises ?? this.exercises,
        showSnackbar: showSnackbar ?? this.showSnackbar,
        snackbarMessage: snackbarMessage ?? this.snackbarMessage,
      );

  @override
  List<Object> get props => [
        isLoading,
        exercises,
        showSnackbar,
        snackbarMessage,
      ];
}
