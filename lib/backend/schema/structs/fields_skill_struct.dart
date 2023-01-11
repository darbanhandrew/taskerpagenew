import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'fields_skill_struct.g.dart';

abstract class FieldsSkillStruct
    implements Built<FieldsSkillStruct, FieldsSkillStructBuilder> {
  static Serializer<FieldsSkillStruct> get serializer =>
      _$fieldsSkillStructSerializer;

  @BuiltValueField(wireName: 'field_ref')
  DocumentReference? get fieldRef;

  @BuiltValueField(wireName: 'skill_ref')
  DocumentReference? get skillRef;

  @BuiltValueField(wireName: 'category_ref')
  DocumentReference? get categoryRef;

  bool? get value;

  BuiltList<String>? get values;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(FieldsSkillStructBuilder builder) => builder
    ..value = false
    ..values = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  FieldsSkillStruct._();
  factory FieldsSkillStruct([void Function(FieldsSkillStructBuilder) updates]) =
      _$FieldsSkillStruct;
}

FieldsSkillStruct createFieldsSkillStruct({
  DocumentReference? fieldRef,
  DocumentReference? skillRef,
  DocumentReference? categoryRef,
  bool? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FieldsSkillStruct(
      (f) => f
        ..fieldRef = fieldRef
        ..skillRef = skillRef
        ..categoryRef = categoryRef
        ..value = value
        ..values = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

FieldsSkillStruct? updateFieldsSkillStruct(
  FieldsSkillStruct? fieldsSkill, {
  bool clearUnsetFields = true,
}) =>
    fieldsSkill != null
        ? (fieldsSkill.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addFieldsSkillStructData(
  Map<String, dynamic> firestoreData,
  FieldsSkillStruct? fieldsSkill,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fieldsSkill == null) {
    return;
  }
  if (fieldsSkill.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && fieldsSkill.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fieldsSkillData =
      getFieldsSkillFirestoreData(fieldsSkill, forFieldValue);
  final nestedData =
      fieldsSkillData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = fieldsSkill.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getFieldsSkillFirestoreData(
  FieldsSkillStruct? fieldsSkill, [
  bool forFieldValue = false,
]) {
  if (fieldsSkill == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(FieldsSkillStruct.serializer, fieldsSkill);

  // Add any Firestore field values
  fieldsSkill.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFieldsSkillListFirestoreData(
  List<FieldsSkillStruct>? fieldsSkills,
) =>
    fieldsSkills?.map((f) => getFieldsSkillFirestoreData(f, true)).toList() ??
    [];
