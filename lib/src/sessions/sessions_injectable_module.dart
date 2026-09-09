import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/bloc/range_logger_bloc.dart';
import 'package:protrack_golf/src/sessions/bloc/session_detail_bloc.dart';
import 'package:protrack_golf/src/sessions/bloc/session_form_bloc.dart';
import 'package:protrack_golf/src/sessions/bloc/session_recap_bloc.dart';
import 'package:protrack_golf/src/sessions/bloc/sessions_bloc.dart';
import 'package:protrack_golf/src/sessions/media_storage_service.dart';
import 'package:protrack_golf/src/sessions/sessions_data_source.dart';
import 'package:protrack_golf/src/sessions/sessions_repository.dart';
import 'package:protrack_golf/src/sessions/usecases/delete_session_usecase.dart';
import 'package:protrack_golf/src/sessions/usecases/get_session_by_id_usecase.dart';
import 'package:protrack_golf/src/sessions/usecases/get_session_recap_usecase.dart';
import 'package:protrack_golf/src/sessions/usecases/get_sessions_usecase.dart';
import 'package:protrack_golf/src/sessions/usecases/log_session_usecase.dart';

@module
abstract class SessionsInjectableModule {
  @lazySingleton
  SessionsDataSource get dataSource => SessionsDataSource(
    getIt<Box<Map<dynamic, dynamic>>>(instanceName: HiveBoxNames.sessions),
  );

  @LazySingleton(as: ISessionsRepository)
  SessionsRepository get repository => SessionsRepository(getIt());

  @lazySingleton
  MediaStorageService get mediaStorageService => const MediaStorageService();

  @lazySingleton
  GetSessionsUsecase get getSessionsUsecase => GetSessionsUsecase(getIt());

  @lazySingleton
  GetSessionByIdUsecase get getSessionByIdUsecase =>
      GetSessionByIdUsecase(getIt());

  @lazySingleton
  LogSessionUsecase get logSessionUsecase => LogSessionUsecase(getIt());

  @lazySingleton
  DeleteSessionUsecase get deleteSessionUsecase =>
      DeleteSessionUsecase(getIt());

  @lazySingleton
  GetSessionRecapUsecase get getSessionRecapUsecase =>
      GetSessionRecapUsecase(getIt());

  @injectable
  SessionsBloc get sessionsBloc => SessionsBloc(getIt(), getIt());

  @injectable
  SessionDetailBloc get sessionDetailBloc => SessionDetailBloc(getIt());

  @injectable
  SessionFormBloc get sessionFormBloc => SessionFormBloc(
    getIt<GetLocationsUsecase>(),
    getIt<AddLocationUsecase>(),
    getIt<LogSessionUsecase>(),
  );

  @injectable
  RangeLoggerBloc get rangeLoggerBloc => RangeLoggerBloc(
    getIt<GetLocationsUsecase>(),
    getIt<AddLocationUsecase>(),
    getIt<LogSessionUsecase>(),
    getIt<GetSessionsUsecase>(),
  );

  @injectable
  SessionRecapBloc get sessionRecapBloc => SessionRecapBloc(getIt());
}
