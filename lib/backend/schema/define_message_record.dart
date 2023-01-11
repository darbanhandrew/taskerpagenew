import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'define_message_record.g.dart';

abstract class DefineMessageRecord
    implements Built<DefineMessageRecord, DefineMessageRecordBuilder> {
  static Serializer<DefineMessageRecord> get serializer =>
      _$defineMessageRecordSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get messages;

  int? get order;

  String? get type;

  BuiltList<TranslatableDifineMessagesStruct>? get locale;

  @BuiltValueField(wireName: 'i_premium')
  bool? get iPremium;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DefineMessageRecordBuilder builder) => builder
    ..displayName = ''
    ..messages = ''
    ..order = 0
    ..type = ''
    ..locale = ListBuilder()
    ..iPremium = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('define_Message');

  static Stream<DefineMessageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DefineMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DefineMessageRecord._();
  factory DefineMessageRecord(
          [void Function(DefineMessageRecordBuilder) updates]) =
      _$DefineMessageRecord;

  static DefineMessageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDefineMessageRecordData({
  String? displayName,
  String? messages,
  int? order,
  String? type,
  bool? iPremium,
}) {
  final firestoreData = serializers.toFirestore(
    DefineMessageRecord.serializer,
    DefineMessageRecord(
      (d) => d
        ..displayName = displayName
        ..messages = messages
        ..order = order
        ..type = type
        ..locale = null
        ..iPremium = iPremium,
    ),
  );

  return firestoreData;
}
