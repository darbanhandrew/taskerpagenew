import 'dart:async';

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

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserSkillRecordBuilder builder) => builder
    ..skillRefs = ListBuilder()
    ..skillLevels = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_skill')
          : FirebaseFirestore.instance.collectionGroup('user_skill');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_skill').doc();

  static Stream<UserSkillRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserSkillRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

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
}) {
  final firestoreData = serializers.toFirestore(
    UserSkillRecord.serializer,
    UserSkillRecord(
      (u) => u
        ..skillCategoryRef = skillCategoryRef
        ..skillRefs = null
        ..skillLevels = null,
    ),
  );

  return firestoreData;
}
