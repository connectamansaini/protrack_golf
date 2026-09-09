import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_failure.dart';
import 'package:protrack_golf/src/sessions/sessions_repository.dart';

class LogSessionUsecase {
  LogSessionUsecase(this._repository);

  final ISessionsRepository _repository;

  Future<Either<SessionsFailure, PracticeSession>> call(
    PracticeSession session,
  ) => _repository.logSession(session);
}
