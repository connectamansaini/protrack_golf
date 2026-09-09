import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_data_source.dart';
import 'package:protrack_golf/src/bucket_sessions/entities/bucket_session.dart';
import 'package:protrack_golf/src/bucket_sessions/entities/shot_log.dart';
import 'package:protrack_golf/src/bucket_sessions/helpers/bucket_sessions_failure.dart';
import 'package:protrack_golf/src/bucket_sessions/models/bucket_session_model.dart';

/// Domain-facing contract for the bucket-sessions feature. Never throws -
/// always returns an [Either].
abstract interface class IBucketSessionsRepository {
  Future<Either<BucketSessionsFailure, List<BucketSession>>> getSessions();

  Future<Either<BucketSessionsFailure, BucketSession>> getSessionById(
    String id,
  );

  Future<Either<BucketSessionsFailure, BucketSession>> saveSession(
    BucketSession session,
  );

  /// Appends [shot] to the session's shot list and persists the result -
  /// the read-modify-write behind the 2-tap shot logger's fast path.
  Future<Either<BucketSessionsFailure, BucketSession>> logShot(
    String sessionId,
    ShotLog shot,
  );

  Future<Either<BucketSessionsFailure, Unit>> deleteSession(String id);
}

class BucketSessionsRepository implements IBucketSessionsRepository {
  BucketSessionsRepository(this._dataSource);

  final BucketSessionsDataSource _dataSource;

  @override
  Future<Either<BucketSessionsFailure, List<BucketSession>>>
  getSessions() async {
    try {
      final models = await _dataSource.getSessions();
      final sessions = models.map((model) => model.toEntity).toList()
        ..sort((a, b) => b.date.compareTo(a.date));
      return Right(sessions);
    } on BucketSessionsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<BucketSessionsFailure, BucketSession>> getSessionById(
    String id,
  ) async {
    try {
      final model = await _dataSource.getSessionById(id);
      return Right(model.toEntity);
    } on BucketSessionsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<BucketSessionsFailure, BucketSession>> saveSession(
    BucketSession session,
  ) async {
    try {
      final entity = session.id.isEmpty
          ? session.copyWith(id: IdGenerator.generate())
          : session;
      await _dataSource.saveSession(BucketSessionModel.fromEntity(entity));
      return Right(entity);
    } on BucketSessionsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<BucketSessionsFailure, BucketSession>> logShot(
    String sessionId,
    ShotLog shot,
  ) async {
    try {
      final model = await _dataSource.getSessionById(sessionId);
      final session = model.toEntity;
      final updated = session.copyWith(shots: [...session.shots, shot]);
      await _dataSource.saveSession(BucketSessionModel.fromEntity(updated));
      return Right(updated);
    } on BucketSessionsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<BucketSessionsFailure, Unit>> deleteSession(String id) async {
    try {
      await _dataSource.deleteSession(id);
      return const Right(unit);
    } on BucketSessionsFailure catch (failure) {
      return Left(failure);
    }
  }
}
