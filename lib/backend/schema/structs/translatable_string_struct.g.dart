// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translatable_string_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TranslatableStringStruct> _$translatableStringStructSerializer =
    new _$TranslatableStringStructSerializer();

class _$TranslatableStringStructSerializer
    implements StructuredSerializer<TranslatableStringStruct> {
  @override
  final Iterable<Type> types = const [
    TranslatableStringStruct,
    _$TranslatableStringStruct
  ];
  @override
  final String wireName = 'TranslatableStringStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TranslatableStringStruct object,
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
    return result;
  }

  @override
  TranslatableStringStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TranslatableStringStructBuilder();

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

class _$TranslatableStringStruct extends TranslatableStringStruct {
  @override
  final DocumentReference<Object?>? language;
  @override
  final String? text;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TranslatableStringStruct(
          [void Function(TranslatableStringStructBuilder)? updates]) =>
      (new TranslatableStringStructBuilder()..update(updates))._build();

  _$TranslatableStringStruct._(
      {this.language, this.text, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'TranslatableStringStruct', 'firestoreUtilData');
  }

  @override
  TranslatableStringStruct rebuild(
          void Function(TranslatableStringStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslatableStringStructBuilder toBuilder() =>
      new TranslatableStringStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslatableStringStruct &&
        language == other.language &&
        text == other.text &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, language.hashCode), text.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslatableStringStruct')
          ..add('language', language)
          ..add('text', text)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TranslatableStringStructBuilder
    implements
        Builder<TranslatableStringStruct, TranslatableStringStructBuilder> {
  _$TranslatableStringStruct? _$v;

  DocumentReference<Object?>? _language;
  DocumentReference<Object?>? get language => _$this._language;
  set language(DocumentReference<Object?>? language) =>
      _$this._language = language;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TranslatableStringStructBuilder() {
    TranslatableStringStruct._initializeBuilder(this);
  }

  TranslatableStringStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _language = $v.language;
      _text = $v.text;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TranslatableStringStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslatableStringStruct;
  }

  @override
  void update(void Function(TranslatableStringStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslatableStringStruct build() => _build();

  _$TranslatableStringStruct _build() {
    final _$result = _$v ??
        new _$TranslatableStringStruct._(
            language: language,
            text: text,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'TranslatableStringStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
