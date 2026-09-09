import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_failure.dart';
import 'package:protrack_golf/src/sessions/models/practice_session_model.dart';
import 'package:protrack_golf/src/sessions/sessions_data_source.dart';

/// Domain-facing contract for the sessions feature. Never throws - always
/// returns an [Either].
abstract interface class ISessionsRepository {
  Future<Either<SessionsFailure, List<PracticeSession>>> getSessions();

  Future<Either<SessionsFailure, PracticeSession>> getSessionById(String id);

  Future<Either<SessionsFailure, PracticeSession>> logSession(
    PracticeSession session,
  );

  Future<Either<SessionsFailure, Unit>> deleteSession(String id);
}

class SessionsRepository implements ISessionsRepository {
  SessionsRepository(this._dataSource);

  final SessionsDataSource _dataSource;

  @override
  Future<Either<SessionsFailure, List<PracticeSession>>> getSessions() async {
    try {
      final models = await _dataSource.getSessions();
      final sessions = models.map((model) => model.toEntity).toList()
        ..sort((a, b) => b.date.compareTo(a.date));
      return Right(sessions);
    } on SessionsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<SessionsFailure, PracticeSession>> getSessionById(
    String id,
  ) async {
    try {
      final model = await _dataSource.getSessionById(id);
      return Right(model.toEntity);
    } on SessionsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<SessionsFailure, PracticeSession>> logSession(
    PracticeSession session,
  ) async {
    try {
      final entity = session.id.isEmpty
          ? session.copyWith(id: IdGenerator.generate())
          : session;
      await _dataSource.saveSession(PracticeSessionModel.fromEntity(entity));
      return Right(entity);
    } on SessionsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<SessionsFailure, Unit>> deleteSession(String id) async {
    try {
      await _dataSource.deleteSession(id);
      return const Right(unit);
    } on SessionsFailure catch (failure) {
      return Left(failure);
    }
  }
}
