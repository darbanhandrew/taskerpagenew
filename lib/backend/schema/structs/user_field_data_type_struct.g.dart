// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_field_data_type_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserFieldDataTypeStruct> _$userFieldDataTypeStructSerializer =
    new _$UserFieldDataTypeStructSerializer();

class _$UserFieldDataTypeStructSerializer
    implements StructuredSerializer<UserFieldDataTypeStruct> {
  @override
  final Iterable<Type> types = const [
    UserFieldDataTypeStruct,
    _$UserFieldDataTypeStruct
  ];
  @override
  final String wireName = 'UserFieldDataTypeStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserFieldDataTypeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.userFieldRef;
    if (value != null) {
      result
        ..add('user_field_ref')
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
    value = object.fieldRef;
    if (value != null) {
      result
        ..add('field_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UserFieldDataTypeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserFieldDataTypeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_field_ref':
          result.userFieldRef = serializers.deserialize(value,
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
        case 'field_ref':
          result.fieldRef = serializers.deserialize(value,
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

class _$UserFieldDataTypeStruct extends UserFieldDataTypeStruct {
  @override
  final DocumentReference<Object?>? userFieldRef;
  @override
  final bool? value;
  @override
  final BuiltList<String>? values;
  @override
  final DocumentReference<Object?>? fieldRef;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$UserFieldDataTypeStruct(
          [void Function(UserFieldDataTypeStructBuilder)? updates]) =>
      (new UserFieldDataTypeStructBuilder()..update(updates))._build();

  _$UserFieldDataTypeStruct._(
      {this.userFieldRef,
      this.value,
      this.values,
      this.fieldRef,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'UserFieldDataTypeStruct', 'firestoreUtilData');
  }

  @override
  UserFieldDataTypeStruct rebuild(
          void Function(UserFieldDataTypeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserFieldDataTypeStructBuilder toBuilder() =>
      new UserFieldDataTypeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserFieldDataTypeStruct &&
        userFieldRef == other.userFieldRef &&
        value == other.value &&
        values == other.values &&
        fieldRef == other.fieldRef &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, userFieldRef.hashCode), value.hashCode),
                values.hashCode),
            fieldRef.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserFieldDataTypeStruct')
          ..add('userFieldRef', userFieldRef)
          ..add('value', value)
          ..add('values', values)
          ..add('fieldRef', fieldRef)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class UserFieldDataTypeStructBuilder
    implements
        Builder<UserFieldDataTypeStruct, UserFieldDataTypeStructBuilder> {
  _$UserFieldDataTypeStruct? _$v;

  DocumentReference<Object?>? _userFieldRef;
  DocumentReference<Object?>? get userFieldRef => _$this._userFieldRef;
  set userFieldRef(DocumentReference<Object?>? userFieldRef) =>
      _$this._userFieldRef = userFieldRef;

  bool? _value;
  bool? get value => _$this._value;
  set value(bool? value) => _$this._value = value;

  ListBuilder<String>? _values;
  ListBuilder<String> get values =>
      _$this._values ??= new ListBuilder<String>();
  set values(ListBuilder<String>? values) => _$this._values = values;

  DocumentReference<Object?>? _fieldRef;
  DocumentReference<Object?>? get fieldRef => _$this._fieldRef;
  set fieldRef(DocumentReference<Object?>? fieldRef) =>
      _$this._fieldRef = fieldRef;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  UserFieldDataTypeStructBuilder() {
    UserFieldDataTypeStruct._initializeBuilder(this);
  }

  UserFieldDataTypeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userFieldRef = $v.userFieldRef;
      _value = $v.value;
      _values = $v.values?.toBuilder();
      _fieldRef = $v.fieldRef;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserFieldDataTypeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserFieldDataTypeStruct;
  }

  @override
  void update(void Function(UserFieldDataTypeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserFieldDataTypeStruct build() => _build();

  _$UserFieldDataTypeStruct _build() {
    _$UserFieldDataTypeStruct _$result;
    try {
      _$result = _$v ??
          new _$UserFieldDataTypeStruct._(
              userFieldRef: userFieldRef,
              value: value,
              values: _values?.build(),
              fieldRef: fieldRef,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'UserFieldDataTypeStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserFieldDataTypeStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
