import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'company_struct.g.dart';

abstract class CompanyStruct
    implements Built<CompanyStruct, CompanyStructBuilder> {
  static Serializer<CompanyStruct> get serializer => _$companyStructSerializer;

  String? get name;

  @BuiltValueField(wireName: 'registration_number')
  String? get registrationNumber;

  @BuiltValueField(wireName: 'city_of_registration')
  String? get cityOfRegistration;

  LatLng? get location;

  @BuiltValueField(wireName: 'number_of_employees')
  String? get numberOfEmployees;

  String? get description;

  String? get logo;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CompanyStructBuilder builder) => builder
    ..name = ''
    ..registrationNumber = ''
    ..cityOfRegistration = ''
    ..numberOfEmployees = ''
    ..description = ''
    ..logo = ''
    ..firestoreUtilData = FirestoreUtilData();

  CompanyStruct._();
  factory CompanyStruct([void Function(CompanyStructBuilder) updates]) =
      _$CompanyStruct;
}

CompanyStruct createCompanyStruct({
  String? name,
  String? registrationNumber,
  String? cityOfRegistration,
  LatLng? location,
  String? numberOfEmployees,
  String? description,
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompanyStruct(
      (c) => c
        ..name = name
        ..registrationNumber = registrationNumber
        ..cityOfRegistration = cityOfRegistration
        ..location = location
        ..numberOfEmployees = numberOfEmployees
        ..description = description
        ..logo = logo
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CompanyStruct? updateCompanyStruct(
  CompanyStruct? company, {
  bool clearUnsetFields = true,
}) =>
    company != null
        ? (company.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addCompanyStructData(
  Map<String, dynamic> firestoreData,
  CompanyStruct? company,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (company == null) {
    return;
  }
  if (company.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && company.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final companyData = getCompanyFirestoreData(company, forFieldValue);
  final nestedData = companyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = company.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCompanyFirestoreData(
  CompanyStruct? company, [
  bool forFieldValue = false,
]) {
  if (company == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(CompanyStruct.serializer, company);

  // Add any Firestore field values
  company.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompanyListFirestoreData(
  List<CompanyStruct>? companys,
) =>
    companys?.map((c) => getCompanyFirestoreData(c, true)).toList() ?? [];
