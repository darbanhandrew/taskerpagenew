// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fields_skill_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FieldsSkillStruct> _$fieldsSkillStructSerializer =
    new _$FieldsSkillStructSerializer();

class _$FieldsSkillStructSerializer
    implements StructuredSerializer<FieldsSkillStruct> {
  @override
  final Iterable<Type> types = const [FieldsSkillStruct, _$FieldsSkillStruct];
  @override
  final String wireName = 'FieldsSkillStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, FieldsSkillStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.fieldRef;
    if (value != null) {
      result
        ..add('field_ref')
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
    value = object.categoryRef;
    if (value != null) {
      result
        ..add('category_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
    return result;
  }

  @override
  FieldsSkillStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FieldsSkillStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'field_ref':
          result.fieldRef = serializers.deserialize(value,
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
        case 'category_ref':
          result.categoryRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$FieldsSkillStruct extends FieldsSkillStruct {
  @override
  final DocumentReference<Object?>? fieldRef;
  @override
  final DocumentReference<Object?>? skillRef;
  @override
  final DocumentReference<Object?>? categoryRef;
  @override
  final bool? value;
  @override
  final BuiltList<String>? values;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$FieldsSkillStruct(
          [void Function(FieldsSkillStructBuilder)? updates]) =>
      (new FieldsSkillStructBuilder()..update(updates))._build();

  _$FieldsSkillStruct._(
      {this.fieldRef,
      this.skillRef,
      this.categoryRef,
      this.value,
      this.values,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'FieldsSkillStruct', 'firestoreUtilData');
  }

  @override
  FieldsSkillStruct rebuild(void Function(FieldsSkillStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FieldsSkillStructBuilder toBuilder() =>
      new FieldsSkillStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FieldsSkillStruct &&
        fieldRef == other.fieldRef &&
        skillRef == other.skillRef &&
        categoryRef == other.categoryRef &&
        value == other.value &&
        values == other.values &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, fieldRef.hashCode), skillRef.hashCode),
                    categoryRef.hashCode),
                value.hashCode),
            values.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FieldsSkillStruct')
          ..add('fieldRef', fieldRef)
          ..add('skillRef', skillRef)
          ..add('categoryRef', categoryRef)
          ..add('value', value)
          ..add('values', values)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class FieldsSkillStructBuilder
    implements Builder<FieldsSkillStruct, FieldsSkillStructBuilder> {
  _$FieldsSkillStruct? _$v;

  DocumentReference<Object?>? _fieldRef;
  DocumentReference<Object?>? get fieldRef => _$this._fieldRef;
  set fieldRef(DocumentReference<Object?>? fieldRef) =>
      _$this._fieldRef = fieldRef;

  DocumentReference<Object?>? _skillRef;
  DocumentReference<Object?>? get skillRef => _$this._skillRef;
  set skillRef(DocumentReference<Object?>? skillRef) =>
      _$this._skillRef = skillRef;

  DocumentReference<Object?>? _categoryRef;
  DocumentReference<Object?>? get categoryRef => _$this._categoryRef;
  set categoryRef(DocumentReference<Object?>? categoryRef) =>
      _$this._categoryRef = categoryRef;

  bool? _value;
  bool? get value => _$this._value;
  set value(bool? value) => _$this._value = value;

  ListBuilder<String>? _values;
  ListBuilder<String> get values =>
      _$this._values ??= new ListBuilder<String>();
  set values(ListBuilder<String>? values) => _$this._values = values;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  FieldsSkillStructBuilder() {
    FieldsSkillStruct._initializeBuilder(this);
  }

  FieldsSkillStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fieldRef = $v.fieldRef;
      _skillRef = $v.skillRef;
      _categoryRef = $v.categoryRef;
      _value = $v.value;
      _values = $v.values?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FieldsSkillStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FieldsSkillStruct;
  }

  @override
  void update(void Function(FieldsSkillStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FieldsSkillStruct build() => _build();

  _$FieldsSkillStruct _build() {
    _$FieldsSkillStruct _$result;
    try {
      _$result = _$v ??
          new _$FieldsSkillStruct._(
              fieldRef: fieldRef,
              skillRef: skillRef,
              categoryRef: categoryRef,
              value: value,
              values: _values?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'FieldsSkillStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FieldsSkillStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
