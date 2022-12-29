// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasker_age_type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskerAgeTypeRecord> _$taskerAgeTypeRecordSerializer =
    new _$TaskerAgeTypeRecordSerializer();

class _$TaskerAgeTypeRecordSerializer
    implements StructuredSerializer<TaskerAgeTypeRecord> {
  @override
  final Iterable<Type> types = const [
    TaskerAgeTypeRecord,
    _$TaskerAgeTypeRecord
  ];
  @override
  final String wireName = 'TaskerAgeTypeRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TaskerAgeTypeRecord object,
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
    value = object.startAge;
    if (value != null) {
      result
        ..add('start_age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.endAge;
    if (value != null) {
      result
        ..add('end_age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  TaskerAgeTypeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskerAgeTypeRecordBuilder();

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
        case 'start_age':
          result.startAge = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'end_age':
          result.endAge = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$TaskerAgeTypeRecord extends TaskerAgeTypeRecord {
  @override
  final String? displayName;
  @override
  final int? startAge;
  @override
  final int? endAge;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskerAgeTypeRecord(
          [void Function(TaskerAgeTypeRecordBuilder)? updates]) =>
      (new TaskerAgeTypeRecordBuilder()..update(updates))._build();

  _$TaskerAgeTypeRecord._(
      {this.displayName, this.startAge, this.endAge, this.ffRef})
      : super._();

  @override
  TaskerAgeTypeRecord rebuild(
          void Function(TaskerAgeTypeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskerAgeTypeRecordBuilder toBuilder() =>
      new TaskerAgeTypeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskerAgeTypeRecord &&
        displayName == other.displayName &&
        startAge == other.startAge &&
        endAge == other.endAge &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, displayName.hashCode), startAge.hashCode),
            endAge.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskerAgeTypeRecord')
          ..add('displayName', displayName)
          ..add('startAge', startAge)
          ..add('endAge', endAge)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskerAgeTypeRecordBuilder
    implements Builder<TaskerAgeTypeRecord, TaskerAgeTypeRecordBuilder> {
  _$TaskerAgeTypeRecord? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  int? _startAge;
  int? get startAge => _$this._startAge;
  set startAge(int? startAge) => _$this._startAge = startAge;

  int? _endAge;
  int? get endAge => _$this._endAge;
  set endAge(int? endAge) => _$this._endAge = endAge;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskerAgeTypeRecordBuilder() {
    TaskerAgeTypeRecord._initializeBuilder(this);
  }

  TaskerAgeTypeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _startAge = $v.startAge;
      _endAge = $v.endAge;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskerAgeTypeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskerAgeTypeRecord;
  }

  @override
  void update(void Function(TaskerAgeTypeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskerAgeTypeRecord build() => _build();

  _$TaskerAgeTypeRecord _build() {
    final _$result = _$v ??
        new _$TaskerAgeTypeRecord._(
            displayName: displayName,
            startAge: startAge,
            endAge: endAge,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
