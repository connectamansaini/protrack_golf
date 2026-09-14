import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/plans/entities/session_template.dart';
import 'package:protrack_golf/src/plans/helpers/plans_failure.dart';
import 'package:protrack_golf/src/plans/helpers/session_templates.dart';

/// Lists the session templates the golfer can pick from. The catalogue is
/// built in for now; the usecase boundary means a future remote or
/// user-authored catalogue changes nothing above it.
class GetSessionTemplatesUsecase {
  const GetSessionTemplatesUsecase();

  Either<PlansFailure, List<SessionTemplate>> call() =>
      const Right(SessionTemplates.all);
}
