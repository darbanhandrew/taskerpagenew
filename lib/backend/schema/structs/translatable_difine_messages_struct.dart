import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'translatable_difine_messages_struct.g.dart';

abstract class TranslatableDifineMessagesStruct
    implements
        Built<TranslatableDifineMessagesStruct,
            TranslatableDifineMessagesStructBuilder> {
  static Serializer<TranslatableDifineMessagesStruct> get serializer =>
      _$translatableDifineMessagesStructSerializer;

  DocumentReference? get language;

  String? get text;

  String? get messages;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(
          TranslatableDifineMessagesStructBuilder builder) =>
      builder
        ..text = ''
        ..messages = ''
        ..firestoreUtilData = FirestoreUtilData();

  TranslatableDifineMessagesStruct._();
  factory TranslatableDifineMessagesStruct(
          [void Function(TranslatableDifineMessagesStructBuilder) updates]) =
      _$TranslatableDifineMessagesStruct;
}

TranslatableDifineMessagesStruct createTranslatableDifineMessagesStruct({
  DocumentReference? language,
  String? text,
  String? messages,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TranslatableDifineMessagesStruct(
      (t) => t
        ..language = language
        ..text = text
        ..messages = messages
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

TranslatableDifineMessagesStruct? updateTranslatableDifineMessagesStruct(
  TranslatableDifineMessagesStruct? translatableDifineMessages, {
  bool clearUnsetFields = true,
}) =>
    translatableDifineMessages != null
        ? (translatableDifineMessages.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addTranslatableDifineMessagesStructData(
  Map<String, dynamic> firestoreData,
  TranslatableDifineMessagesStruct? translatableDifineMessages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (translatableDifineMessages == null) {
    return;
  }
  if (translatableDifineMessages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue &&
      translatableDifineMessages.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final translatableDifineMessagesData =
      getTranslatableDifineMessagesFirestoreData(
          translatableDifineMessages, forFieldValue);
  final nestedData = translatableDifineMessagesData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final create = translatableDifineMessages.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getTranslatableDifineMessagesFirestoreData(
  TranslatableDifineMessagesStruct? translatableDifineMessages, [
  bool forFieldValue = false,
]) {
  if (translatableDifineMessages == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      TranslatableDifineMessagesStruct.serializer, translatableDifineMessages);

  // Add any Firestore field values
  translatableDifineMessages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTranslatableDifineMessagesListFirestoreData(
  List<TranslatableDifineMessagesStruct>? translatableDifineMessagess,
) =>
    translatableDifineMessagess
        ?.map((t) => getTranslatableDifineMessagesFirestoreData(t, true))
        .toList() ??
    [];
