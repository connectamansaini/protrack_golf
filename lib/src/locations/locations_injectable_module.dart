import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/bloc/locations_bloc.dart';
import 'package:protrack_golf/src/locations/locations_data_source.dart';
import 'package:protrack_golf/src/locations/locations_repository.dart';
import 'package:protrack_golf/src/locations/usecases/add_location_usecase.dart';
import 'package:protrack_golf/src/locations/usecases/delete_location_usecase.dart';
import 'package:protrack_golf/src/locations/usecases/get_locations_usecase.dart';

@module
abstract class LocationsInjectableModule {
  @lazySingleton
  LocationsDataSource get dataSource => LocationsDataSource(
    getIt<Box<Map<dynamic, dynamic>>>(instanceName: HiveBoxNames.locations),
  );

  @LazySingleton(as: ILocationsRepository)
  LocationsRepository get repository => LocationsRepository(getIt());

  @lazySingleton
  GetLocationsUsecase get getLocationsUsecase => GetLocationsUsecase(getIt());

  @lazySingleton
  AddLocationUsecase get addLocationUsecase => AddLocationUsecase(getIt());

  @lazySingleton
  DeleteLocationUsecase get deleteLocationUsecase =>
      DeleteLocationUsecase(getIt());

  @injectable
  LocationsBloc get locationsBloc => LocationsBloc(getIt(), getIt(), getIt());
}
