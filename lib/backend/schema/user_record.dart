import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  @BuiltValueField(wireName: 'account_type')
  String? get accountType;

  @BuiltValueField(wireName: 'name_title')
  String? get nameTitle;

  CompanyStruct get company;

  DocumentReference? get role;

  @BuiltValueField(wireName: 'birth_date')
  DateTime? get birthDate;

  DocumentReference? get country;

  DocumentReference? get language;

  @BuiltValueField(wireName: 'has_main_address')
  bool? get hasMainAddress;

  bool? get periodic;

  @BuiltValueField(wireName: 'verification_code')
  String? get verificationCode;

  String? get description;

  @BuiltValueField(wireName: 'years_of_experience')
  int? get yearsOfExperience;

  BuiltList<String>? get languages;

  bool? get insurance;

  LatLng? get location;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..firstName = ''
    ..lastName = ''
    ..accountType = ''
    ..nameTitle = ''
    ..company = CompanyStructBuilder()
    ..hasMainAddress = false
    ..periodic = false
    ..verificationCode = ''
    ..description = ''
    ..yearsOfExperience = 0
    ..languages = ListBuilder()
    ..insurance = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UserRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UserRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..firstName = snapshot.data['first_name']
          ..lastName = snapshot.data['last_name']
          ..accountType = snapshot.data['account_type']
          ..nameTitle = snapshot.data['name_title']
          ..company = createCompanyStruct(
            name: (snapshot.data['company'] ?? {})['name'],
            registrationNumber:
                (snapshot.data['company'] ?? {})['registration_number'],
            cityOfRegistration:
                (snapshot.data['company'] ?? {})['city_of_registration'],
            location: safeGet(() => LatLng(
                  (snapshot.data['company'] ?? {})['_geoloc']['lat'],
                  (snapshot.data['company'] ?? {})['_geoloc']['lng'],
                )),
            numberOfEmployees:
                (snapshot.data['company'] ?? {})['number_of_employees'],
            description: (snapshot.data['company'] ?? {})['description'],
            logo: (snapshot.data['company'] ?? {})['logo'],
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..role = safeGet(() => toRef(snapshot.data['role']))
          ..birthDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['birth_date']))
          ..country = safeGet(() => toRef(snapshot.data['country']))
          ..language = safeGet(() => toRef(snapshot.data['language']))
          ..hasMainAddress = snapshot.data['has_main_address']
          ..periodic = snapshot.data['periodic']
          ..verificationCode = snapshot.data['verification_code']
          ..description = snapshot.data['description']
          ..yearsOfExperience = snapshot.data['years_of_experience']?.round()
          ..languages = safeGet(() => ListBuilder(snapshot.data['languages']))
          ..insurance = snapshot.data['insurance']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..ffRef = UserRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UserRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'user',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  String? accountType,
  String? nameTitle,
  CompanyStruct? company,
  DocumentReference? role,
  DateTime? birthDate,
  DocumentReference? country,
  DocumentReference? language,
  bool? hasMainAddress,
  bool? periodic,
  String? verificationCode,
  String? description,
  int? yearsOfExperience,
  bool? insurance,
  LatLng? location,
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..firstName = firstName
        ..lastName = lastName
        ..accountType = accountType
        ..nameTitle = nameTitle
        ..company = CompanyStructBuilder()
        ..role = role
        ..birthDate = birthDate
        ..country = country
        ..language = language
        ..hasMainAddress = hasMainAddress
        ..periodic = periodic
        ..verificationCode = verificationCode
        ..description = description
        ..yearsOfExperience = yearsOfExperience
        ..languages = null
        ..insurance = insurance
        ..location = location,
    ),
  );

  // Handle nested data for "company" field.
  addCompanyStructData(firestoreData, company, 'company');

  return firestoreData;
}
