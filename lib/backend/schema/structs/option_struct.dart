import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'option_struct.g.dart';

abstract class OptionStruct
    implements Built<OptionStruct, OptionStructBuilder> {
  static Serializer<OptionStruct> get serializer => _$optionStructSerializer;

  String? get name;

  int? get order;

  @BuiltValueField(wireName: 'is_single')
  bool? get isSingle;

  String? get value;

  BuiltList<String>? get values;

  String? get type;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(OptionStructBuilder builder) => builder
    ..name = ''
    ..order = 0
    ..isSingle = false
    ..value = ''
    ..values = ListBuilder()
    ..type = ''
    ..firestoreUtilData = FirestoreUtilData();

  OptionStruct._();
  factory OptionStruct([void Function(OptionStructBuilder) updates]) =
      _$OptionStruct;
}

OptionStruct createOptionStruct({
  String? name,
  int? order,
  bool? isSingle,
  String? value,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OptionStruct(
      (o) => o
        ..name = name
        ..order = order
        ..isSingle = isSingle
        ..value = value
        ..values = null
        ..type = type
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

OptionStruct? updateOptionStruct(
  OptionStruct? option, {
  bool clearUnsetFields = true,
}) =>
    option != null
        ? (option.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addOptionStructData(
  Map<String, dynamic> firestoreData,
  OptionStruct? option,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (option == null) {
    return;
  }
  if (option.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && option.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final optionData = getOptionFirestoreData(option, forFieldValue);
  final nestedData = optionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = option.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getOptionFirestoreData(
  OptionStruct? option, [
  bool forFieldValue = false,
]) {
  if (option == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(OptionStruct.serializer, option);

  // Add any Firestore field values
  option.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOptionListFirestoreData(
  List<OptionStruct>? options,
) =>
    options?.map((o) => getOptionFirestoreData(o, true)).toList() ?? [];
