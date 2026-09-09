import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/routines/routines_data_source.dart';
import 'package:protrack_golf/src/routines/routines_repository.dart';
import 'package:protrack_golf/src/routines/usecases/delete_routine_usecase.dart';
import 'package:protrack_golf/src/routines/usecases/get_routine_by_id_usecase.dart';
import 'package:protrack_golf/src/routines/usecases/get_routines_usecase.dart';
import 'package:protrack_golf/src/routines/usecases/save_routine_usecase.dart';

@module
abstract class RoutinesInjectableModule {
  @lazySingleton
  RoutinesDataSource get dataSource => RoutinesDataSource(
    getIt<Box<Map<dynamic, dynamic>>>(instanceName: HiveBoxNames.routines),
  );

  @LazySingleton(as: IRoutinesRepository)
  RoutinesRepository get repository => RoutinesRepository(getIt());

  @lazySingleton
  GetRoutinesUsecase get getRoutinesUsecase => GetRoutinesUsecase(getIt());

  @lazySingleton
  GetRoutineByIdUsecase get getRoutineByIdUsecase =>
      GetRoutineByIdUsecase(getIt());

  @lazySingleton
  SaveRoutineUsecase get saveRoutineUsecase => SaveRoutineUsecase(getIt());

  @lazySingleton
  DeleteRoutineUsecase get deleteRoutineUsecase =>
      DeleteRoutineUsecase(getIt());
}
