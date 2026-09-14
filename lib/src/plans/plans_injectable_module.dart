import 'package:injectable/injectable.dart';
import 'package:protrack_golf/src/plans/usecases/build_session_plan_usecase.dart';
import 'package:protrack_golf/src/plans/usecases/get_session_templates_usecase.dart';

/// Structured range-session templates and the planner that fits one to a
/// bucket. Domain plus widgets only: the range logger hosts the screens.
@module
abstract class PlansInjectableModule {
  @lazySingleton
  GetSessionTemplatesUsecase get getSessionTemplatesUsecase =>
      const GetSessionTemplatesUsecase();

  @lazySingleton
  BuildSessionPlanUsecase get buildSessionPlanUsecase =>
      const BuildSessionPlanUsecase();
}
