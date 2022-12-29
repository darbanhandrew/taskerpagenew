import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'tasker_type_struct.g.dart';

abstract class TaskerTypeStruct
    implements Built<TaskerTypeStruct, TaskerTypeStructBuilder> {
  static Serializer<TaskerTypeStruct> get serializer =>
      _$taskerTypeStructSerializer;

  String? get gender;

  @BuiltValueField(wireName: 'tasker_age_start')
  int? get taskerAgeStart;

  @BuiltValueField(wireName: 'tasker_age_end')
  int? get taskerAgeEnd;

  bool? get identified;

  @BuiltValueField(wireName: 'years_of_experience')
  int? get yearsOfExperience;

  BuiltList<String>? get languages;

  bool? get insuranced;

  @BuiltValueField(wireName: 'drivers_license')
  String? get driversLicense;

  @BuiltValueField(wireName: 'max_tasker_distance')
  double? get maxTaskerDistance;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(TaskerTypeStructBuilder builder) => builder
    ..gender = ''
    ..taskerAgeStart = 0
    ..taskerAgeEnd = 0
    ..identified = false
    ..yearsOfExperience = 0
    ..languages = ListBuilder()
    ..insuranced = false
    ..driversLicense = ''
    ..maxTaskerDistance = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  TaskerTypeStruct._();
  factory TaskerTypeStruct([void Function(TaskerTypeStructBuilder) updates]) =
      _$TaskerTypeStruct;
}

TaskerTypeStruct createTaskerTypeStruct({
  String? gender,
  int? taskerAgeStart,
  int? taskerAgeEnd,
  bool? identified,
  int? yearsOfExperience,
  bool? insuranced,
  String? driversLicense,
  double? maxTaskerDistance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskerTypeStruct(
      (t) => t
        ..gender = gender
        ..taskerAgeStart = taskerAgeStart
        ..taskerAgeEnd = taskerAgeEnd
        ..identified = identified
        ..yearsOfExperience = yearsOfExperience
        ..languages = null
        ..insuranced = insuranced
        ..driversLicense = driversLicense
        ..maxTaskerDistance = maxTaskerDistance
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

TaskerTypeStruct? updateTaskerTypeStruct(
  TaskerTypeStruct? taskerType, {
  bool clearUnsetFields = true,
}) =>
    taskerType != null
        ? (taskerType.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addTaskerTypeStructData(
  Map<String, dynamic> firestoreData,
  TaskerTypeStruct? taskerType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (taskerType == null) {
    return;
  }
  if (taskerType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && taskerType.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskerTypeData = getTaskerTypeFirestoreData(taskerType, forFieldValue);
  final nestedData = taskerTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = taskerType.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getTaskerTypeFirestoreData(
  TaskerTypeStruct? taskerType, [
  bool forFieldValue = false,
]) {
  if (taskerType == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(TaskerTypeStruct.serializer, taskerType);

  // Add any Firestore field values
  taskerType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskerTypeListFirestoreData(
  List<TaskerTypeStruct>? taskerTypes,
) =>
    taskerTypes?.map((t) => getTaskerTypeFirestoreData(t, true)).toList() ?? [];
