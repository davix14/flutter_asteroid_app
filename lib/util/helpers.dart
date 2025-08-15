// TODO: create unit tests for these helpers
extension AsteroidDates on DateTime{
  String getFormattedDate() {
    final split = toString().split(' ');
    return split.first;
  }

  DateTime dateFromString(String dateString) {
    final splits = dateString.split('-');
    return DateTime(
      int.parse(splits.first),
      int.parse(splits[1]),
      int.parse(splits[2]),
    );
  }
}


String getFormattedDate(DateTime dateTime) {
  final split = dateTime.toString().split(' ');
  return split.first;
}

DateTime dateFromString(String dateString) {
  final splits = dateString.split('-');
  return DateTime(
    int.parse(splits.first),
    int.parse(splits[1]),
    int.parse(splits[2]),
  );
}