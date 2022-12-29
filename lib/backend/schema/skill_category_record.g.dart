// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_category_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SkillCategoryRecord> _$skillCategoryRecordSerializer =
    new _$SkillCategoryRecordSerializer();

class _$SkillCategoryRecordSerializer
    implements StructuredSerializer<SkillCategoryRecord> {
  @override
  final Iterable<Type> types = const [
    SkillCategoryRecord,
    _$SkillCategoryRecord
  ];
  @override
  final String wireName = 'SkillCategoryRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SkillCategoryRecord object,
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
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
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
  SkillCategoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SkillCategoryRecordBuilder();

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
        case 'icon':
          result.icon = serializers.deserialize(value,
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

class _$SkillCategoryRecord extends SkillCategoryRecord {
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final String? icon;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SkillCategoryRecord(
          [void Function(SkillCategoryRecordBuilder)? updates]) =>
      (new SkillCategoryRecordBuilder()..update(updates))._build();

  _$SkillCategoryRecord._({this.name, this.displayName, this.icon, this.ffRef})
      : super._();

  @override
  SkillCategoryRecord rebuild(
          void Function(SkillCategoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillCategoryRecordBuilder toBuilder() =>
      new SkillCategoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillCategoryRecord &&
        name == other.name &&
        displayName == other.displayName &&
        icon == other.icon &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), displayName.hashCode), icon.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillCategoryRecord')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('icon', icon)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SkillCategoryRecordBuilder
    implements Builder<SkillCategoryRecord, SkillCategoryRecordBuilder> {
  _$SkillCategoryRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SkillCategoryRecordBuilder() {
    SkillCategoryRecord._initializeBuilder(this);
  }

  SkillCategoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _displayName = $v.displayName;
      _icon = $v.icon;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillCategoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillCategoryRecord;
  }

  @override
  void update(void Function(SkillCategoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillCategoryRecord build() => _build();

  _$SkillCategoryRecord _build() {
    final _$result = _$v ??
        new _$SkillCategoryRecord._(
            name: name, displayName: displayName, icon: icon, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
