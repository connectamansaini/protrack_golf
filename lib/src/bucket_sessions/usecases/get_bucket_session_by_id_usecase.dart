import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_repository.dart';
import 'package:protrack_golf/src/bucket_sessions/entities/bucket_session.dart';
import 'package:protrack_golf/src/bucket_sessions/helpers/bucket_sessions_failure.dart';

class GetBucketSessionByIdUsecase {
  GetBucketSessionByIdUsecase(this._repository);

  final IBucketSessionsRepository _repository;

  Future<Either<BucketSessionsFailure, BucketSession>> call(String id) =>
      _repository.getSessionById(id);
}
