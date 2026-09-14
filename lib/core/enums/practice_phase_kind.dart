/// The building blocks of a structured range session. The first five follow
/// the classic focused-practice structure (warm up, bed in one change,
/// measure it, add pressure, then vary); [yardage] is a plain "find your
/// number" block used by the distance-dialling template.
enum PracticePhaseKind {
  warmUp,
  block,
  measured,
  pressured,
  varied,
  yardage;

  String get label => switch (this) {
    PracticePhaseKind.warmUp => 'Warm-up',
    PracticePhaseKind.block => 'Block practice',
    PracticePhaseKind.measured => 'Measured practice',
    PracticePhaseKind.pressured => 'Pressured practice',
    PracticePhaseKind.varied => 'Varied practice',
    PracticePhaseKind.yardage => 'Yardages',
  };
}
