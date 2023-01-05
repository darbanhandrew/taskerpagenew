// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'define_message_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DefineMessageRecord> _$defineMessageRecordSerializer =
    new _$DefineMessageRecordSerializer();

class _$DefineMessageRecordSerializer
    implements StructuredSerializer<DefineMessageRecord> {
  @override
  final Iterable<Type> types = const [
    DefineMessageRecord,
    _$DefineMessageRecord
  ];
  @override
  final String wireName = 'DefineMessageRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DefineMessageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.messages;
    if (value != null) {
      result
        ..add('messages')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  DefineMessageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DefineMessageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'messages':
          result.messages = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$DefineMessageRecord extends DefineMessageRecord {
  @override
  final String? displayName;
  @override
  final String? messages;
  @override
  final int? order;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DefineMessageRecord(
          [void Function(DefineMessageRecordBuilder)? updates]) =>
      (new DefineMessageRecordBuilder()..update(updates))._build();

  _$DefineMessageRecord._(
      {this.displayName, this.messages, this.order, this.type, this.ffRef})
      : super._();

  @override
  DefineMessageRecord rebuild(
          void Function(DefineMessageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DefineMessageRecordBuilder toBuilder() =>
      new DefineMessageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DefineMessageRecord &&
        displayName == other.displayName &&
        messages == other.messages &&
        order == other.order &&
        type == other.type &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, displayName.hashCode), messages.hashCode),
                order.hashCode),
            type.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DefineMessageRecord')
          ..add('displayName', displayName)
          ..add('messages', messages)
          ..add('order', order)
          ..add('type', type)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DefineMessageRecordBuilder
    implements Builder<DefineMessageRecord, DefineMessageRecordBuilder> {
  _$DefineMessageRecord? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _messages;
  String? get messages => _$this._messages;
  set messages(String? messages) => _$this._messages = messages;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DefineMessageRecordBuilder() {
    DefineMessageRecord._initializeBuilder(this);
  }

  DefineMessageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _messages = $v.messages;
      _order = $v.order;
      _type = $v.type;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DefineMessageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DefineMessageRecord;
  }

  @override
  void update(void Function(DefineMessageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DefineMessageRecord build() => _build();

  _$DefineMessageRecord _build() {
    final _$result = _$v ??
        new _$DefineMessageRecord._(
            displayName: displayName,
            messages: messages,
            order: order,
            type: type,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
