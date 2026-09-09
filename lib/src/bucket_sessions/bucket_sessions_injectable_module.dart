import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_data_source.dart';
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_repository.dart';
import 'package:protrack_golf/src/bucket_sessions/usecases/delete_bucket_session_usecase.dart';
import 'package:protrack_golf/src/bucket_sessions/usecases/get_bucket_session_by_id_usecase.dart';
import 'package:protrack_golf/src/bucket_sessions/usecases/get_bucket_sessions_usecase.dart';
import 'package:protrack_golf/src/bucket_sessions/usecases/log_shot_usecase.dart';
import 'package:protrack_golf/src/bucket_sessions/usecases/save_bucket_session_usecase.dart';

@module
abstract class BucketSessionsInjectableModule {
  @lazySingleton
  BucketSessionsDataSource get dataSource => BucketSessionsDataSource(
    getIt<Box<Map<dynamic, dynamic>>>(
      instanceName: HiveBoxNames.bucketSessions,
    ),
  );

  @LazySingleton(as: IBucketSessionsRepository)
  BucketSessionsRepository get repository => BucketSessionsRepository(getIt());

  @lazySingleton
  GetBucketSessionsUsecase get getBucketSessionsUsecase =>
      GetBucketSessionsUsecase(getIt());

  @lazySingleton
  GetBucketSessionByIdUsecase get getBucketSessionByIdUsecase =>
      GetBucketSessionByIdUsecase(getIt());

  @lazySingleton
  SaveBucketSessionUsecase get saveBucketSessionUsecase =>
      SaveBucketSessionUsecase(getIt());

  @lazySingleton
  LogShotUsecase get logShotUsecase => LogShotUsecase(getIt());

  @lazySingleton
  DeleteBucketSessionUsecase get deleteBucketSessionUsecase =>
      DeleteBucketSessionUsecase(getIt());
}
