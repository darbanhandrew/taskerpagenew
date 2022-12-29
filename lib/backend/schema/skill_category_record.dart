import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'skill_category_record.g.dart';

abstract class SkillCategoryRecord
    implements Built<SkillCategoryRecord, SkillCategoryRecordBuilder> {
  static Serializer<SkillCategoryRecord> get serializer =>
      _$skillCategoryRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get icon;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SkillCategoryRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..icon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('skill_category');

  static Stream<SkillCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SkillCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static SkillCategoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SkillCategoryRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..displayName = snapshot.data['display_name']
          ..icon = snapshot.data['icon']
          ..ffRef = SkillCategoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SkillCategoryRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'skill_category',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  SkillCategoryRecord._();
  factory SkillCategoryRecord(
          [void Function(SkillCategoryRecordBuilder) updates]) =
      _$SkillCategoryRecord;

  static SkillCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSkillCategoryRecordData({
  String? name,
  String? displayName,
  String? icon,
}) {
  final firestoreData = serializers.toFirestore(
    SkillCategoryRecord.serializer,
    SkillCategoryRecord(
      (s) => s
        ..name = name
        ..displayName = displayName
        ..icon = icon,
    ),
  );

  return firestoreData;
}
