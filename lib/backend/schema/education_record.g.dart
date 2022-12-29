// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EducationRecord> _$educationRecordSerializer =
    new _$EducationRecordSerializer();

class _$EducationRecordSerializer
    implements StructuredSerializer<EducationRecord> {
  @override
  final Iterable<Type> types = const [EducationRecord, _$EducationRecord];
  @override
  final String wireName = 'EducationRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EducationRecord object,
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
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.educationDegree;
    if (value != null) {
      result
        ..add('education_degree')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.certificate;
    if (value != null) {
      result
        ..add('certificate')
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
  EducationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EducationRecordBuilder();

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
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'education_degree':
          result.educationDegree = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'certificate':
          result.certificate = serializers.deserialize(value,
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

class _$EducationRecord extends EducationRecord {
  @override
  final String? name;
  @override
  final String? company;
  @override
  final DocumentReference<Object?>? educationDegree;
  @override
  final String? certificate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EducationRecord([void Function(EducationRecordBuilder)? updates]) =>
      (new EducationRecordBuilder()..update(updates))._build();

  _$EducationRecord._(
      {this.name,
      this.company,
      this.educationDegree,
      this.certificate,
      this.ffRef})
      : super._();

  @override
  EducationRecord rebuild(void Function(EducationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EducationRecordBuilder toBuilder() =>
      new EducationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EducationRecord &&
        name == other.name &&
        company == other.company &&
        educationDegree == other.educationDegree &&
        certificate == other.certificate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), company.hashCode),
                educationDegree.hashCode),
            certificate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EducationRecord')
          ..add('name', name)
          ..add('company', company)
          ..add('educationDegree', educationDegree)
          ..add('certificate', certificate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EducationRecordBuilder
    implements Builder<EducationRecord, EducationRecordBuilder> {
  _$EducationRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  DocumentReference<Object?>? _educationDegree;
  DocumentReference<Object?>? get educationDegree => _$this._educationDegree;
  set educationDegree(DocumentReference<Object?>? educationDegree) =>
      _$this._educationDegree = educationDegree;

  String? _certificate;
  String? get certificate => _$this._certificate;
  set certificate(String? certificate) => _$this._certificate = certificate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EducationRecordBuilder() {
    EducationRecord._initializeBuilder(this);
  }

  EducationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _company = $v.company;
      _educationDegree = $v.educationDegree;
      _certificate = $v.certificate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EducationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EducationRecord;
  }

  @override
  void update(void Function(EducationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EducationRecord build() => _build();

  _$EducationRecord _build() {
    final _$result = _$v ??
        new _$EducationRecord._(
            name: name,
            company: company,
            educationDegree: educationDegree,
            certificate: certificate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
