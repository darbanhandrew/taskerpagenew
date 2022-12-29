// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OptionStruct> _$optionStructSerializer =
    new _$OptionStructSerializer();

class _$OptionStructSerializer implements StructuredSerializer<OptionStruct> {
  @override
  final Iterable<Type> types = const [OptionStruct, _$OptionStruct];
  @override
  final String wireName = 'OptionStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, OptionStruct object,
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
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isSingle;
    if (value != null) {
      result
        ..add('is_single')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.values;
    if (value != null) {
      result
        ..add('values')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  OptionStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OptionStructBuilder();

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
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_single':
          result.isSingle = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$OptionStruct extends OptionStruct {
  @override
  final String? name;
  @override
  final int? order;
  @override
  final bool? isSingle;
  @override
  final String? value;
  @override
  final BuiltList<String>? values;
  @override
  final String? type;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$OptionStruct([void Function(OptionStructBuilder)? updates]) =>
      (new OptionStructBuilder()..update(updates))._build();

  _$OptionStruct._(
      {this.name,
      this.order,
      this.isSingle,
      this.value,
      this.values,
      this.type,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'OptionStruct', 'firestoreUtilData');
  }

  @override
  OptionStruct rebuild(void Function(OptionStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OptionStructBuilder toBuilder() => new OptionStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OptionStruct &&
        name == other.name &&
        order == other.order &&
        isSingle == other.isSingle &&
        value == other.value &&
        values == other.values &&
        type == other.type &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, name.hashCode), order.hashCode),
                        isSingle.hashCode),
                    value.hashCode),
                values.hashCode),
            type.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OptionStruct')
          ..add('name', name)
          ..add('order', order)
          ..add('isSingle', isSingle)
          ..add('value', value)
          ..add('values', values)
          ..add('type', type)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class OptionStructBuilder
    implements Builder<OptionStruct, OptionStructBuilder> {
  _$OptionStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  bool? _isSingle;
  bool? get isSingle => _$this._isSingle;
  set isSingle(bool? isSingle) => _$this._isSingle = isSingle;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  ListBuilder<String>? _values;
  ListBuilder<String> get values =>
      _$this._values ??= new ListBuilder<String>();
  set values(ListBuilder<String>? values) => _$this._values = values;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  OptionStructBuilder() {
    OptionStruct._initializeBuilder(this);
  }

  OptionStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _order = $v.order;
      _isSingle = $v.isSingle;
      _value = $v.value;
      _values = $v.values?.toBuilder();
      _type = $v.type;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OptionStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OptionStruct;
  }

  @override
  void update(void Function(OptionStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OptionStruct build() => _build();

  _$OptionStruct _build() {
    _$OptionStruct _$result;
    try {
      _$result = _$v ??
          new _$OptionStruct._(
              name: name,
              order: order,
              isSingle: isSingle,
              value: value,
              values: _values?.build(),
              type: type,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'OptionStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OptionStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
