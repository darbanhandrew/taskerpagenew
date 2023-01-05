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
    value = object.skillsRef;
    if (value != null) {
      result
        ..add('skills_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.skillsCategoryRef;
    if (value != null) {
      result
        ..add('skills_category_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
            specifiedType: const FullType(String)));
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
        case 'skills_ref':
          result.skillsRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'skills_category_ref':
          result.skillsCategoryRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'values':
          result.values = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  final BuiltList<DocumentReference<Object?>>? skillsRef;
  @override
  final BuiltList<DocumentReference<Object?>>? skillsCategoryRef;
  @override
  final bool? value;
  @override
  final String? values;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FildRecord([void Function(FildRecordBuilder)? updates]) =>
      (new FildRecordBuilder()..update(updates))._build();

  _$FildRecord._(
      {this.name,
      this.displayName,
      this.type,
      this.skillsRef,
      this.skillsCategoryRef,
      this.value,
      this.values,
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
        skillsRef == other.skillsRef &&
        skillsCategoryRef == other.skillsCategoryRef &&
        value == other.value &&
        values == other.values &&
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
                        skillsRef.hashCode),
                    skillsCategoryRef.hashCode),
                value.hashCode),
            values.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FildRecord')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('type', type)
          ..add('skillsRef', skillsRef)
          ..add('skillsCategoryRef', skillsCategoryRef)
          ..add('value', value)
          ..add('values', values)
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

  ListBuilder<DocumentReference<Object?>>? _skillsRef;
  ListBuilder<DocumentReference<Object?>> get skillsRef =>
      _$this._skillsRef ??= new ListBuilder<DocumentReference<Object?>>();
  set skillsRef(ListBuilder<DocumentReference<Object?>>? skillsRef) =>
      _$this._skillsRef = skillsRef;

  ListBuilder<DocumentReference<Object?>>? _skillsCategoryRef;
  ListBuilder<DocumentReference<Object?>> get skillsCategoryRef =>
      _$this._skillsCategoryRef ??=
          new ListBuilder<DocumentReference<Object?>>();
  set skillsCategoryRef(
          ListBuilder<DocumentReference<Object?>>? skillsCategoryRef) =>
      _$this._skillsCategoryRef = skillsCategoryRef;

  bool? _value;
  bool? get value => _$this._value;
  set value(bool? value) => _$this._value = value;

  String? _values;
  String? get values => _$this._values;
  set values(String? values) => _$this._values = values;

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
      _skillsRef = $v.skillsRef?.toBuilder();
      _skillsCategoryRef = $v.skillsCategoryRef?.toBuilder();
      _value = $v.value;
      _values = $v.values;
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
              skillsRef: _skillsRef?.build(),
              skillsCategoryRef: _skillsCategoryRef?.build(),
              value: value,
              values: values,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skillsRef';
        _skillsRef?.build();
        _$failedField = 'skillsCategoryRef';
        _skillsCategoryRef?.build();
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
