import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'skill_detail_struct.g.dart';

abstract class SkillDetailStruct
    implements Built<SkillDetailStruct, SkillDetailStructBuilder> {
  static Serializer<SkillDetailStruct> get serializer =>
      _$skillDetailStructSerializer;

  @BuiltValueField(wireName: 'skill_category')
  DocumentReference? get skillCategory;

  @BuiltValueField(wireName: 'user_skill_ref')
  DocumentReference? get userSkillRef;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(SkillDetailStructBuilder builder) =>
      builder..firestoreUtilData = FirestoreUtilData();

  SkillDetailStruct._();
  factory SkillDetailStruct([void Function(SkillDetailStructBuilder) updates]) =
      _$SkillDetailStruct;
}

SkillDetailStruct createSkillDetailStruct({
  DocumentReference? skillCategory,
  DocumentReference? userSkillRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SkillDetailStruct(
      (s) => s
        ..skillCategory = skillCategory
        ..userSkillRef = userSkillRef
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

SkillDetailStruct? updateSkillDetailStruct(
  SkillDetailStruct? skillDetail, {
  bool clearUnsetFields = true,
}) =>
    skillDetail != null
        ? (skillDetail.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addSkillDetailStructData(
  Map<String, dynamic> firestoreData,
  SkillDetailStruct? skillDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (skillDetail == null) {
    return;
  }
  if (skillDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && skillDetail.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final skillDetailData =
      getSkillDetailFirestoreData(skillDetail, forFieldValue);
  final nestedData =
      skillDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = skillDetail.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getSkillDetailFirestoreData(
  SkillDetailStruct? skillDetail, [
  bool forFieldValue = false,
]) {
  if (skillDetail == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(SkillDetailStruct.serializer, skillDetail);

  // Add any Firestore field values
  skillDetail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSkillDetailListFirestoreData(
  List<SkillDetailStruct>? skillDetails,
) =>
    skillDetails?.map((s) => getSkillDetailFirestoreData(s, true)).toList() ??
    [];
