import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tasker_age_type_record.g.dart';

abstract class TaskerAgeTypeRecord
    implements Built<TaskerAgeTypeRecord, TaskerAgeTypeRecordBuilder> {
  static Serializer<TaskerAgeTypeRecord> get serializer =>
      _$taskerAgeTypeRecordSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'start_age')
  int? get startAge;

  @BuiltValueField(wireName: 'end_age')
  int? get endAge;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaskerAgeTypeRecordBuilder builder) => builder
    ..displayName = ''
    ..startAge = 0
    ..endAge = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasker_age_type');

  static Stream<TaskerAgeTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskerAgeTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static TaskerAgeTypeRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TaskerAgeTypeRecord(
        (c) => c
          ..displayName = snapshot.data['display_name']
          ..startAge = snapshot.data['start_age']?.round()
          ..endAge = snapshot.data['end_age']?.round()
          ..ffRef = TaskerAgeTypeRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TaskerAgeTypeRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tasker_age_type',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  TaskerAgeTypeRecord._();
  factory TaskerAgeTypeRecord(
          [void Function(TaskerAgeTypeRecordBuilder) updates]) =
      _$TaskerAgeTypeRecord;

  static TaskerAgeTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskerAgeTypeRecordData({
  String? displayName,
  int? startAge,
  int? endAge,
}) {
  final firestoreData = serializers.toFirestore(
    TaskerAgeTypeRecord.serializer,
    TaskerAgeTypeRecord(
      (t) => t
        ..displayName = displayName
        ..startAge = startAge
        ..endAge = endAge,
    ),
  );

  return firestoreData;
}
