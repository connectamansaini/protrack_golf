import 'package:injectable/injectable.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/src/progress/usecases/get_club_trends_usecase.dart';

/// Domain-only feature: per-club distance trends computed from sessions,
/// consumed by My Bag's club detail chart. It has no screens of its own.
@module
abstract class ProgressInjectableModule {
  @lazySingleton
  GetClubTrendsUsecase get getClubTrendsUsecase =>
      GetClubTrendsUsecase(getIt());
}
