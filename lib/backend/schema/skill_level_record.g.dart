// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_level_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SkillLevelRecord> _$skillLevelRecordSerializer =
    new _$SkillLevelRecordSerializer();

class _$SkillLevelRecordSerializer
    implements StructuredSerializer<SkillLevelRecord> {
  @override
  final Iterable<Type> types = const [SkillLevelRecord, _$SkillLevelRecord];
  @override
  final String wireName = 'SkillLevelRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SkillLevelRecord object,
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
  SkillLevelRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SkillLevelRecordBuilder();

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

class _$SkillLevelRecord extends SkillLevelRecord {
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SkillLevelRecord(
          [void Function(SkillLevelRecordBuilder)? updates]) =>
      (new SkillLevelRecordBuilder()..update(updates))._build();

  _$SkillLevelRecord._({this.name, this.displayName, this.ffRef}) : super._();

  @override
  SkillLevelRecord rebuild(void Function(SkillLevelRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillLevelRecordBuilder toBuilder() =>
      new SkillLevelRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillLevelRecord &&
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
    return (newBuiltValueToStringHelper(r'SkillLevelRecord')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SkillLevelRecordBuilder
    implements Builder<SkillLevelRecord, SkillLevelRecordBuilder> {
  _$SkillLevelRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SkillLevelRecordBuilder() {
    SkillLevelRecord._initializeBuilder(this);
  }

  SkillLevelRecordBuilder get _$this {
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
  void replace(SkillLevelRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillLevelRecord;
  }

  @override
  void update(void Function(SkillLevelRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillLevelRecord build() => _build();

  _$SkillLevelRecord _build() {
    final _$result = _$v ??
        new _$SkillLevelRecord._(
            name: name, displayName: displayName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
