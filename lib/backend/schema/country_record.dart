import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'country_record.g.dart';

abstract class CountryRecord
    implements Built<CountryRecord, CountryRecordBuilder> {
  static Serializer<CountryRecord> get serializer => _$countryRecordSerializer;

  String? get code;

  @BuiltValueField(wireName: 'phone_code')
  String? get phoneCode;

  String? get flagIcon;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CountryRecordBuilder builder) => builder
    ..code = ''
    ..phoneCode = ''
    ..flagIcon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('country');

  static Stream<CountryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CountryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CountryRecord._();
  factory CountryRecord([void Function(CountryRecordBuilder) updates]) =
      _$CountryRecord;

  static CountryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCountryRecordData({
  String? code,
  String? phoneCode,
  String? flagIcon,
}) {
  final firestoreData = serializers.toFirestore(
    CountryRecord.serializer,
    CountryRecord(
      (c) => c
        ..code = code
        ..phoneCode = phoneCode
        ..flagIcon = flagIcon,
    ),
  );

  return firestoreData;
}
