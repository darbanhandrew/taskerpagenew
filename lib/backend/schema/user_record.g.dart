// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserRecord> _$userRecordSerializer = new _$UserRecordSerializer();

class _$UserRecordSerializer implements StructuredSerializer<UserRecord> {
  @override
  final Iterable<Type> types = const [UserRecord, _$UserRecord];
  @override
  final String wireName = 'UserRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'company',
      serializers.serialize(object.company,
          specifiedType: const FullType(CompanyStruct)),
      'field_skill',
      serializers.serialize(object.fieldSkill,
          specifiedType: const FullType(FieldsSkillStruct)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountType;
    if (value != null) {
      result
        ..add('account_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameTitle;
    if (value != null) {
      result
        ..add('name_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birth_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.language;
    if (value != null) {
      result
        ..add('language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.hasMainAddress;
    if (value != null) {
      result
        ..add('has_main_address')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.periodic;
    if (value != null) {
      result
        ..add('periodic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.verificationCode;
    if (value != null) {
      result
        ..add('verification_code')
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
    value = object.yearsOfExperience;
    if (value != null) {
      result
        ..add('years_of_experience')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.languages;
    if (value != null) {
      result
        ..add('languages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.insurance;
    if (value != null) {
      result
        ..add('insurance')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.skillCategoryRefs;
    if (value != null) {
      result
        ..add('skill_category_refs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.skillRefs;
    if (value != null) {
      result
        ..add('skill_refs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.skillLevelRefs;
    if (value != null) {
      result
        ..add('skill_level_refs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.maxChatOrder;
    if (value != null) {
      result
        ..add('max_chat_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxNumberOfAppointments;
    if (value != null) {
      result
        ..add('max_number_of_appointments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isPremium;
    if (value != null) {
      result
        ..add('is_premium')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.roleType;
    if (value != null) {
      result
        ..add('role_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.compeltedProfile;
    if (value != null) {
      result
        ..add('compelted_profile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.signUpStepBadg;
    if (value != null) {
      result
        ..add('signUp_step_badg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UserRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'account_type':
          result.accountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name_title':
          result.nameTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company':
          result.company.replace(serializers.deserialize(value,
              specifiedType: const FullType(CompanyStruct))! as CompanyStruct);
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'birth_date':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'has_main_address':
          result.hasMainAddress = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'periodic':
          result.periodic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'verification_code':
          result.verificationCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'years_of_experience':
          result.yearsOfExperience = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'languages':
          result.languages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'insurance':
          result.insurance = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'skill_category_refs':
          result.skillCategoryRefs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'skill_refs':
          result.skillRefs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'skill_level_refs':
          result.skillLevelRefs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'field_skill':
          result.fieldSkill.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FieldsSkillStruct))!
              as FieldsSkillStruct);
          break;
        case 'max_chat_order':
          result.maxChatOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'max_number_of_appointments':
          result.maxNumberOfAppointments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_premium':
          result.isPremium = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'role_type':
          result.roleType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'compelted_profile':
          result.compeltedProfile = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'signUp_step_badg':
          result.signUpStepBadg.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserRecord extends UserRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? accountType;
  @override
  final String? nameTitle;
  @override
  final CompanyStruct company;
  @override
  final DocumentReference<Object?>? role;
  @override
  final DateTime? birthDate;
  @override
  final DocumentReference<Object?>? country;
  @override
  final DocumentReference<Object?>? language;
  @override
  final bool? hasMainAddress;
  @override
  final bool? periodic;
  @override
  final String? verificationCode;
  @override
  final String? description;
  @override
  final int? yearsOfExperience;
  @override
  final BuiltList<String>? languages;
  @override
  final bool? insurance;
  @override
  final LatLng? location;
  @override
  final BuiltList<DocumentReference<Object?>>? skillCategoryRefs;
  @override
  final BuiltList<DocumentReference<Object?>>? skillRefs;
  @override
  final BuiltList<DocumentReference<Object?>>? skillLevelRefs;
  @override
  final FieldsSkillStruct fieldSkill;
  @override
  final int? maxChatOrder;
  @override
  final int? maxNumberOfAppointments;
  @override
  final bool? isPremium;
  @override
  final String? roleType;
  @override
  final double? compeltedProfile;
  @override
  final BuiltList<DocumentReference<Object?>>? signUpStepBadg;
  @override
  final double? rate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserRecord([void Function(UserRecordBuilder)? updates]) =>
      (new UserRecordBuilder()..update(updates))._build();

  _$UserRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.accountType,
      this.nameTitle,
      required this.company,
      this.role,
      this.birthDate,
      this.country,
      this.language,
      this.hasMainAddress,
      this.periodic,
      this.verificationCode,
      this.description,
      this.yearsOfExperience,
      this.languages,
      this.insurance,
      this.location,
      this.skillCategoryRefs,
      this.skillRefs,
      this.skillLevelRefs,
      required this.fieldSkill,
      this.maxChatOrder,
      this.maxNumberOfAppointments,
      this.isPremium,
      this.roleType,
      this.compeltedProfile,
      this.signUpStepBadg,
      this.rate,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(company, r'UserRecord', 'company');
    BuiltValueNullFieldError.checkNotNull(
        fieldSkill, r'UserRecord', 'fieldSkill');
  }

  @override
  UserRecord rebuild(void Function(UserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserRecordBuilder toBuilder() => new UserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        accountType == other.accountType &&
        nameTitle == other.nameTitle &&
        company == other.company &&
        role == other.role &&
        birthDate == other.birthDate &&
        country == other.country &&
        language == other.language &&
        hasMainAddress == other.hasMainAddress &&
        periodic == other.periodic &&
        verificationCode == other.verificationCode &&
        description == other.description &&
        yearsOfExperience == other.yearsOfExperience &&
        languages == other.languages &&
        insurance == other.insurance &&
        location == other.location &&
        skillCategoryRefs == other.skillCategoryRefs &&
        skillRefs == other.skillRefs &&
        skillLevelRefs == other.skillLevelRefs &&
        fieldSkill == other.fieldSkill &&
        maxChatOrder == other.maxChatOrder &&
        maxNumberOfAppointments == other.maxNumberOfAppointments &&
        isPremium == other.isPremium &&
        roleType == other.roleType &&
        compeltedProfile == other.compeltedProfile &&
        signUpStepBadg == other.signUpStepBadg &&
        rate == other.rate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode), createdTime.hashCode), phoneNumber.hashCode), firstName.hashCode), lastName.hashCode), accountType.hashCode), nameTitle.hashCode), company.hashCode), role.hashCode), birthDate.hashCode), country.hashCode), language.hashCode), hasMainAddress.hashCode),
                                                                                periodic.hashCode),
                                                                            verificationCode.hashCode),
                                                                        description.hashCode),
                                                                    yearsOfExperience.hashCode),
                                                                languages.hashCode),
                                                            insurance.hashCode),
                                                        location.hashCode),
                                                    skillCategoryRefs.hashCode),
                                                skillRefs.hashCode),
                                            skillLevelRefs.hashCode),
                                        fieldSkill.hashCode),
                                    maxChatOrder.hashCode),
                                maxNumberOfAppointments.hashCode),
                            isPremium.hashCode),
                        roleType.hashCode),
                    compeltedProfile.hashCode),
                signUpStepBadg.hashCode),
            rate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('accountType', accountType)
          ..add('nameTitle', nameTitle)
          ..add('company', company)
          ..add('role', role)
          ..add('birthDate', birthDate)
          ..add('country', country)
          ..add('language', language)
          ..add('hasMainAddress', hasMainAddress)
          ..add('periodic', periodic)
          ..add('verificationCode', verificationCode)
          ..add('description', description)
          ..add('yearsOfExperience', yearsOfExperience)
          ..add('languages', languages)
          ..add('insurance', insurance)
          ..add('location', location)
          ..add('skillCategoryRefs', skillCategoryRefs)
          ..add('skillRefs', skillRefs)
          ..add('skillLevelRefs', skillLevelRefs)
          ..add('fieldSkill', fieldSkill)
          ..add('maxChatOrder', maxChatOrder)
          ..add('maxNumberOfAppointments', maxNumberOfAppointments)
          ..add('isPremium', isPremium)
          ..add('roleType', roleType)
          ..add('compeltedProfile', compeltedProfile)
          ..add('signUpStepBadg', signUpStepBadg)
          ..add('rate', rate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserRecordBuilder implements Builder<UserRecord, UserRecordBuilder> {
  _$UserRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _accountType;
  String? get accountType => _$this._accountType;
  set accountType(String? accountType) => _$this._accountType = accountType;

  String? _nameTitle;
  String? get nameTitle => _$this._nameTitle;
  set nameTitle(String? nameTitle) => _$this._nameTitle = nameTitle;

  CompanyStructBuilder? _company;
  CompanyStructBuilder get company =>
      _$this._company ??= new CompanyStructBuilder();
  set company(CompanyStructBuilder? company) => _$this._company = company;

  DocumentReference<Object?>? _role;
  DocumentReference<Object?>? get role => _$this._role;
  set role(DocumentReference<Object?>? role) => _$this._role = role;

  DateTime? _birthDate;
  DateTime? get birthDate => _$this._birthDate;
  set birthDate(DateTime? birthDate) => _$this._birthDate = birthDate;

  DocumentReference<Object?>? _country;
  DocumentReference<Object?>? get country => _$this._country;
  set country(DocumentReference<Object?>? country) => _$this._country = country;

  DocumentReference<Object?>? _language;
  DocumentReference<Object?>? get language => _$this._language;
  set language(DocumentReference<Object?>? language) =>
      _$this._language = language;

  bool? _hasMainAddress;
  bool? get hasMainAddress => _$this._hasMainAddress;
  set hasMainAddress(bool? hasMainAddress) =>
      _$this._hasMainAddress = hasMainAddress;

  bool? _periodic;
  bool? get periodic => _$this._periodic;
  set periodic(bool? periodic) => _$this._periodic = periodic;

  String? _verificationCode;
  String? get verificationCode => _$this._verificationCode;
  set verificationCode(String? verificationCode) =>
      _$this._verificationCode = verificationCode;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _yearsOfExperience;
  int? get yearsOfExperience => _$this._yearsOfExperience;
  set yearsOfExperience(int? yearsOfExperience) =>
      _$this._yearsOfExperience = yearsOfExperience;

  ListBuilder<String>? _languages;
  ListBuilder<String> get languages =>
      _$this._languages ??= new ListBuilder<String>();
  set languages(ListBuilder<String>? languages) =>
      _$this._languages = languages;

  bool? _insurance;
  bool? get insurance => _$this._insurance;
  set insurance(bool? insurance) => _$this._insurance = insurance;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  ListBuilder<DocumentReference<Object?>>? _skillCategoryRefs;
  ListBuilder<DocumentReference<Object?>> get skillCategoryRefs =>
      _$this._skillCategoryRefs ??=
          new ListBuilder<DocumentReference<Object?>>();
  set skillCategoryRefs(
          ListBuilder<DocumentReference<Object?>>? skillCategoryRefs) =>
      _$this._skillCategoryRefs = skillCategoryRefs;

  ListBuilder<DocumentReference<Object?>>? _skillRefs;
  ListBuilder<DocumentReference<Object?>> get skillRefs =>
      _$this._skillRefs ??= new ListBuilder<DocumentReference<Object?>>();
  set skillRefs(ListBuilder<DocumentReference<Object?>>? skillRefs) =>
      _$this._skillRefs = skillRefs;

  ListBuilder<DocumentReference<Object?>>? _skillLevelRefs;
  ListBuilder<DocumentReference<Object?>> get skillLevelRefs =>
      _$this._skillLevelRefs ??= new ListBuilder<DocumentReference<Object?>>();
  set skillLevelRefs(ListBuilder<DocumentReference<Object?>>? skillLevelRefs) =>
      _$this._skillLevelRefs = skillLevelRefs;

  FieldsSkillStructBuilder? _fieldSkill;
  FieldsSkillStructBuilder get fieldSkill =>
      _$this._fieldSkill ??= new FieldsSkillStructBuilder();
  set fieldSkill(FieldsSkillStructBuilder? fieldSkill) =>
      _$this._fieldSkill = fieldSkill;

  int? _maxChatOrder;
  int? get maxChatOrder => _$this._maxChatOrder;
  set maxChatOrder(int? maxChatOrder) => _$this._maxChatOrder = maxChatOrder;

  int? _maxNumberOfAppointments;
  int? get maxNumberOfAppointments => _$this._maxNumberOfAppointments;
  set maxNumberOfAppointments(int? maxNumberOfAppointments) =>
      _$this._maxNumberOfAppointments = maxNumberOfAppointments;

  bool? _isPremium;
  bool? get isPremium => _$this._isPremium;
  set isPremium(bool? isPremium) => _$this._isPremium = isPremium;

  String? _roleType;
  String? get roleType => _$this._roleType;
  set roleType(String? roleType) => _$this._roleType = roleType;

  double? _compeltedProfile;
  double? get compeltedProfile => _$this._compeltedProfile;
  set compeltedProfile(double? compeltedProfile) =>
      _$this._compeltedProfile = compeltedProfile;

  ListBuilder<DocumentReference<Object?>>? _signUpStepBadg;
  ListBuilder<DocumentReference<Object?>> get signUpStepBadg =>
      _$this._signUpStepBadg ??= new ListBuilder<DocumentReference<Object?>>();
  set signUpStepBadg(ListBuilder<DocumentReference<Object?>>? signUpStepBadg) =>
      _$this._signUpStepBadg = signUpStepBadg;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserRecordBuilder() {
    UserRecord._initializeBuilder(this);
  }

  UserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _accountType = $v.accountType;
      _nameTitle = $v.nameTitle;
      _company = $v.company.toBuilder();
      _role = $v.role;
      _birthDate = $v.birthDate;
      _country = $v.country;
      _language = $v.language;
      _hasMainAddress = $v.hasMainAddress;
      _periodic = $v.periodic;
      _verificationCode = $v.verificationCode;
      _description = $v.description;
      _yearsOfExperience = $v.yearsOfExperience;
      _languages = $v.languages?.toBuilder();
      _insurance = $v.insurance;
      _location = $v.location;
      _skillCategoryRefs = $v.skillCategoryRefs?.toBuilder();
      _skillRefs = $v.skillRefs?.toBuilder();
      _skillLevelRefs = $v.skillLevelRefs?.toBuilder();
      _fieldSkill = $v.fieldSkill.toBuilder();
      _maxChatOrder = $v.maxChatOrder;
      _maxNumberOfAppointments = $v.maxNumberOfAppointments;
      _isPremium = $v.isPremium;
      _roleType = $v.roleType;
      _compeltedProfile = $v.compeltedProfile;
      _signUpStepBadg = $v.signUpStepBadg?.toBuilder();
      _rate = $v.rate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserRecord;
  }

  @override
  void update(void Function(UserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserRecord build() => _build();

  _$UserRecord _build() {
    _$UserRecord _$result;
    try {
      _$result = _$v ??
          new _$UserRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              firstName: firstName,
              lastName: lastName,
              accountType: accountType,
              nameTitle: nameTitle,
              company: company.build(),
              role: role,
              birthDate: birthDate,
              country: country,
              language: language,
              hasMainAddress: hasMainAddress,
              periodic: periodic,
              verificationCode: verificationCode,
              description: description,
              yearsOfExperience: yearsOfExperience,
              languages: _languages?.build(),
              insurance: insurance,
              location: location,
              skillCategoryRefs: _skillCategoryRefs?.build(),
              skillRefs: _skillRefs?.build(),
              skillLevelRefs: _skillLevelRefs?.build(),
              fieldSkill: fieldSkill.build(),
              maxChatOrder: maxChatOrder,
              maxNumberOfAppointments: maxNumberOfAppointments,
              isPremium: isPremium,
              roleType: roleType,
              compeltedProfile: compeltedProfile,
              signUpStepBadg: _signUpStepBadg?.build(),
              rate: rate,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'company';
        company.build();

        _$failedField = 'languages';
        _languages?.build();

        _$failedField = 'skillCategoryRefs';
        _skillCategoryRefs?.build();
        _$failedField = 'skillRefs';
        _skillRefs?.build();
        _$failedField = 'skillLevelRefs';
        _skillLevelRefs?.build();
        _$failedField = 'fieldSkill';
        fieldSkill.build();

        _$failedField = 'signUpStepBadg';
        _signUpStepBadg?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
