// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fild_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FildRecord> _$fildRecordSerializer = new _$FildRecordSerializer();

class _$FildRecordSerializer implements StructuredSerializer<FildRecord> {
  @override
  final Iterable<Type> types = const [FildRecord, _$FildRecord];
  @override
  final String wireName = 'FildRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FildRecord object,
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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.values;
    if (value != null) {
      result
        ..add('values')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.skillCategoryRef;
    if (value != null) {
      result
        ..add('skill_category_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.skillRef;
    if (value != null) {
      result
        ..add('skill_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  FildRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FildRecordBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'skill_category_ref':
          result.skillCategoryRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'skill_ref':
          result.skillRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$FildRecord extends FildRecord {
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final String? type;
  @override
  final bool? value;
  @override
  final BuiltList<String>? values;
  @override
  final DocumentReference<Object?>? skillCategoryRef;
  @override
  final DocumentReference<Object?>? skillRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FildRecord([void Function(FildRecordBuilder)? updates]) =>
      (new FildRecordBuilder()..update(updates))._build();

  _$FildRecord._(
      {this.name,
      this.displayName,
      this.type,
      this.value,
      this.values,
      this.skillCategoryRef,
      this.skillRef,
      this.ffRef})
      : super._();

  @override
  FildRecord rebuild(void Function(FildRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FildRecordBuilder toBuilder() => new FildRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FildRecord &&
        name == other.name &&
        displayName == other.displayName &&
        type == other.type &&
        value == other.value &&
        values == other.values &&
        skillCategoryRef == other.skillCategoryRef &&
        skillRef == other.skillRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), displayName.hashCode),
                            type.hashCode),
                        value.hashCode),
                    values.hashCode),
                skillCategoryRef.hashCode),
            skillRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FildRecord')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('type', type)
          ..add('value', value)
          ..add('values', values)
          ..add('skillCategoryRef', skillCategoryRef)
          ..add('skillRef', skillRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FildRecordBuilder implements Builder<FildRecord, FildRecordBuilder> {
  _$FildRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _value;
  bool? get value => _$this._value;
  set value(bool? value) => _$this._value = value;

  ListBuilder<String>? _values;
  ListBuilder<String> get values =>
      _$this._values ??= new ListBuilder<String>();
  set values(ListBuilder<String>? values) => _$this._values = values;

  DocumentReference<Object?>? _skillCategoryRef;
  DocumentReference<Object?>? get skillCategoryRef => _$this._skillCategoryRef;
  set skillCategoryRef(DocumentReference<Object?>? skillCategoryRef) =>
      _$this._skillCategoryRef = skillCategoryRef;

  DocumentReference<Object?>? _skillRef;
  DocumentReference<Object?>? get skillRef => _$this._skillRef;
  set skillRef(DocumentReference<Object?>? skillRef) =>
      _$this._skillRef = skillRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FildRecordBuilder() {
    FildRecord._initializeBuilder(this);
  }

  FildRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _displayName = $v.displayName;
      _type = $v.type;
      _value = $v.value;
      _values = $v.values?.toBuilder();
      _skillCategoryRef = $v.skillCategoryRef;
      _skillRef = $v.skillRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FildRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FildRecord;
  }

  @override
  void update(void Function(FildRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FildRecord build() => _build();

  _$FildRecord _build() {
    _$FildRecord _$result;
    try {
      _$result = _$v ??
          new _$FildRecord._(
              name: name,
              displayName: displayName,
              type: type,
              value: value,
              values: _values?.build(),
              skillCategoryRef: skillCategoryRef,
              skillRef: skillRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FildRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
