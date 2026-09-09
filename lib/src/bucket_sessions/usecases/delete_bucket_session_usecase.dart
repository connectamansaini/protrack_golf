import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_repository.dart';
import 'package:protrack_golf/src/bucket_sessions/helpers/bucket_sessions_failure.dart';

class DeleteBucketSessionUsecase {
  DeleteBucketSessionUsecase(this._repository);

  final IBucketSessionsRepository _repository;

  Future<Either<BucketSessionsFailure, Unit>> call(String id) =>
      _repository.deleteSession(id);
}
