import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_status.freezed.dart';

/// Generic presentation-layer status union shared by every feature.
///
/// Each feature exposes its own status name via a typedef in
/// `helpers/<feature>_status.dart`, for example:
/// `typedef LocationsStatus = AppStatus<LocationsFailure>;`
/// so bloc states stay readable, while the branching logic (initial,
/// loading, failure, empty, success) lives here once.
@freezed
sealed class AppStatus<F> with _$AppStatus<F> {
  const factory AppStatus.initial() = AppStatusInitial<F>;
  const factory AppStatus.loading() = AppStatusLoading<F>;
  const factory AppStatus.success() = AppStatusSuccess<F>;
  const factory AppStatus.empty() = AppStatusEmpty<F>;
  const factory AppStatus.failure(F failure) = AppStatusFailure<F>;
}
