/// Small date-formatting helpers so views never build date strings inline.
abstract final class DateFormatter {
  const DateFormatter._();

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Formats [date] as `Aug 30, 2026`.
  static String mediumDate(DateTime date) =>
      '${_months[date.month - 1]} ${date.day}, ${date.year}';

  /// Formats [date] as `Aug 30`.
  static String shortDate(DateTime date) =>
      '${_months[date.month - 1]} ${date.day}';

  /// The three-letter month of [date], e.g. `Aug`.
  static String shortMonth(DateTime date) => _months[date.month - 1];
}
