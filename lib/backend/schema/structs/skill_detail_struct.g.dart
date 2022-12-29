// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_detail_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SkillDetailStruct> _$skillDetailStructSerializer =
    new _$SkillDetailStructSerializer();

class _$SkillDetailStructSerializer
    implements StructuredSerializer<SkillDetailStruct> {
  @override
  final Iterable<Type> types = const [SkillDetailStruct, _$SkillDetailStruct];
  @override
  final String wireName = 'SkillDetailStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, SkillDetailStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.skillCategory;
    if (value != null) {
      result
        ..add('skill_category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userSkillRef;
    if (value != null) {
      result
        ..add('user_skill_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  SkillDetailStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SkillDetailStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skill_category':
          result.skillCategory = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user_skill_ref':
          result.userSkillRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$SkillDetailStruct extends SkillDetailStruct {
  @override
  final DocumentReference<Object?>? skillCategory;
  @override
  final DocumentReference<Object?>? userSkillRef;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$SkillDetailStruct(
          [void Function(SkillDetailStructBuilder)? updates]) =>
      (new SkillDetailStructBuilder()..update(updates))._build();

  _$SkillDetailStruct._(
      {this.skillCategory, this.userSkillRef, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'SkillDetailStruct', 'firestoreUtilData');
  }

  @override
  SkillDetailStruct rebuild(void Function(SkillDetailStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillDetailStructBuilder toBuilder() =>
      new SkillDetailStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillDetailStruct &&
        skillCategory == other.skillCategory &&
        userSkillRef == other.userSkillRef &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, skillCategory.hashCode), userSkillRef.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillDetailStruct')
          ..add('skillCategory', skillCategory)
          ..add('userSkillRef', userSkillRef)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class SkillDetailStructBuilder
    implements Builder<SkillDetailStruct, SkillDetailStructBuilder> {
  _$SkillDetailStruct? _$v;

  DocumentReference<Object?>? _skillCategory;
  DocumentReference<Object?>? get skillCategory => _$this._skillCategory;
  set skillCategory(DocumentReference<Object?>? skillCategory) =>
      _$this._skillCategory = skillCategory;

  DocumentReference<Object?>? _userSkillRef;
  DocumentReference<Object?>? get userSkillRef => _$this._userSkillRef;
  set userSkillRef(DocumentReference<Object?>? userSkillRef) =>
      _$this._userSkillRef = userSkillRef;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  SkillDetailStructBuilder() {
    SkillDetailStruct._initializeBuilder(this);
  }

  SkillDetailStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skillCategory = $v.skillCategory;
      _userSkillRef = $v.userSkillRef;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillDetailStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillDetailStruct;
  }

  @override
  void update(void Function(SkillDetailStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillDetailStruct build() => _build();

  _$SkillDetailStruct _build() {
    final _$result = _$v ??
        new _$SkillDetailStruct._(
            skillCategory: skillCategory,
            userSkillRef: userSkillRef,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'SkillDetailStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
