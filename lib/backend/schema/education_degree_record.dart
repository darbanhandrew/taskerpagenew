import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'education_degree_record.g.dart';

abstract class EducationDegreeRecord
    implements Built<EducationDegreeRecord, EducationDegreeRecordBuilder> {
  static Serializer<EducationDegreeRecord> get serializer =>
      _$educationDegreeRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EducationDegreeRecordBuilder builder) =>
      builder
        ..name = ''
        ..displayName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('education_degree');

  static Stream<EducationDegreeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EducationDegreeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static EducationDegreeRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EducationDegreeRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..displayName = snapshot.data['display_name']
          ..ffRef = EducationDegreeRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EducationDegreeRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'education_degree',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  EducationDegreeRecord._();
  factory EducationDegreeRecord(
          [void Function(EducationDegreeRecordBuilder) updates]) =
      _$EducationDegreeRecord;

  static EducationDegreeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEducationDegreeRecordData({
  String? name,
  String? displayName,
}) {
  final firestoreData = serializers.toFirestore(
    EducationDegreeRecord.serializer,
    EducationDegreeRecord(
      (e) => e
        ..name = name
        ..displayName = displayName,
    ),
  );

  return firestoreData;
}
