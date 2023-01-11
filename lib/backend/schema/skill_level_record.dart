import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'skill_level_record.g.dart';

abstract class SkillLevelRecord
    implements Built<SkillLevelRecord, SkillLevelRecordBuilder> {
  static Serializer<SkillLevelRecord> get serializer =>
      _$skillLevelRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  BuiltList<TranslatableStringStruct>? get locale;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SkillLevelRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..locale = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('skill_level');

  static Stream<SkillLevelRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SkillLevelRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static SkillLevelRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SkillLevelRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..displayName = snapshot.data['display_name']
          ..locale = safeGet(() => ListBuilder(snapshot.data['locale']
              .map((data) => createTranslatableStringStruct(
                    language: safeGet(() =>
                        toRef((data as Map<String, dynamic>)['language'])),
                    text: (data as Map<String, dynamic>)['text'],
                    create: true,
                    clearUnsetFields: false,
                  ).toBuilder())))
          ..ffRef = SkillLevelRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SkillLevelRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'skill_level',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  SkillLevelRecord._();
  factory SkillLevelRecord([void Function(SkillLevelRecordBuilder) updates]) =
      _$SkillLevelRecord;

  static SkillLevelRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSkillLevelRecordData({
  String? name,
  String? displayName,
}) {
  final firestoreData = serializers.toFirestore(
    SkillLevelRecord.serializer,
    SkillLevelRecord(
      (s) => s
        ..name = name
        ..displayName = displayName
        ..locale = null,
    ),
  );

  return firestoreData;
}
