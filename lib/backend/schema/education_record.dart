import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'education_record.g.dart';

abstract class EducationRecord
    implements Built<EducationRecord, EducationRecordBuilder> {
  static Serializer<EducationRecord> get serializer =>
      _$educationRecordSerializer;

  String? get name;

  String? get company;

  @BuiltValueField(wireName: 'education_degree')
  DocumentReference? get educationDegree;

  String? get certificate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(EducationRecordBuilder builder) => builder
    ..name = ''
    ..company = ''
    ..certificate = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('education')
          : FirebaseFirestore.instance.collectionGroup('education');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('education').doc();

  static Stream<EducationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EducationRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EducationRecord._();
  factory EducationRecord([void Function(EducationRecordBuilder) updates]) =
      _$EducationRecord;

  static EducationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEducationRecordData({
  String? name,
  String? company,
  DocumentReference? educationDegree,
  String? certificate,
}) {
  final firestoreData = serializers.toFirestore(
    EducationRecord.serializer,
    EducationRecord(
      (e) => e
        ..name = name
        ..company = company
        ..educationDegree = educationDegree
        ..certificate = certificate,
    ),
  );

  return firestoreData;
}
