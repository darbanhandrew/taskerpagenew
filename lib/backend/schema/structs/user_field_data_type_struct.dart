import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_field_data_type_struct.g.dart';

abstract class UserFieldDataTypeStruct
    implements Built<UserFieldDataTypeStruct, UserFieldDataTypeStructBuilder> {
  static Serializer<UserFieldDataTypeStruct> get serializer =>
      _$userFieldDataTypeStructSerializer;

  @BuiltValueField(wireName: 'user_field_ref')
  DocumentReference? get userFieldRef;

  bool? get value;

  BuiltList<String>? get values;

  @BuiltValueField(wireName: 'field_ref')
  DocumentReference? get fieldRef;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(UserFieldDataTypeStructBuilder builder) =>
      builder
        ..value = false
        ..values = ListBuilder()
        ..firestoreUtilData = FirestoreUtilData();

  UserFieldDataTypeStruct._();
  factory UserFieldDataTypeStruct(
          [void Function(UserFieldDataTypeStructBuilder) updates]) =
      _$UserFieldDataTypeStruct;
}

UserFieldDataTypeStruct createUserFieldDataTypeStruct({
  DocumentReference? userFieldRef,
  bool? value,
  DocumentReference? fieldRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserFieldDataTypeStruct(
      (u) => u
        ..userFieldRef = userFieldRef
        ..value = value
        ..values = null
        ..fieldRef = fieldRef
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

UserFieldDataTypeStruct? updateUserFieldDataTypeStruct(
  UserFieldDataTypeStruct? userFieldDataType, {
  bool clearUnsetFields = true,
}) =>
    userFieldDataType != null
        ? (userFieldDataType.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addUserFieldDataTypeStructData(
  Map<String, dynamic> firestoreData,
  UserFieldDataTypeStruct? userFieldDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userFieldDataType == null) {
    return;
  }
  if (userFieldDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && userFieldDataType.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userFieldDataTypeData =
      getUserFieldDataTypeFirestoreData(userFieldDataType, forFieldValue);
  final nestedData =
      userFieldDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = userFieldDataType.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getUserFieldDataTypeFirestoreData(
  UserFieldDataTypeStruct? userFieldDataType, [
  bool forFieldValue = false,
]) {
  if (userFieldDataType == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      UserFieldDataTypeStruct.serializer, userFieldDataType);

  // Add any Firestore field values
  userFieldDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserFieldDataTypeListFirestoreData(
  List<UserFieldDataTypeStruct>? userFieldDataTypes,
) =>
    userFieldDataTypes
        ?.map((u) => getUserFieldDataTypeFirestoreData(u, true))
        .toList() ??
    [];
