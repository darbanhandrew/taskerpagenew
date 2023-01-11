import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sign_u_p_step_badg_record.g.dart';

abstract class SignUPStepBadgRecord
    implements Built<SignUPStepBadgRecord, SignUPStepBadgRecordBuilder> {
  static Serializer<SignUPStepBadgRecord> get serializer =>
      _$signUPStepBadgRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get icon;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SignUPStepBadgRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..icon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('signUP_step_badg');

  static Stream<SignUPStepBadgRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SignUPStepBadgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SignUPStepBadgRecord._();
  factory SignUPStepBadgRecord(
          [void Function(SignUPStepBadgRecordBuilder) updates]) =
      _$SignUPStepBadgRecord;

  static SignUPStepBadgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSignUPStepBadgRecordData({
  String? name,
  String? displayName,
  String? icon,
}) {
  final firestoreData = serializers.toFirestore(
    SignUPStepBadgRecord.serializer,
    SignUPStepBadgRecord(
      (s) => s
        ..name = name
        ..displayName = displayName
        ..icon = icon,
    ),
  );

  return firestoreData;
}
