// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoleRecord> _$roleRecordSerializer = new _$RoleRecordSerializer();

class _$RoleRecordSerializer implements StructuredSerializer<RoleRecord> {
  @override
  final Iterable<Type> types = const [RoleRecord, _$RoleRecord];
  @override
  final String wireName = 'RoleRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RoleRecord object,
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
    value = object.displayMessage;
    if (value != null) {
      result
        ..add('display_message')
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
  RoleRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoleRecordBuilder();

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
        case 'display_message':
          result.displayMessage = serializers.deserialize(value,
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

class _$RoleRecord extends RoleRecord {
  @override
  final String? name;
  @override
  final String? displayMessage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RoleRecord([void Function(RoleRecordBuilder)? updates]) =>
      (new RoleRecordBuilder()..update(updates))._build();

  _$RoleRecord._({this.name, this.displayMessage, this.ffRef}) : super._();

  @override
  RoleRecord rebuild(void Function(RoleRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleRecordBuilder toBuilder() => new RoleRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoleRecord &&
        name == other.name &&
        displayMessage == other.displayMessage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, name.hashCode), displayMessage.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoleRecord')
          ..add('name', name)
          ..add('displayMessage', displayMessage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RoleRecordBuilder implements Builder<RoleRecord, RoleRecordBuilder> {
  _$RoleRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayMessage;
  String? get displayMessage => _$this._displayMessage;
  set displayMessage(String? displayMessage) =>
      _$this._displayMessage = displayMessage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RoleRecordBuilder() {
    RoleRecord._initializeBuilder(this);
  }

  RoleRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _displayMessage = $v.displayMessage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoleRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoleRecord;
  }

  @override
  void update(void Function(RoleRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoleRecord build() => _build();

  _$RoleRecord _build() {
    final _$result = _$v ??
        new _$RoleRecord._(
            name: name, displayMessage: displayMessage, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
