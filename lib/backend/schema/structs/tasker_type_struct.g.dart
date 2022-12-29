// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasker_type_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskerTypeStruct> _$taskerTypeStructSerializer =
    new _$TaskerTypeStructSerializer();

class _$TaskerTypeStructSerializer
    implements StructuredSerializer<TaskerTypeStruct> {
  @override
  final Iterable<Type> types = const [TaskerTypeStruct, _$TaskerTypeStruct];
  @override
  final String wireName = 'TaskerTypeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskerTypeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskerAgeStart;
    if (value != null) {
      result
        ..add('tasker_age_start')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.taskerAgeEnd;
    if (value != null) {
      result
        ..add('tasker_age_end')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.identified;
    if (value != null) {
      result
        ..add('identified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    value = object.insuranced;
    if (value != null) {
      result
        ..add('insuranced')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.driversLicense;
    if (value != null) {
      result
        ..add('drivers_license')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maxTaskerDistance;
    if (value != null) {
      result
        ..add('max_tasker_distance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  TaskerTypeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskerTypeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tasker_age_start':
          result.taskerAgeStart = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tasker_age_end':
          result.taskerAgeEnd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'identified':
          result.identified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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
        case 'insuranced':
          result.insuranced = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'drivers_license':
          result.driversLicense = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'max_tasker_distance':
          result.maxTaskerDistance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$TaskerTypeStruct extends TaskerTypeStruct {
  @override
  final String? gender;
  @override
  final int? taskerAgeStart;
  @override
  final int? taskerAgeEnd;
  @override
  final bool? identified;
  @override
  final int? yearsOfExperience;
  @override
  final BuiltList<String>? languages;
  @override
  final bool? insuranced;
  @override
  final String? driversLicense;
  @override
  final double? maxTaskerDistance;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TaskerTypeStruct(
          [void Function(TaskerTypeStructBuilder)? updates]) =>
      (new TaskerTypeStructBuilder()..update(updates))._build();

  _$TaskerTypeStruct._(
      {this.gender,
      this.taskerAgeStart,
      this.taskerAgeEnd,
      this.identified,
      this.yearsOfExperience,
      this.languages,
      this.insuranced,
      this.driversLicense,
      this.maxTaskerDistance,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'TaskerTypeStruct', 'firestoreUtilData');
  }

  @override
  TaskerTypeStruct rebuild(void Function(TaskerTypeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskerTypeStructBuilder toBuilder() =>
      new TaskerTypeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskerTypeStruct &&
        gender == other.gender &&
        taskerAgeStart == other.taskerAgeStart &&
        taskerAgeEnd == other.taskerAgeEnd &&
        identified == other.identified &&
        yearsOfExperience == other.yearsOfExperience &&
        languages == other.languages &&
        insuranced == other.insuranced &&
        driversLicense == other.driversLicense &&
        maxTaskerDistance == other.maxTaskerDistance &&
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
                            $jc(
                                $jc(
                                    $jc($jc(0, gender.hashCode),
                                        taskerAgeStart.hashCode),
                                    taskerAgeEnd.hashCode),
                                identified.hashCode),
                            yearsOfExperience.hashCode),
                        languages.hashCode),
                    insuranced.hashCode),
                driversLicense.hashCode),
            maxTaskerDistance.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskerTypeStruct')
          ..add('gender', gender)
          ..add('taskerAgeStart', taskerAgeStart)
          ..add('taskerAgeEnd', taskerAgeEnd)
          ..add('identified', identified)
          ..add('yearsOfExperience', yearsOfExperience)
          ..add('languages', languages)
          ..add('insuranced', insuranced)
          ..add('driversLicense', driversLicense)
          ..add('maxTaskerDistance', maxTaskerDistance)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TaskerTypeStructBuilder
    implements Builder<TaskerTypeStruct, TaskerTypeStructBuilder> {
  _$TaskerTypeStruct? _$v;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  int? _taskerAgeStart;
  int? get taskerAgeStart => _$this._taskerAgeStart;
  set taskerAgeStart(int? taskerAgeStart) =>
      _$this._taskerAgeStart = taskerAgeStart;

  int? _taskerAgeEnd;
  int? get taskerAgeEnd => _$this._taskerAgeEnd;
  set taskerAgeEnd(int? taskerAgeEnd) => _$this._taskerAgeEnd = taskerAgeEnd;

  bool? _identified;
  bool? get identified => _$this._identified;
  set identified(bool? identified) => _$this._identified = identified;

  int? _yearsOfExperience;
  int? get yearsOfExperience => _$this._yearsOfExperience;
  set yearsOfExperience(int? yearsOfExperience) =>
      _$this._yearsOfExperience = yearsOfExperience;

  ListBuilder<String>? _languages;
  ListBuilder<String> get languages =>
      _$this._languages ??= new ListBuilder<String>();
  set languages(ListBuilder<String>? languages) =>
      _$this._languages = languages;

  bool? _insuranced;
  bool? get insuranced => _$this._insuranced;
  set insuranced(bool? insuranced) => _$this._insuranced = insuranced;

  String? _driversLicense;
  String? get driversLicense => _$this._driversLicense;
  set driversLicense(String? driversLicense) =>
      _$this._driversLicense = driversLicense;

  double? _maxTaskerDistance;
  double? get maxTaskerDistance => _$this._maxTaskerDistance;
  set maxTaskerDistance(double? maxTaskerDistance) =>
      _$this._maxTaskerDistance = maxTaskerDistance;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TaskerTypeStructBuilder() {
    TaskerTypeStruct._initializeBuilder(this);
  }

  TaskerTypeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gender = $v.gender;
      _taskerAgeStart = $v.taskerAgeStart;
      _taskerAgeEnd = $v.taskerAgeEnd;
      _identified = $v.identified;
      _yearsOfExperience = $v.yearsOfExperience;
      _languages = $v.languages?.toBuilder();
      _insuranced = $v.insuranced;
      _driversLicense = $v.driversLicense;
      _maxTaskerDistance = $v.maxTaskerDistance;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskerTypeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskerTypeStruct;
  }

  @override
  void update(void Function(TaskerTypeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskerTypeStruct build() => _build();

  _$TaskerTypeStruct _build() {
    _$TaskerTypeStruct _$result;
    try {
      _$result = _$v ??
          new _$TaskerTypeStruct._(
              gender: gender,
              taskerAgeStart: taskerAgeStart,
              taskerAgeEnd: taskerAgeEnd,
              identified: identified,
              yearsOfExperience: yearsOfExperience,
              languages: _languages?.build(),
              insuranced: insuranced,
              driversLicense: driversLicense,
              maxTaskerDistance: maxTaskerDistance,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'TaskerTypeStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'languages';
        _languages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskerTypeStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
