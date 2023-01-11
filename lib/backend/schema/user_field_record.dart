import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_field_record.g.dart';

abstract class UserFieldRecord
    implements Built<UserFieldRecord, UserFieldRecordBuilder> {
  static Serializer<UserFieldRecord> get serializer =>
      _$userFieldRecordSerializer;

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

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserFieldRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..type = ''
    ..skillsRef = ListBuilder()
    ..skillsCategoryRef = ListBuilder()
    ..value = false
    ..values = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_field')
          : FirebaseFirestore.instance.collectionGroup('user_field');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_field').doc();

  static Stream<UserFieldRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserFieldRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserFieldRecord._();
  factory UserFieldRecord([void Function(UserFieldRecordBuilder) updates]) =
      _$UserFieldRecord;

  static UserFieldRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserFieldRecordData({
  String? name,
  String? displayName,
  String? type,
  bool? value,
  String? values,
}) {
  final firestoreData = serializers.toFirestore(
    UserFieldRecord.serializer,
    UserFieldRecord(
      (u) => u
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
