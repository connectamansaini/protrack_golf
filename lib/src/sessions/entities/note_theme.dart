import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_theme.freezed.dart';

/// A word that keeps coming up in the golfer's session notes - e.g.
/// "slice", "thin" - with how many of the recent sessions mentioned it and
/// whether the session being recapped did too. A hint, not a diagnosis.
@freezed
abstract class NoteTheme with _$NoteTheme {
  const factory NoteTheme({
    @Default('') String keyword,
    @Default(0) int sessionCount,
    @Default(false) bool inThisSession,
  }) = _NoteTheme;

  const NoteTheme._();

  static const empty = NoteTheme();
}
