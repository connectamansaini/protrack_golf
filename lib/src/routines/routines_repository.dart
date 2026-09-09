import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/routines/entities/practice_routine.dart';
import 'package:protrack_golf/src/routines/helpers/routines_failure.dart';
import 'package:protrack_golf/src/routines/models/practice_routine_model.dart';
import 'package:protrack_golf/src/routines/routines_data_source.dart';

/// Domain-facing contract for the routines feature. Never throws - always
/// returns an [Either].
abstract interface class IRoutinesRepository {
  Future<Either<RoutinesFailure, List<PracticeRoutine>>> getRoutines();

  Future<Either<RoutinesFailure, PracticeRoutine>> getRoutineById(String id);

  Future<Either<RoutinesFailure, PracticeRoutine>> saveRoutine(
    PracticeRoutine routine,
  );

  Future<Either<RoutinesFailure, Unit>> deleteRoutine(String id);
}

class RoutinesRepository implements IRoutinesRepository {
  RoutinesRepository(this._dataSource);

  final RoutinesDataSource _dataSource;

  @override
  Future<Either<RoutinesFailure, List<PracticeRoutine>>> getRoutines() async {
    try {
      final models = await _dataSource.getRoutines();
      final routines = models.map((model) => model.toEntity).toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return Right(routines);
    } on RoutinesFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<RoutinesFailure, PracticeRoutine>> getRoutineById(
    String id,
  ) async {
    try {
      final model = await _dataSource.getRoutineById(id);
      return Right(model.toEntity);
    } on RoutinesFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<RoutinesFailure, PracticeRoutine>> saveRoutine(
    PracticeRoutine routine,
  ) async {
    try {
      final entity = routine.id.isEmpty
          ? routine.copyWith(id: IdGenerator.generate())
          : routine;
      await _dataSource.saveRoutine(PracticeRoutineModel.fromEntity(entity));
      return Right(entity);
    } on RoutinesFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<RoutinesFailure, Unit>> deleteRoutine(String id) async {
    try {
      await _dataSource.deleteRoutine(id);
      return const Right(unit);
    } on RoutinesFailure catch (failure) {
      return Left(failure);
    }
  }
}
