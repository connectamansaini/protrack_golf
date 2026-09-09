import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_failure.dart';
import 'package:protrack_golf/src/sessions/sessions_repository.dart';

class DeleteSessionUsecase {
  DeleteSessionUsecase(this._repository);

  final ISessionsRepository _repository;

  Future<Either<SessionsFailure, Unit>> call(String id) =>
      _repository.deleteSession(id);
}
