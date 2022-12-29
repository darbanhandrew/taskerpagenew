import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_record.g.dart';

abstract class TaskRecord implements Built<TaskRecord, TaskRecordBuilder> {
  static Serializer<TaskRecord> get serializer => _$taskRecordSerializer;

  DocumentReference? get category;

  DocumentReference? get skill;

  @BuiltValueField(wireName: 'skill_levels')
  BuiltList<DocumentReference>? get skillLevels;

  BuiltList<String>? get languages;

  String? get description;

  String? get file;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'modified_time')
  DateTime? get modifiedTime;

  bool? get published;

  bool? get archived;

  @BuiltValueField(wireName: 'selected_address')
  DocumentReference? get selectedAddress;

  DocumentReference? get owner;

  @BuiltValueField(wireName: 'task_time')
  TaskDateTimeStruct get taskTime;

  @BuiltValueField(wireName: 'tasker_type')
  TaskerTypeStruct get taskerType;

  BuiltList<DocumentReference>? get users;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaskRecordBuilder builder) => builder
    ..skillLevels = ListBuilder()
    ..languages = ListBuilder()
    ..description = ''
    ..file = ''
    ..published = false
    ..archived = false
    ..taskTime = TaskDateTimeStructBuilder()
    ..taskerType = TaskerTypeStructBuilder()
    ..users = ListBuilder()
    ..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task');

  static Stream<TaskRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static TaskRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => TaskRecord(
        (c) => c
          ..category = safeGet(() => toRef(snapshot.data['category']))
          ..skill = safeGet(() => toRef(snapshot.data['skill']))
          ..skillLevels = safeGet(() =>
              ListBuilder(snapshot.data['skill_levels'].map((s) => toRef(s))))
          ..languages = safeGet(() => ListBuilder(snapshot.data['languages']))
          ..description = snapshot.data['description']
          ..file = snapshot.data['file']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..modifiedTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['modified_time']))
          ..published = snapshot.data['published']
          ..archived = snapshot.data['archived']
          ..selectedAddress =
              safeGet(() => toRef(snapshot.data['selected_address']))
          ..owner = safeGet(() => toRef(snapshot.data['owner']))
          ..taskTime = createTaskDateTimeStruct(
            periodic: (snapshot.data['task_time'] ?? {})['periodic'],
            startDate: safeGet(() => DateTime.fromMillisecondsSinceEpoch(
                (snapshot.data['task_time'] ?? {})['start_date'])),
            exact: (snapshot.data['task_time'] ?? {})['exact'],
            exactStartTime: safeGet(() => DateTime.fromMillisecondsSinceEpoch(
                (snapshot.data['task_time'] ?? {})['exact_start_time'])),
            typeOfPeriod: (snapshot.data['task_time'] ?? {})['type_of_period'],
            sessionHour:
                (snapshot.data['task_time'] ?? {})['session_hour']?.round(),
            endDate: safeGet(() => DateTime.fromMillisecondsSinceEpoch(
                (snapshot.data['task_time'] ?? {})['end_date'])),
            daysPerWeek:
                (snapshot.data['task_time'] ?? {})['days_per_week']?.round(),
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..taskerType = createTaskerTypeStruct(
            gender: (snapshot.data['tasker_type'] ?? {})['gender'],
            taskerAgeStart:
                (snapshot.data['tasker_type'] ?? {})['tasker_age_start']
                    ?.round(),
            taskerAgeEnd:
                (snapshot.data['tasker_type'] ?? {})['tasker_age_end']?.round(),
            identified: (snapshot.data['tasker_type'] ?? {})['identified'],
            yearsOfExperience:
                (snapshot.data['tasker_type'] ?? {})['years_of_experience']
                    ?.round(),
            insuranced: (snapshot.data['tasker_type'] ?? {})['insuranced'],
            driversLicense:
                (snapshot.data['tasker_type'] ?? {})['drivers_license'],
            maxTaskerDistance:
                (snapshot.data['tasker_type'] ?? {})['max_tasker_distance']
                    ?.toDouble(),
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..users = safeGet(
              () => ListBuilder(snapshot.data['users'].map((s) => toRef(s))))
          ..name = snapshot.data['name']
          ..ffRef = TaskRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TaskRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'task',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  TaskRecord._();
  factory TaskRecord([void Function(TaskRecordBuilder) updates]) = _$TaskRecord;

  static TaskRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskRecordData({
  DocumentReference? category,
  DocumentReference? skill,
  String? description,
  String? file,
  DateTime? createdTime,
  DateTime? modifiedTime,
  bool? published,
  bool? archived,
  DocumentReference? selectedAddress,
  DocumentReference? owner,
  TaskDateTimeStruct? taskTime,
  TaskerTypeStruct? taskerType,
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    TaskRecord.serializer,
    TaskRecord(
      (t) => t
        ..category = category
        ..skill = skill
        ..skillLevels = null
        ..languages = null
        ..description = description
        ..file = file
        ..createdTime = createdTime
        ..modifiedTime = modifiedTime
        ..published = published
        ..archived = archived
        ..selectedAddress = selectedAddress
        ..owner = owner
        ..taskTime = TaskDateTimeStructBuilder()
        ..taskerType = TaskerTypeStructBuilder()
        ..users = null
        ..name = name,
    ),
  );

  // Handle nested data for "task_time" field.
  addTaskDateTimeStructData(firestoreData, taskTime, 'task_time');

  // Handle nested data for "tasker_type" field.
  addTaskerTypeStructData(firestoreData, taskerType, 'tasker_type');

  return firestoreData;
}
