import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'address_record.g.dart';

abstract class AddressRecord
    implements Built<AddressRecord, AddressRecordBuilder> {
  static Serializer<AddressRecord> get serializer => _$addressRecordSerializer;

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

  static void _initializeBuilder(AddressRecordBuilder builder) => builder
    ..address = AddressStructBuilder()
    ..archived = false
    ..defaultAddress = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('address');

  static Stream<AddressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AddressRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static AddressRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AddressRecord(
        (c) => c
          ..address = createAddressStruct(
            street: (snapshot.data['address'] ?? {})['street'],
            number: (snapshot.data['address'] ?? {})['number']?.round(),
            postalCode: (snapshot.data['address'] ?? {})['postal_code'],
            city: (snapshot.data['address'] ?? {})['city'],
            country: safeGet(
                () => toRef((snapshot.data['address'] ?? {})['country'])),
            location: safeGet(() => LatLng(
                  (snapshot.data['address'] ?? {})['_geoloc']['lat'],
                  (snapshot.data['address'] ?? {})['_geoloc']['lng'],
                )),
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..owner = safeGet(() => toRef(snapshot.data['owner']))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..modifiedAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['modified_at']))
          ..archived = snapshot.data['archived']
          ..defaultAddress = snapshot.data['default_address']
          ..ffRef = AddressRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AddressRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'address',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AddressRecord._();
  factory AddressRecord([void Function(AddressRecordBuilder) updates]) =
      _$AddressRecord;

  static AddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAddressRecordData({
  AddressStruct? address,
  DocumentReference? owner,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? archived,
  bool? defaultAddress,
}) {
  final firestoreData = serializers.toFirestore(
    AddressRecord.serializer,
    AddressRecord(
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
