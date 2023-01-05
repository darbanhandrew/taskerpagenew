import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_address_record.g.dart';

abstract class TaskAddressRecord
    implements Built<TaskAddressRecord, TaskAddressRecordBuilder> {
  static Serializer<TaskAddressRecord> get serializer =>
      _$taskAddressRecordSerializer;

  AddressStruct get address;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  bool? get archived;

  @BuiltValueField(wireName: 'default_address')
  bool? get defaultAddress;

  @BuiltValueField(wireName: 'user_adrees_ref')
  DocumentReference? get userAdreesRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(TaskAddressRecordBuilder builder) => builder
    ..address = AddressStructBuilder()
    ..archived = false
    ..defaultAddress = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('task_address')
          : FirebaseFirestore.instance.collectionGroup('task_address');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('task_address').doc();

  static Stream<TaskAddressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskAddressRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaskAddressRecord._();
  factory TaskAddressRecord([void Function(TaskAddressRecordBuilder) updates]) =
      _$TaskAddressRecord;

  static TaskAddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskAddressRecordData({
  AddressStruct? address,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? archived,
  bool? defaultAddress,
  DocumentReference? userAdreesRef,
}) {
  final firestoreData = serializers.toFirestore(
    TaskAddressRecord.serializer,
    TaskAddressRecord(
      (t) => t
        ..address = AddressStructBuilder()
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..archived = archived
        ..defaultAddress = defaultAddress
        ..userAdreesRef = userAdreesRef,
    ),
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}
