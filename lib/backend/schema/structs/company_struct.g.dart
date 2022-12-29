// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompanyStruct> _$companyStructSerializer =
    new _$CompanyStructSerializer();

class _$CompanyStructSerializer implements StructuredSerializer<CompanyStruct> {
  @override
  final Iterable<Type> types = const [CompanyStruct, _$CompanyStruct];
  @override
  final String wireName = 'CompanyStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, CompanyStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.registrationNumber;
    if (value != null) {
      result
        ..add('registration_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cityOfRegistration;
    if (value != null) {
      result
        ..add('city_of_registration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.numberOfEmployees;
    if (value != null) {
      result
        ..add('number_of_employees')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CompanyStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'registration_number':
          result.registrationNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city_of_registration':
          result.cityOfRegistration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'number_of_employees':
          result.numberOfEmployees = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$CompanyStruct extends CompanyStruct {
  @override
  final String? name;
  @override
  final String? registrationNumber;
  @override
  final String? cityOfRegistration;
  @override
  final LatLng? location;
  @override
  final String? numberOfEmployees;
  @override
  final String? description;
  @override
  final String? logo;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CompanyStruct([void Function(CompanyStructBuilder)? updates]) =>
      (new CompanyStructBuilder()..update(updates))._build();

  _$CompanyStruct._(
      {this.name,
      this.registrationNumber,
      this.cityOfRegistration,
      this.location,
      this.numberOfEmployees,
      this.description,
      this.logo,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CompanyStruct', 'firestoreUtilData');
  }

  @override
  CompanyStruct rebuild(void Function(CompanyStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyStructBuilder toBuilder() => new CompanyStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyStruct &&
        name == other.name &&
        registrationNumber == other.registrationNumber &&
        cityOfRegistration == other.cityOfRegistration &&
        location == other.location &&
        numberOfEmployees == other.numberOfEmployees &&
        description == other.description &&
        logo == other.logo &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, name.hashCode),
                                registrationNumber.hashCode),
                            cityOfRegistration.hashCode),
                        location.hashCode),
                    numberOfEmployees.hashCode),
                description.hashCode),
            logo.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompanyStruct')
          ..add('name', name)
          ..add('registrationNumber', registrationNumber)
          ..add('cityOfRegistration', cityOfRegistration)
          ..add('location', location)
          ..add('numberOfEmployees', numberOfEmployees)
          ..add('description', description)
          ..add('logo', logo)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CompanyStructBuilder
    implements Builder<CompanyStruct, CompanyStructBuilder> {
  _$CompanyStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _registrationNumber;
  String? get registrationNumber => _$this._registrationNumber;
  set registrationNumber(String? registrationNumber) =>
      _$this._registrationNumber = registrationNumber;

  String? _cityOfRegistration;
  String? get cityOfRegistration => _$this._cityOfRegistration;
  set cityOfRegistration(String? cityOfRegistration) =>
      _$this._cityOfRegistration = cityOfRegistration;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  String? _numberOfEmployees;
  String? get numberOfEmployees => _$this._numberOfEmployees;
  set numberOfEmployees(String? numberOfEmployees) =>
      _$this._numberOfEmployees = numberOfEmployees;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CompanyStructBuilder() {
    CompanyStruct._initializeBuilder(this);
  }

  CompanyStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _registrationNumber = $v.registrationNumber;
      _cityOfRegistration = $v.cityOfRegistration;
      _location = $v.location;
      _numberOfEmployees = $v.numberOfEmployees;
      _description = $v.description;
      _logo = $v.logo;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompanyStruct;
  }

  @override
  void update(void Function(CompanyStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompanyStruct build() => _build();

  _$CompanyStruct _build() {
    final _$result = _$v ??
        new _$CompanyStruct._(
            name: name,
            registrationNumber: registrationNumber,
            cityOfRegistration: cityOfRegistration,
            location: location,
            numberOfEmployees: numberOfEmployees,
            description: description,
            logo: logo,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'CompanyStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
