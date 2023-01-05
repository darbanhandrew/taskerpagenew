import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_address_record.g.dart';

abstract class UserAddressRecord
    implements Built<UserAddressRecord, UserAddressRecordBuilder> {
  static Serializer<UserAddressRecord> get serializer =>
      _$userAddressRecordSerializer;

  AddressStruct get address;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  bool? get archived;

  @BuiltValueField(wireName: 'default_address')
  bool? get defaultAddress;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserAddressRecordBuilder builder) => builder
    ..address = AddressStructBuilder()
    ..archived = false
    ..defaultAddress = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_address')
          : FirebaseFirestore.instance.collectionGroup('user_address');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_address').doc();

  static Stream<UserAddressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserAddressRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserAddressRecord._();
  factory UserAddressRecord([void Function(UserAddressRecordBuilder) updates]) =
      _$UserAddressRecord;

  static UserAddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserAddressRecordData({
  AddressStruct? address,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? archived,
  bool? defaultAddress,
}) {
  final firestoreData = serializers.toFirestore(
    UserAddressRecord.serializer,
    UserAddressRecord(
      (u) => u
        ..address = AddressStructBuilder()
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..archived = archived
        ..defaultAddress = defaultAddress,
    ),
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}
