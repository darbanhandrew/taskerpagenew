import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_skill_record.g.dart';

abstract class UserSkillRecord
    implements Built<UserSkillRecord, UserSkillRecordBuilder> {
  static Serializer<UserSkillRecord> get serializer =>
      _$userSkillRecordSerializer;

  @BuiltValueField(wireName: 'skill_category_ref')
  DocumentReference? get skillCategoryRef;

  @BuiltValueField(wireName: 'skill_refs')
  BuiltList<DocumentReference>? get skillRefs;

  @BuiltValueField(wireName: 'skill_levels')
  BuiltList<DocumentReference>? get skillLevels;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserSkillRecordBuilder builder) => builder
    ..skillRefs = ListBuilder()
    ..skillLevels = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_skill');

  static Stream<UserSkillRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserSkillRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UserSkillRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UserSkillRecord(
        (c) => c
          ..skillCategoryRef =
              safeGet(() => toRef(snapshot.data['skill_category_ref']))
          ..skillRefs = safeGet(() =>
              ListBuilder(snapshot.data['skill_refs'].map((s) => toRef(s))))
          ..skillLevels = safeGet(() =>
              ListBuilder(snapshot.data['skill_levels'].map((s) => toRef(s))))
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..ffRef = UserSkillRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UserSkillRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'user_skill',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UserSkillRecord._();
  factory UserSkillRecord([void Function(UserSkillRecordBuilder) updates]) =
      _$UserSkillRecord;

  static UserSkillRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserSkillRecordData({
  DocumentReference? skillCategoryRef,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    UserSkillRecord.serializer,
    UserSkillRecord(
      (u) => u
        ..skillCategoryRef = skillCategoryRef
        ..skillRefs = null
        ..skillLevels = null
        ..user = user,
    ),
  );

  return firestoreData;
}
