import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'skill_record.g.dart';

abstract class SkillRecord implements Built<SkillRecord, SkillRecordBuilder> {
  static Serializer<SkillRecord> get serializer => _$skillRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  BuiltList<OptionStruct>? get options;

  @BuiltValueField(wireName: 'category_ref')
  DocumentReference? get categoryRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SkillRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..options = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('skill');

  static Stream<SkillRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SkillRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static SkillRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => SkillRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..displayName = snapshot.data['display_name']
          ..options = safeGet(() => ListBuilder(
              snapshot.data['options'].map((data) => createOptionStruct(
                    name: (data as Map<String, dynamic>)['name'],
                    order: (data as Map<String, dynamic>)['order']?.round(),
                    isSingle: (data as Map<String, dynamic>)['is_single'],
                    value: (data as Map<String, dynamic>)['value'],
                    type: (data as Map<String, dynamic>)['type'],
                    create: true,
                    clearUnsetFields: false,
                  ).toBuilder())))
          ..categoryRef = safeGet(() => toRef(snapshot.data['category_ref']))
          ..ffRef = SkillRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SkillRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'skill',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  SkillRecord._();
  factory SkillRecord([void Function(SkillRecordBuilder) updates]) =
      _$SkillRecord;

  static SkillRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSkillRecordData({
  String? name,
  String? displayName,
  DocumentReference? categoryRef,
}) {
  final firestoreData = serializers.toFirestore(
    SkillRecord.serializer,
    SkillRecord(
      (s) => s
        ..name = name
        ..displayName = displayName
        ..options = null
        ..categoryRef = categoryRef,
    ),
  );

  return firestoreData;
}
