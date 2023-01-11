// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SkillRecord> _$skillRecordSerializer = new _$SkillRecordSerializer();

class _$SkillRecordSerializer implements StructuredSerializer<SkillRecord> {
  @override
  final Iterable<Type> types = const [SkillRecord, _$SkillRecord];
  @override
  final String wireName = 'SkillRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SkillRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.categoryRef;
    if (value != null) {
      result
        ..add('category_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.locale;
    if (value != null) {
      result
        ..add('locale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TranslatableStringStruct)])));
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
  SkillRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SkillRecordBuilder();

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
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_ref':
          result.categoryRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'locale':
          result.locale.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(TranslatableStringStruct)
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

class _$SkillRecord extends SkillRecord {
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final DocumentReference<Object?>? categoryRef;
  @override
  final BuiltList<TranslatableStringStruct>? locale;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SkillRecord([void Function(SkillRecordBuilder)? updates]) =>
      (new SkillRecordBuilder()..update(updates))._build();

  _$SkillRecord._(
      {this.name, this.displayName, this.categoryRef, this.locale, this.ffRef})
      : super._();

  @override
  SkillRecord rebuild(void Function(SkillRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillRecordBuilder toBuilder() => new SkillRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillRecord &&
        name == other.name &&
        displayName == other.displayName &&
        categoryRef == other.categoryRef &&
        locale == other.locale &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), displayName.hashCode),
                categoryRef.hashCode),
            locale.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillRecord')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('categoryRef', categoryRef)
          ..add('locale', locale)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SkillRecordBuilder implements Builder<SkillRecord, SkillRecordBuilder> {
  _$SkillRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  DocumentReference<Object?>? _categoryRef;
  DocumentReference<Object?>? get categoryRef => _$this._categoryRef;
  set categoryRef(DocumentReference<Object?>? categoryRef) =>
      _$this._categoryRef = categoryRef;

  ListBuilder<TranslatableStringStruct>? _locale;
  ListBuilder<TranslatableStringStruct> get locale =>
      _$this._locale ??= new ListBuilder<TranslatableStringStruct>();
  set locale(ListBuilder<TranslatableStringStruct>? locale) =>
      _$this._locale = locale;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SkillRecordBuilder() {
    SkillRecord._initializeBuilder(this);
  }

  SkillRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _displayName = $v.displayName;
      _categoryRef = $v.categoryRef;
      _locale = $v.locale?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillRecord;
  }

  @override
  void update(void Function(SkillRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillRecord build() => _build();

  _$SkillRecord _build() {
    _$SkillRecord _$result;
    try {
      _$result = _$v ??
          new _$SkillRecord._(
              name: name,
              displayName: displayName,
              categoryRef: categoryRef,
              locale: _locale?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'locale';
        _locale?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SkillRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
