// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_address_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskAddressRecord> _$taskAddressRecordSerializer =
    new _$TaskAddressRecordSerializer();

class _$TaskAddressRecordSerializer
    implements StructuredSerializer<TaskAddressRecord> {
  @override
  final Iterable<Type> types = const [TaskAddressRecord, _$TaskAddressRecord];
  @override
  final String wireName = 'TaskAddressRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskAddressRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(AddressStruct)),
    ];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedAt;
    if (value != null) {
      result
        ..add('modified_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.archived;
    if (value != null) {
      result
        ..add('archived')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.defaultAddress;
    if (value != null) {
      result
        ..add('default_address')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userAdreesRef;
    if (value != null) {
      result
        ..add('user_adrees_ref')
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
  TaskAddressRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskAddressRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(AddressStruct))! as AddressStruct);
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_at':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'archived':
          result.archived = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'default_address':
          result.defaultAddress = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'user_adrees_ref':
          result.userAdreesRef = serializers.deserialize(value,
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

class _$TaskAddressRecord extends TaskAddressRecord {
  @override
  final AddressStruct address;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final bool? archived;
  @override
  final bool? defaultAddress;
  @override
  final DocumentReference<Object?>? userAdreesRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskAddressRecord(
          [void Function(TaskAddressRecordBuilder)? updates]) =>
      (new TaskAddressRecordBuilder()..update(updates))._build();

  _$TaskAddressRecord._(
      {required this.address,
      this.createdAt,
      this.modifiedAt,
      this.archived,
      this.defaultAddress,
      this.userAdreesRef,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        address, r'TaskAddressRecord', 'address');
  }

  @override
  TaskAddressRecord rebuild(void Function(TaskAddressRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskAddressRecordBuilder toBuilder() =>
      new TaskAddressRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskAddressRecord &&
        address == other.address &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        archived == other.archived &&
        defaultAddress == other.defaultAddress &&
        userAdreesRef == other.userAdreesRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, address.hashCode), createdAt.hashCode),
                        modifiedAt.hashCode),
                    archived.hashCode),
                defaultAddress.hashCode),
            userAdreesRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskAddressRecord')
          ..add('address', address)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('archived', archived)
          ..add('defaultAddress', defaultAddress)
          ..add('userAdreesRef', userAdreesRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskAddressRecordBuilder
    implements Builder<TaskAddressRecord, TaskAddressRecordBuilder> {
  _$TaskAddressRecord? _$v;

  AddressStructBuilder? _address;
  AddressStructBuilder get address =>
      _$this._address ??= new AddressStructBuilder();
  set address(AddressStructBuilder? address) => _$this._address = address;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  bool? _defaultAddress;
  bool? get defaultAddress => _$this._defaultAddress;
  set defaultAddress(bool? defaultAddress) =>
      _$this._defaultAddress = defaultAddress;

  DocumentReference<Object?>? _userAdreesRef;
  DocumentReference<Object?>? get userAdreesRef => _$this._userAdreesRef;
  set userAdreesRef(DocumentReference<Object?>? userAdreesRef) =>
      _$this._userAdreesRef = userAdreesRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskAddressRecordBuilder() {
    TaskAddressRecord._initializeBuilder(this);
  }

  TaskAddressRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address.toBuilder();
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _archived = $v.archived;
      _defaultAddress = $v.defaultAddress;
      _userAdreesRef = $v.userAdreesRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskAddressRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskAddressRecord;
  }

  @override
  void update(void Function(TaskAddressRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskAddressRecord build() => _build();

  _$TaskAddressRecord _build() {
    _$TaskAddressRecord _$result;
    try {
      _$result = _$v ??
          new _$TaskAddressRecord._(
              address: address.build(),
              createdAt: createdAt,
              modifiedAt: modifiedAt,
              archived: archived,
              defaultAddress: defaultAddress,
              userAdreesRef: userAdreesRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        address.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskAddressRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
