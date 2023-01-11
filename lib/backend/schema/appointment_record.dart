import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'appointment_record.g.dart';

abstract class AppointmentRecord
    implements Built<AppointmentRecord, AppointmentRecordBuilder> {
  static Serializer<AppointmentRecord> get serializer =>
      _$appointmentRecordSerializer;

  BuiltList<DocumentReference>? get users;

  @BuiltValueField(wireName: 'date_time')
  DateTime? get dateTime;

  bool? get accepted;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  DocumentReference? get invited;

  @BuiltValueField(wireName: 'type_appointment')
  String? get typeAppointment;

  String? get phone;

  AddressStruct get address;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppointmentRecordBuilder builder) => builder
    ..users = ListBuilder()
    ..accepted = false
    ..typeAppointment = ''
    ..phone = ''
    ..address = AddressStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointment');

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppointmentRecord._();
  factory AppointmentRecord([void Function(AppointmentRecordBuilder) updates]) =
      _$AppointmentRecord;

  static AppointmentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppointmentRecordData({
  DateTime? dateTime,
  bool? accepted,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DocumentReference? invited,
  String? typeAppointment,
  String? phone,
  AddressStruct? address,
}) {
  final firestoreData = serializers.toFirestore(
    AppointmentRecord.serializer,
    AppointmentRecord(
      (a) => a
        ..users = null
        ..dateTime = dateTime
        ..accepted = accepted
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..invited = invited
        ..typeAppointment = typeAppointment
        ..phone = phone
        ..address = AddressStructBuilder(),
    ),
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}
