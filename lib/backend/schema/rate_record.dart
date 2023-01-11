import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'rate_record.g.dart';

abstract class RateRecord implements Built<RateRecord, RateRecordBuilder> {
  static Serializer<RateRecord> get serializer => _$rateRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'AVG_point')
  double? get aVGPoint;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'appointmen_ref')
  DocumentReference? get appointmenRef;

  double? get poinit;

  String? get comment;

  @BuiltValueField(wireName: 'task_ref')
  DocumentReference? get taskRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RateRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..aVGPoint = 0.0
    ..poinit = 0.0
    ..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rate');

  static Stream<RateRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RateRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RateRecord._();
  factory RateRecord([void Function(RateRecordBuilder) updates]) = _$RateRecord;

  static RateRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRateRecordData({
  String? name,
  String? displayName,
  double? aVGPoint,
  DocumentReference? userRef,
  DocumentReference? appointmenRef,
  double? poinit,
  String? comment,
  DocumentReference? taskRef,
}) {
  final firestoreData = serializers.toFirestore(
    RateRecord.serializer,
    RateRecord(
      (r) => r
        ..name = name
        ..displayName = displayName
        ..aVGPoint = aVGPoint
        ..userRef = userRef
        ..appointmenRef = appointmenRef
        ..poinit = poinit
        ..comment = comment
        ..taskRef = taskRef,
    ),
  );

  return firestoreData;
}
