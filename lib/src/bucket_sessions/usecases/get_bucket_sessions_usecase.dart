import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_repository.dart';
import 'package:protrack_golf/src/bucket_sessions/entities/bucket_session.dart';
import 'package:protrack_golf/src/bucket_sessions/helpers/bucket_sessions_failure.dart';

class GetBucketSessionsUsecase {
  GetBucketSessionsUsecase(this._repository);

  final IBucketSessionsRepository _repository;

  Future<Either<BucketSessionsFailure, List<BucketSession>>> call() =>
      _repository.getSessions();
}
