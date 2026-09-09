import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

/// In-memory `ISessionsRepository` for usecase tests. Mirrors the real
/// repository's contract: sessions come back newest-first, and a missing
/// id is a `SessionsFailure`.
class FakeSessionsRepository implements ISessionsRepository {
  FakeSessionsRepository(List<PracticeSession> sessions)
    : _sessions = [...sessions];

  final List<PracticeSession> _sessions;

  @override
  Future<Either<SessionsFailure, List<PracticeSession>>> getSessions() async {
    final sorted = [..._sessions]..sort((a, b) => b.date.compareTo(a.date));
    return Right(sorted);
  }

  @override
  Future<Either<SessionsFailure, PracticeSession>> getSessionById(
    String id,
  ) async {
    final session = _sessions.where((s) => s.id == id).firstOrNull;
    if (session == null) {
      return Left(SessionsFailure('Session $id was not found'));
    }
    return Right(session);
  }

  @override
  Future<Either<SessionsFailure, PracticeSession>> logSession(
    PracticeSession session,
  ) async {
    _sessions.add(session);
    return Right(session);
  }

  @override
  Future<Either<SessionsFailure, Unit>> deleteSession(String id) async {
    _sessions.removeWhere((s) => s.id == id);
    return const Right(unit);
  }
}
