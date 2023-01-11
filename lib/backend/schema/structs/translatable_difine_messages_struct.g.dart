// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translatable_difine_messages_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TranslatableDifineMessagesStruct>
    _$translatableDifineMessagesStructSerializer =
    new _$TranslatableDifineMessagesStructSerializer();

class _$TranslatableDifineMessagesStructSerializer
    implements StructuredSerializer<TranslatableDifineMessagesStruct> {
  @override
  final Iterable<Type> types = const [
    TranslatableDifineMessagesStruct,
    _$TranslatableDifineMessagesStruct
  ];
  @override
  final String wireName = 'TranslatableDifineMessagesStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TranslatableDifineMessagesStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.language;
    if (value != null) {
      result
        ..add('language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
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
    return result;
  }

  @override
  TranslatableDifineMessagesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TranslatableDifineMessagesStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'messages':
          result.messages = serializers.deserialize(value,
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

class _$TranslatableDifineMessagesStruct
    extends TranslatableDifineMessagesStruct {
  @override
  final DocumentReference<Object?>? language;
  @override
  final String? text;
  @override
  final String? messages;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TranslatableDifineMessagesStruct(
          [void Function(TranslatableDifineMessagesStructBuilder)? updates]) =>
      (new TranslatableDifineMessagesStructBuilder()..update(updates))._build();

  _$TranslatableDifineMessagesStruct._(
      {this.language,
      this.text,
      this.messages,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(firestoreUtilData,
        r'TranslatableDifineMessagesStruct', 'firestoreUtilData');
  }

  @override
  TranslatableDifineMessagesStruct rebuild(
          void Function(TranslatableDifineMessagesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslatableDifineMessagesStructBuilder toBuilder() =>
      new TranslatableDifineMessagesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslatableDifineMessagesStruct &&
        language == other.language &&
        text == other.text &&
        messages == other.messages &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, language.hashCode), text.hashCode), messages.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslatableDifineMessagesStruct')
          ..add('language', language)
          ..add('text', text)
          ..add('messages', messages)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TranslatableDifineMessagesStructBuilder
    implements
        Builder<TranslatableDifineMessagesStruct,
            TranslatableDifineMessagesStructBuilder> {
  _$TranslatableDifineMessagesStruct? _$v;

  DocumentReference<Object?>? _language;
  DocumentReference<Object?>? get language => _$this._language;
  set language(DocumentReference<Object?>? language) =>
      _$this._language = language;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _messages;
  String? get messages => _$this._messages;
  set messages(String? messages) => _$this._messages = messages;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TranslatableDifineMessagesStructBuilder() {
    TranslatableDifineMessagesStruct._initializeBuilder(this);
  }

  TranslatableDifineMessagesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _language = $v.language;
      _text = $v.text;
      _messages = $v.messages;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TranslatableDifineMessagesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslatableDifineMessagesStruct;
  }

  @override
  void update(void Function(TranslatableDifineMessagesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslatableDifineMessagesStruct build() => _build();

  _$TranslatableDifineMessagesStruct _build() {
    final _$result = _$v ??
        new _$TranslatableDifineMessagesStruct._(
            language: language,
            text: text,
            messages: messages,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'TranslatableDifineMessagesStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
