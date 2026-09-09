import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/routines/helpers/routines_failure.dart';
import 'package:protrack_golf/src/routines/routines_repository.dart';

class DeleteRoutineUsecase {
  DeleteRoutineUsecase(this._repository);

  final IRoutinesRepository _repository;

  Future<Either<RoutinesFailure, Unit>> call(String id) =>
      _repository.deleteRoutine(id);
}
