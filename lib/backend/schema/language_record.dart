import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'language_record.g.dart';

abstract class LanguageRecord
    implements Built<LanguageRecord, LanguageRecordBuilder> {
  static Serializer<LanguageRecord> get serializer =>
      _$languageRecordSerializer;

  String? get code;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LanguageRecordBuilder builder) => builder
    ..code = ''
    ..displayName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('language');

  static Stream<LanguageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LanguageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LanguageRecord._();
  factory LanguageRecord([void Function(LanguageRecordBuilder) updates]) =
      _$LanguageRecord;

  static LanguageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLanguageRecordData({
  String? code,
  String? displayName,
}) {
  final firestoreData = serializers.toFirestore(
    LanguageRecord.serializer,
    LanguageRecord(
      (l) => l
        ..code = code
        ..displayName = displayName,
    ),
  );

  return firestoreData;
}
