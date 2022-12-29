// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_degree_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EducationDegreeRecord> _$educationDegreeRecordSerializer =
    new _$EducationDegreeRecordSerializer();

class _$EducationDegreeRecordSerializer
    implements StructuredSerializer<EducationDegreeRecord> {
  @override
  final Iterable<Type> types = const [
    EducationDegreeRecord,
    _$EducationDegreeRecord
  ];
  @override
  final String wireName = 'EducationDegreeRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EducationDegreeRecord object,
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
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
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
  EducationDegreeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EducationDegreeRecordBuilder();

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
        case 'display_name':
          result.displayName = serializers.deserialize(value,
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

class _$EducationDegreeRecord extends EducationDegreeRecord {
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EducationDegreeRecord(
          [void Function(EducationDegreeRecordBuilder)? updates]) =>
      (new EducationDegreeRecordBuilder()..update(updates))._build();

  _$EducationDegreeRecord._({this.name, this.displayName, this.ffRef})
      : super._();

  @override
  EducationDegreeRecord rebuild(
          void Function(EducationDegreeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EducationDegreeRecordBuilder toBuilder() =>
      new EducationDegreeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EducationDegreeRecord &&
        name == other.name &&
        displayName == other.displayName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), displayName.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EducationDegreeRecord')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EducationDegreeRecordBuilder
    implements Builder<EducationDegreeRecord, EducationDegreeRecordBuilder> {
  _$EducationDegreeRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EducationDegreeRecordBuilder() {
    EducationDegreeRecord._initializeBuilder(this);
  }

  EducationDegreeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _displayName = $v.displayName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EducationDegreeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EducationDegreeRecord;
  }

  @override
  void update(void Function(EducationDegreeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EducationDegreeRecord build() => _build();

  _$EducationDegreeRecord _build() {
    final _$result = _$v ??
        new _$EducationDegreeRecord._(
            name: name, displayName: displayName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
