import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise/domain/entities/exercise.dart';
import 'package:exercise/domain/repository/exercise_repository.dart';

part 'exercises_view_state.dart';

class ExercisesViewCubit extends Cubit<ExercisesViewState> {
  ExercisesViewCubit(
    this._exerciseRepository,
  ) : super(const ExercisesViewState());

  final ExerciseRepository _exerciseRepository;

  Future<void> load() async {
    try {
      emit(state.copyWith(isLoading: true));
      final exercises = await _exerciseRepository.loadExercisesByFilters();

      emit(state.copyWith(isLoading: false, exercises: exercises));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          showSnackbar: true,
          snackbarMessage: e.toString(),
        ),
      );
    }
  }

  void toggleSnackbar() =>
      emit(state.copyWith(showSnackbar: !state.showSnackbar));
}
