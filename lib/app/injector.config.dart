// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_data_source.dart'
    as _i497;
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_injectable_module.dart'
    as _i459;
import 'package:protrack_golf/src/bucket_sessions/bucket_sessions_repository.dart'
    as _i302;
import 'package:protrack_golf/src/bucket_sessions/usecases/delete_bucket_session_usecase.dart'
    as _i618;
import 'package:protrack_golf/src/bucket_sessions/usecases/get_bucket_session_by_id_usecase.dart'
    as _i420;
import 'package:protrack_golf/src/bucket_sessions/usecases/get_bucket_sessions_usecase.dart'
    as _i184;
import 'package:protrack_golf/src/bucket_sessions/usecases/log_shot_usecase.dart'
    as _i617;
import 'package:protrack_golf/src/bucket_sessions/usecases/save_bucket_session_usecase.dart'
    as _i748;
import 'package:protrack_golf/src/locations/bloc/locations_bloc.dart' as _i205;
import 'package:protrack_golf/src/locations/locations_data_source.dart'
    as _i361;
import 'package:protrack_golf/src/locations/locations_injectable_module.dart'
    as _i578;
import 'package:protrack_golf/src/locations/locations_repository.dart' as _i449;
import 'package:protrack_golf/src/locations/usecases/add_location_usecase.dart'
    as _i921;
import 'package:protrack_golf/src/locations/usecases/delete_location_usecase.dart'
    as _i734;
import 'package:protrack_golf/src/locations/usecases/get_locations_usecase.dart'
    as _i818;
import 'package:protrack_golf/src/my_bag/bloc/club_detail_bloc.dart' as _i728;
import 'package:protrack_golf/src/my_bag/bloc/my_bag_bloc.dart' as _i120;
import 'package:protrack_golf/src/my_bag/my_bag_data_source.dart' as _i57;
import 'package:protrack_golf/src/my_bag/my_bag_injectable_module.dart'
    as _i547;
import 'package:protrack_golf/src/my_bag/my_bag_repository.dart' as _i202;
import 'package:protrack_golf/src/my_bag/usecases/get_bag_clubs_usecase.dart'
    as _i960;
import 'package:protrack_golf/src/my_bag/usecases/get_club_distance_records_usecase.dart'
    as _i245;
import 'package:protrack_golf/src/my_bag/usecases/get_club_session_history_usecase.dart'
    as _i727;
import 'package:protrack_golf/src/my_bag/usecases/remove_bag_club_usecase.dart'
    as _i766;
import 'package:protrack_golf/src/my_bag/usecases/save_bag_club_usecase.dart'
    as _i975;
import 'package:protrack_golf/src/progress/progress_injectable_module.dart'
    as _i869;
import 'package:protrack_golf/src/progress/usecases/get_club_trends_usecase.dart'
    as _i136;
import 'package:protrack_golf/src/routines/routines_data_source.dart' as _i634;
import 'package:protrack_golf/src/routines/routines_injectable_module.dart'
    as _i50;
import 'package:protrack_golf/src/routines/routines_repository.dart' as _i903;
import 'package:protrack_golf/src/routines/usecases/delete_routine_usecase.dart'
    as _i1009;
import 'package:protrack_golf/src/routines/usecases/get_routine_by_id_usecase.dart'
    as _i716;
import 'package:protrack_golf/src/routines/usecases/get_routines_usecase.dart'
    as _i749;
import 'package:protrack_golf/src/routines/usecases/save_routine_usecase.dart'
    as _i230;
import 'package:protrack_golf/src/sessions/bloc/range_logger_bloc.dart'
    as _i418;
import 'package:protrack_golf/src/sessions/bloc/session_detail_bloc.dart'
    as _i282;
import 'package:protrack_golf/src/sessions/bloc/session_form_bloc.dart'
    as _i363;
import 'package:protrack_golf/src/sessions/bloc/session_recap_bloc.dart'
    as _i714;
