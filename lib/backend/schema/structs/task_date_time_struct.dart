import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_date_time_struct.g.dart';

abstract class TaskDateTimeStruct
    implements Built<TaskDateTimeStruct, TaskDateTimeStructBuilder> {
  static Serializer<TaskDateTimeStruct> get serializer =>
      _$taskDateTimeStructSerializer;

  bool? get periodic;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  bool? get exact;

  @BuiltValueField(wireName: 'exact_start_time')
  DateTime? get exactStartTime;

  @BuiltValueField(wireName: 'type_of_period')
  String? get typeOfPeriod;

  @BuiltValueField(wireName: 'session_hour')
  int? get sessionHour;

  @BuiltValueField(wireName: 'prefered_spans')
  BuiltList<String>? get preferedSpans;

  @BuiltValueField(wireName: 'prefered_days')
  BuiltList<String>? get preferedDays;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  @BuiltValueField(wireName: 'days_per_week')
  int? get daysPerWeek;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(TaskDateTimeStructBuilder builder) => builder
    ..periodic = false
    ..exact = false
    ..typeOfPeriod = ''
    ..sessionHour = 0
    ..preferedSpans = ListBuilder()
    ..preferedDays = ListBuilder()
    ..daysPerWeek = 0
    ..firestoreUtilData = FirestoreUtilData();

  TaskDateTimeStruct._();
  factory TaskDateTimeStruct(
          [void Function(TaskDateTimeStructBuilder) updates]) =
      _$TaskDateTimeStruct;
}

TaskDateTimeStruct createTaskDateTimeStruct({
  bool? periodic,
  DateTime? startDate,
  bool? exact,
  DateTime? exactStartTime,
  String? typeOfPeriod,
  int? sessionHour,
  DateTime? endDate,
  int? daysPerWeek,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskDateTimeStruct(
      (t) => t
        ..periodic = periodic
        ..startDate = startDate
        ..exact = exact
        ..exactStartTime = exactStartTime
        ..typeOfPeriod = typeOfPeriod
        ..sessionHour = sessionHour
        ..preferedSpans = null
        ..preferedDays = null
        ..endDate = endDate
        ..daysPerWeek = daysPerWeek
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

TaskDateTimeStruct? updateTaskDateTimeStruct(
  TaskDateTimeStruct? taskDateTime, {
  bool clearUnsetFields = true,
}) =>
    taskDateTime != null
        ? (taskDateTime.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addTaskDateTimeStructData(
  Map<String, dynamic> firestoreData,
  TaskDateTimeStruct? taskDateTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (taskDateTime == null) {
    return;
  }
  if (taskDateTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && taskDateTime.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskDateTimeData =
      getTaskDateTimeFirestoreData(taskDateTime, forFieldValue);
  final nestedData =
      taskDateTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = taskDateTime.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getTaskDateTimeFirestoreData(
  TaskDateTimeStruct? taskDateTime, [
  bool forFieldValue = false,
]) {
  if (taskDateTime == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(TaskDateTimeStruct.serializer, taskDateTime);

  // Add any Firestore field values
  taskDateTime.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskDateTimeListFirestoreData(
  List<TaskDateTimeStruct>? taskDateTimes,
) =>
    taskDateTimes?.map((t) => getTaskDateTimeFirestoreData(t, true)).toList() ??
    [];
