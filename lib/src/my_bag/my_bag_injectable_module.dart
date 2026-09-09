import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/bloc/club_detail_bloc.dart';
import 'package:protrack_golf/src/my_bag/bloc/my_bag_bloc.dart';
import 'package:protrack_golf/src/my_bag/my_bag_data_source.dart';
import 'package:protrack_golf/src/my_bag/my_bag_repository.dart';
import 'package:protrack_golf/src/my_bag/usecases/get_bag_clubs_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/get_club_distance_records_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/get_club_session_history_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/remove_bag_club_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/save_bag_club_usecase.dart';
import 'package:protrack_golf/src/progress/progress.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

@module
abstract class MyBagInjectableModule {
  @lazySingleton
  MyBagDataSource get dataSource => MyBagDataSource(
    getIt<Box<Map<dynamic, dynamic>>>(instanceName: HiveBoxNames.bagClubs),
  );

  @LazySingleton(as: IMyBagRepository)
  MyBagRepository get repository => MyBagRepository(getIt());

  @lazySingleton
  GetBagClubsUsecase get getBagClubsUsecase => GetBagClubsUsecase(getIt());

  @lazySingleton
  SaveBagClubUsecase get saveBagClubUsecase => SaveBagClubUsecase(getIt());

  @lazySingleton
  RemoveBagClubUsecase get removeBagClubUsecase =>
      RemoveBagClubUsecase(getIt());

  @lazySingleton
  GetClubDistanceRecordsUsecase get getClubDistanceRecordsUsecase =>
      GetClubDistanceRecordsUsecase(
        getIt<ISessionsRepository>(),
        getIt<IMyBagRepository>(),
      );

  @lazySingleton
  GetClubSessionHistoryUsecase get getClubSessionHistoryUsecase =>
      GetClubSessionHistoryUsecase(getIt());

  @injectable
  MyBagBloc get myBagBloc => MyBagBloc(
    getIt<GetClubDistanceRecordsUsecase>(),
    getIt<SaveBagClubUsecase>(),
    getIt<RemoveBagClubUsecase>(),
  );

  @injectable
  ClubDetailBloc get clubDetailBloc => ClubDetailBloc(
    getIt<GetClubDistanceRecordsUsecase>(),
    getIt<GetClubTrendsUsecase>(),
    getIt<GetClubSessionHistoryUsecase>(),
    getIt<SaveBagClubUsecase>(),
  );
}