import 'package:protrack_golf/src/sessions/bloc/sessions_bloc.dart' as _i5;
import 'package:protrack_golf/src/sessions/media_storage_service.dart' as _i994;
import 'package:protrack_golf/src/sessions/sessions_data_source.dart' as _i105;
import 'package:protrack_golf/src/sessions/sessions_injectable_module.dart'
    as _i196;
import 'package:protrack_golf/src/sessions/sessions_repository.dart' as _i900;
import 'package:protrack_golf/src/sessions/usecases/delete_session_usecase.dart'
    as _i587;
import 'package:protrack_golf/src/sessions/usecases/get_session_by_id_usecase.dart'
    as _i586;
import 'package:protrack_golf/src/sessions/usecases/get_session_recap_usecase.dart'
    as _i868;
import 'package:protrack_golf/src/sessions/usecases/get_sessions_usecase.dart'
    as _i253;
import 'package:protrack_golf/src/sessions/usecases/log_session_usecase.dart'
    as _i851;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final locationsInjectableModule = _$LocationsInjectableModule();
    final myBagInjectableModule = _$MyBagInjectableModule();
    final sessionsInjectableModule = _$SessionsInjectableModule();
    final bucketSessionsInjectableModule = _$BucketSessionsInjectableModule();
    final progressInjectableModule = _$ProgressInjectableModule();
    final routinesInjectableModule = _$RoutinesInjectableModule();
    gh.factory<_i205.LocationsBloc>(
      () => locationsInjectableModule.locationsBloc,
    );
    gh.factory<_i120.MyBagBloc>(() => myBagInjectableModule.myBagBloc);
    gh.factory<_i728.ClubDetailBloc>(
      () => myBagInjectableModule.clubDetailBloc,
    );
    gh.factory<_i5.SessionsBloc>(() => sessionsInjectableModule.sessionsBloc);
    gh.factory<_i282.SessionDetailBloc>(
      () => sessionsInjectableModule.sessionDetailBloc,
    );
    gh.factory<_i363.SessionFormBloc>(
      () => sessionsInjectableModule.sessionFormBloc,
    );
    gh.factory<_i418.RangeLoggerBloc>(
      () => sessionsInjectableModule.rangeLoggerBloc,
    );
    gh.factory<_i714.SessionRecapBloc>(
      () => sessionsInjectableModule.sessionRecapBloc,
    );
    gh.lazySingleton<_i497.BucketSessionsDataSource>(
      () => bucketSessionsInjectableModule.dataSource,
    );
    gh.lazySingleton<_i184.GetBucketSessionsUsecase>(
      () => bucketSessionsInjectableModule.getBucketSessionsUsecase,
    );
    gh.lazySingleton<_i420.GetBucketSessionByIdUsecase>(
      () => bucketSessionsInjectableModule.getBucketSessionByIdUsecase,
    );
    gh.lazySingleton<_i748.SaveBucketSessionUsecase>(
      () => bucketSessionsInjectableModule.saveBucketSessionUsecase,
    );
    gh.lazySingleton<_i617.LogShotUsecase>(
      () => bucketSessionsInjectableModule.logShotUsecase,
    );
    gh.lazySingleton<_i618.DeleteBucketSessionUsecase>(
      () => bucketSessionsInjectableModule.deleteBucketSessionUsecase,
    );
    gh.lazySingleton<_i361.LocationsDataSource>(
      () => locationsInjectableModule.dataSource,
    );
    gh.lazySingleton<_i818.GetLocationsUsecase>(
      () => locationsInjectableModule.getLocationsUsecase,
    );
    gh.lazySingleton<_i921.AddLocationUsecase>(
      () => locationsInjectableModule.addLocationUsecase,
    );
    gh.lazySingleton<_i734.DeleteLocationUsecase>(
      () => locationsInjectableModule.deleteLocationUsecase,
    );
    gh.lazySingleton<_i57.MyBagDataSource>(
      () => myBagInjectableModule.dataSource,
    );
    gh.lazySingleton<_i960.GetBagClubsUsecase>(
      () => myBagInjectableModule.getBagClubsUsecase,
    );
    gh.lazySingleton<_i975.SaveBagClubUsecase>(
      () => myBagInjectableModule.saveBagClubUsecase,
    );
    gh.lazySingleton<_i766.RemoveBagClubUsecase>(
      () => myBagInjectableModule.removeBagClubUsecase,
    );
    gh.lazySingleton<_i245.GetClubDistanceRecordsUsecase>(
      () => myBagInjectableModule.getClubDistanceRecordsUsecase,
    );
    gh.lazySingleton<_i727.GetClubSessionHistoryUsecase>(
      () => myBagInjectableModule.getClubSessionHistoryUsecase,
    );
    gh.lazySingleton<_i136.GetClubTrendsUsecase>(
      () => progressInjectableModule.getClubTrendsUsecase,
    );
    gh.lazySingleton<_i634.RoutinesDataSource>(
      () => routinesInjectableModule.dataSource,
    );
    gh.lazySingleton<_i749.GetRoutinesUsecase>(
      () => routinesInjectableModule.getRoutinesUsecase,
    );
    gh.lazySingleton<_i716.GetRoutineByIdUsecase>(
      () => routinesInjectableModule.getRoutineByIdUsecase,
    );
    gh.lazySingleton<_i230.SaveRoutineUsecase>(
      () => routinesInjectableModule.saveRoutineUsecase,
    );
    gh.lazySingleton<_i1009.DeleteRoutineUsecase>(
      () => routinesInjectableModule.deleteRoutineUsecase,
    );
    gh.lazySingleton<_i105.SessionsDataSource>(
      () => sessionsInjectableModule.dataSource,
    );
    gh.lazySingleton<_i994.MediaStorageService>(
      () => sessionsInjectableModule.mediaStorageService,
    );
    gh.lazySingleton<_i253.GetSessionsUsecase>(
      () => sessionsInjectableModule.getSessionsUsecase,
    );
    gh.lazySingleton<_i586.GetSessionByIdUsecase>(
      () => sessionsInjectableModule.getSessionByIdUsecase,
    );
    gh.lazySingleton<_i851.LogSessionUsecase>(
      () => sessionsInjectableModule.logSessionUsecase,
    );
    gh.lazySingleton<_i587.DeleteSessionUsecase>(
      () => sessionsInjectableModule.deleteSessionUsecase,
    );
    gh.lazySingleton<_i868.GetSessionRecapUsecase>(
      () => sessionsInjectableModule.getSessionRecapUsecase,
    );
    gh.lazySingleton<_i202.IMyBagRepository>(
      () => myBagInjectableModule.repository,
    );
    gh.lazySingleton<_i903.IRoutinesRepository>(
      () => routinesInjectableModule.repository,
    );
    gh.lazySingleton<_i900.ISessionsRepository>(
      () => sessionsInjectableModule.repository,
    );
    gh.lazySingleton<_i302.IBucketSessionsRepository>(
      () => bucketSessionsInjectableModule.repository,
    );
    gh.lazySingleton<_i449.ILocationsRepository>(
      () => locationsInjectableModule.repository,
    );
    return this;
  }
}

class _$LocationsInjectableModule extends _i578.LocationsInjectableModule {}

class _$MyBagInjectableModule extends _i547.MyBagInjectableModule {}

class _$SessionsInjectableModule extends _i196.SessionsInjectableModule {}

class _$BucketSessionsInjectableModule
    extends _i459.BucketSessionsInjectableModule {}

class _$ProgressInjectableModule extends _i869.ProgressInjectableModule {}

class _$RoutinesInjectableModule extends _i50.RoutinesInjectableModule {}
