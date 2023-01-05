// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_skill_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSkillRecord> _$userSkillRecordSerializer =
    new _$UserSkillRecordSerializer();

class _$UserSkillRecordSerializer
    implements StructuredSerializer<UserSkillRecord> {
  @override
  final Iterable<Type> types = const [UserSkillRecord, _$UserSkillRecord];
  @override
  final String wireName = 'UserSkillRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserSkillRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.skillCategoryRef;
    if (value != null) {
      result
        ..add('skill_category_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
    value = object.skillLevels;
    if (value != null) {
      result
        ..add('skill_levels')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  UserSkillRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSkillRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skill_category_ref':
          result.skillCategoryRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'skill_refs':
          result.skillRefs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'skill_levels':
          result.skillLevels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$UserSkillRecord extends UserSkillRecord {
  @override
  final DocumentReference<Object?>? skillCategoryRef;
  @override
  final BuiltList<DocumentReference<Object?>>? skillRefs;
  @override
  final BuiltList<DocumentReference<Object?>>? skillLevels;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserSkillRecord([void Function(UserSkillRecordBuilder)? updates]) =>
      (new UserSkillRecordBuilder()..update(updates))._build();

  _$UserSkillRecord._(
      {this.skillCategoryRef, this.skillRefs, this.skillLevels, this.ffRef})
      : super._();

  @override
  UserSkillRecord rebuild(void Function(UserSkillRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSkillRecordBuilder toBuilder() =>
      new UserSkillRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSkillRecord &&
        skillCategoryRef == other.skillCategoryRef &&
        skillRefs == other.skillRefs &&
        skillLevels == other.skillLevels &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, skillCategoryRef.hashCode), skillRefs.hashCode),
            skillLevels.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSkillRecord')
          ..add('skillCategoryRef', skillCategoryRef)
          ..add('skillRefs', skillRefs)
          ..add('skillLevels', skillLevels)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserSkillRecordBuilder
    implements Builder<UserSkillRecord, UserSkillRecordBuilder> {
  _$UserSkillRecord? _$v;

  DocumentReference<Object?>? _skillCategoryRef;
  DocumentReference<Object?>? get skillCategoryRef => _$this._skillCategoryRef;
  set skillCategoryRef(DocumentReference<Object?>? skillCategoryRef) =>
      _$this._skillCategoryRef = skillCategoryRef;

  ListBuilder<DocumentReference<Object?>>? _skillRefs;
  ListBuilder<DocumentReference<Object?>> get skillRefs =>
      _$this._skillRefs ??= new ListBuilder<DocumentReference<Object?>>();
  set skillRefs(ListBuilder<DocumentReference<Object?>>? skillRefs) =>
      _$this._skillRefs = skillRefs;

  ListBuilder<DocumentReference<Object?>>? _skillLevels;
  ListBuilder<DocumentReference<Object?>> get skillLevels =>
      _$this._skillLevels ??= new ListBuilder<DocumentReference<Object?>>();
  set skillLevels(ListBuilder<DocumentReference<Object?>>? skillLevels) =>
      _$this._skillLevels = skillLevels;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserSkillRecordBuilder() {
    UserSkillRecord._initializeBuilder(this);
  }

  UserSkillRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skillCategoryRef = $v.skillCategoryRef;
      _skillRefs = $v.skillRefs?.toBuilder();
      _skillLevels = $v.skillLevels?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSkillRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSkillRecord;
  }

  @override
  void update(void Function(UserSkillRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSkillRecord build() => _build();

  _$UserSkillRecord _build() {
    _$UserSkillRecord _$result;
    try {
      _$result = _$v ??
          new _$UserSkillRecord._(
              skillCategoryRef: skillCategoryRef,
              skillRefs: _skillRefs?.build(),
              skillLevels: _skillLevels?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skillRefs';
        _skillRefs?.build();
        _$failedField = 'skillLevels';
        _skillLevels?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserSkillRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
