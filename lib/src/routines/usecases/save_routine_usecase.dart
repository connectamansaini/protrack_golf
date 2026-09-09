import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/routines/entities/practice_routine.dart';
import 'package:protrack_golf/src/routines/helpers/routines_failure.dart';
import 'package:protrack_golf/src/routines/routines_repository.dart';

class SaveRoutineUsecase {
  SaveRoutineUsecase(this._repository);

  final IRoutinesRepository _repository;

  Future<Either<RoutinesFailure, PracticeRoutine>> call(
    PracticeRoutine routine,
  ) => _repository.saveRoutine(routine);
}
