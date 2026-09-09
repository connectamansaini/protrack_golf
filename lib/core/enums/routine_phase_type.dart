/// The stages a generated `PracticeRoutine` moves through for a bucket of
/// balls.
enum RoutinePhaseType {
  warmUp,
  stockCalibration,
  longGame,
  simulatedPressure;

  String get label => switch (this) {
    RoutinePhaseType.warmUp => 'Warm-up',
    RoutinePhaseType.stockCalibration => 'Stock Calibration',
    RoutinePhaseType.longGame => 'Long Game',
    RoutinePhaseType.simulatedPressure => 'Simulated Course Pressure',
  };

  /// Parses a stored `name` (see `Enum.name`) back into a
  /// [RoutinePhaseType], falling back to [RoutinePhaseType.warmUp] if the
  /// value is unrecognized.
  static RoutinePhaseType fromName(String name) =>
      RoutinePhaseType.values.firstWhere(
        (type) => type.name == name,
        orElse: () => RoutinePhaseType.warmUp,
      );
}
