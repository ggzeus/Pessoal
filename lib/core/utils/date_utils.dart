class AppDateUtils {
  const AppDateUtils._();

  static DateTime startOfDay(DateTime date) => DateTime(date.year, date.month, date.day);

  static DateTime endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

  static DateTime startOfMonth(DateTime date) => DateTime(date.year, date.month);

  static DateTime startOfNextMonth(DateTime date) =>
      date.month == 12 ? DateTime(date.year + 1) : DateTime(date.year, date.month + 1);

  static DateTime startOfWeek(DateTime date) {
    final day = startOfDay(date);
    return day.subtract(Duration(days: day.weekday - 1));
  }

  static int minutesFromClock(String clock) {
    final parts = clock.split(':');
    return int.parse(parts[0]) * 60 + int.parse(parts[1]);
  }

  static String clockFromMinutes(int minutes) {
    final h = (minutes ~/ 60).toString().padLeft(2, '0');
    final m = (minutes % 60).toString().padLeft(2, '0');
    return '$h:$m';
  }
}
