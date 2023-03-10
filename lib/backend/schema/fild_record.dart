import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fild_record.g.dart';

abstract class FildRecord implements Built<FildRecord, FildRecordBuilder> {
  static Serializer<FildRecord> get serializer => _$fildRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get type;

  @BuiltValueField(wireName: 'skills_ref')
  BuiltList<DocumentReference>? get skillsRef;

  @BuiltValueField(wireName: 'skills_category_ref')
  BuiltList<DocumentReference>? get skillsCategoryRef;

  bool? get value;

  String? get values;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FildRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..type = ''
    ..skillsRef = ListBuilder()
    ..skillsCategoryRef = ListBuilder()
    ..value = false
    ..values = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fild');

  static Stream<FildRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FildRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FildRecord._();
  factory FildRecord([void Function(FildRecordBuilder) updates]) = _$FildRecord;

  static FildRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFildRecordData({
  String? name,
  String? displayName,
  String? type,
  bool? value,
  String? values,
}) {
  final firestoreData = serializers.toFirestore(
    FildRecord.serializer,
    FildRecord(
      (f) => f
        ..name = name
        ..displayName = displayName
        ..type = type
        ..skillsRef = null
        ..skillsCategoryRef = null
        ..value = value
        ..values = values,
    ),
  );

  return firestoreData;
}
