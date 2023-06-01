DateTime fromGraphQLTimeToDartDateTime(String date) => DateTime.parse(date);

String fromDartDateTimeToGraphQLTime(DateTime date) => date.toIso8601String();
