import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'appointment_address_record.g.dart';

abstract class AppointmentAddressRecord
    implements
        Built<AppointmentAddressRecord, AppointmentAddressRecordBuilder> {
  static Serializer<AppointmentAddressRecord> get serializer =>
      _$appointmentAddressRecordSerializer;

  AddressStruct get address;

  DocumentReference? get owner;

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

  static void _initializeBuilder(AppointmentAddressRecordBuilder builder) =>
      builder
        ..address = AddressStructBuilder()
        ..archived = false
        ..defaultAddress = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('appointment_Address')
          : FirebaseFirestore.instance.collectionGroup('appointment_Address');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('appointment_Address').doc();

  static Stream<AppointmentAddressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppointmentAddressRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppointmentAddressRecord._();
  factory AppointmentAddressRecord(
          [void Function(AppointmentAddressRecordBuilder) updates]) =
      _$AppointmentAddressRecord;

  static AppointmentAddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppointmentAddressRecordData({
  AddressStruct? address,
  DocumentReference? owner,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? archived,
  bool? defaultAddress,
}) {
  final firestoreData = serializers.toFirestore(
    AppointmentAddressRecord.serializer,
    AppointmentAddressRecord(
      (a) => a
        ..address = AddressStructBuilder()
        ..owner = owner
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
