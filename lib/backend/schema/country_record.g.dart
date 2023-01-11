// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CountryRecord> _$countryRecordSerializer =
    new _$CountryRecordSerializer();

class _$CountryRecordSerializer implements StructuredSerializer<CountryRecord> {
  @override
  final Iterable<Type> types = const [CountryRecord, _$CountryRecord];
  @override
  final String wireName = 'CountryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CountryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneCode;
    if (value != null) {
      result
        ..add('phone_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.flagIcon;
    if (value != null) {
      result
        ..add('flagIcon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.currencyCode;
    if (value != null) {
      result
        ..add('currency_code')
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
  CountryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_code':
          result.phoneCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'flagIcon':
          result.flagIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currency_code':
          result.currencyCode = serializers.deserialize(value,
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

class _$CountryRecord extends CountryRecord {
  @override
  final String? code;
  @override
  final String? phoneCode;
  @override
  final String? flagIcon;
  @override
  final String? currencyCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CountryRecord([void Function(CountryRecordBuilder)? updates]) =>
      (new CountryRecordBuilder()..update(updates))._build();

  _$CountryRecord._(
      {this.code, this.phoneCode, this.flagIcon, this.currencyCode, this.ffRef})
      : super._();

  @override
  CountryRecord rebuild(void Function(CountryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountryRecordBuilder toBuilder() => new CountryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountryRecord &&
        code == other.code &&
        phoneCode == other.phoneCode &&
        flagIcon == other.flagIcon &&
        currencyCode == other.currencyCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, code.hashCode), phoneCode.hashCode),
                flagIcon.hashCode),
            currencyCode.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CountryRecord')
          ..add('code', code)
          ..add('phoneCode', phoneCode)
          ..add('flagIcon', flagIcon)
          ..add('currencyCode', currencyCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CountryRecordBuilder
    implements Builder<CountryRecord, CountryRecordBuilder> {
  _$CountryRecord? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _phoneCode;
  String? get phoneCode => _$this._phoneCode;
  set phoneCode(String? phoneCode) => _$this._phoneCode = phoneCode;

  String? _flagIcon;
  String? get flagIcon => _$this._flagIcon;
  set flagIcon(String? flagIcon) => _$this._flagIcon = flagIcon;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CountryRecordBuilder() {
    CountryRecord._initializeBuilder(this);
  }

  CountryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _phoneCode = $v.phoneCode;
      _flagIcon = $v.flagIcon;
      _currencyCode = $v.currencyCode;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountryRecord;
  }

  @override
  void update(void Function(CountryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountryRecord build() => _build();

  _$CountryRecord _build() {
    final _$result = _$v ??
        new _$CountryRecord._(
            code: code,
            phoneCode: phoneCode,
            flagIcon: flagIcon,
            currencyCode: currencyCode,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
