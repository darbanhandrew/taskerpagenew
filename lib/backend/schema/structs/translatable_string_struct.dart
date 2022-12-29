import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'translatable_string_struct.g.dart';

abstract class TranslatableStringStruct
    implements
        Built<TranslatableStringStruct, TranslatableStringStructBuilder> {
  static Serializer<TranslatableStringStruct> get serializer =>
      _$translatableStringStructSerializer;

  DocumentReference? get language;

  String? get text;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(TranslatableStringStructBuilder builder) =>
      builder
        ..text = ''
        ..firestoreUtilData = FirestoreUtilData();

  TranslatableStringStruct._();
  factory TranslatableStringStruct(
          [void Function(TranslatableStringStructBuilder) updates]) =
      _$TranslatableStringStruct;
}

TranslatableStringStruct createTranslatableStringStruct({
  DocumentReference? language,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TranslatableStringStruct(
      (t) => t
        ..language = language
        ..text = text
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

TranslatableStringStruct? updateTranslatableStringStruct(
  TranslatableStringStruct? translatableString, {
  bool clearUnsetFields = true,
}) =>
    translatableString != null
        ? (translatableString.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addTranslatableStringStructData(
  Map<String, dynamic> firestoreData,
  TranslatableStringStruct? translatableString,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (translatableString == null) {
    return;
  }
  if (translatableString.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && translatableString.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final translatableStringData =
      getTranslatableStringFirestoreData(translatableString, forFieldValue);
  final nestedData =
      translatableStringData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = translatableString.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getTranslatableStringFirestoreData(
  TranslatableStringStruct? translatableString, [
  bool forFieldValue = false,
]) {
  if (translatableString == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      TranslatableStringStruct.serializer, translatableString);

  // Add any Firestore field values
  translatableString.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTranslatableStringListFirestoreData(
  List<TranslatableStringStruct>? translatableStrings,
) =>
    translatableStrings
        ?.map((t) => getTranslatableStringFirestoreData(t, true))
        .toList() ??
    [];
