// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RateRecord> _$rateRecordSerializer = new _$RateRecordSerializer();

class _$RateRecordSerializer implements StructuredSerializer<RateRecord> {
  @override
  final Iterable<Type> types = const [RateRecord, _$RateRecord];
  @override
  final String wireName = 'RateRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RateRecord object,
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
    value = object.aVGPoint;
    if (value != null) {
      result
        ..add('AVG_point')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.appointmenRef;
    if (value != null) {
      result
        ..add('appointmen_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.poinit;
    if (value != null) {
      result
        ..add('poinit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskRef;
    if (value != null) {
      result
        ..add('task_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  RateRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RateRecordBuilder();

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
        case 'AVG_point':
          result.aVGPoint = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'appointmen_ref':
          result.appointmenRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'poinit':
          result.poinit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'task_ref':
          result.taskRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$RateRecord extends RateRecord {
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final double? aVGPoint;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? appointmenRef;
  @override
  final double? poinit;
  @override
  final String? comment;
  @override
  final DocumentReference<Object?>? taskRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RateRecord([void Function(RateRecordBuilder)? updates]) =>
      (new RateRecordBuilder()..update(updates))._build();

  _$RateRecord._(
      {this.name,
      this.displayName,
      this.aVGPoint,
      this.userRef,
      this.appointmenRef,
      this.poinit,
      this.comment,
      this.taskRef,
      this.ffRef})
      : super._();

  @override
  RateRecord rebuild(void Function(RateRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RateRecordBuilder toBuilder() => new RateRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RateRecord &&
        name == other.name &&
        displayName == other.displayName &&
        aVGPoint == other.aVGPoint &&
        userRef == other.userRef &&
        appointmenRef == other.appointmenRef &&
        poinit == other.poinit &&
        comment == other.comment &&
        taskRef == other.taskRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, name.hashCode),
                                    displayName.hashCode),
                                aVGPoint.hashCode),
                            userRef.hashCode),
                        appointmenRef.hashCode),
                    poinit.hashCode),
                comment.hashCode),
            taskRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RateRecord')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('aVGPoint', aVGPoint)
          ..add('userRef', userRef)
          ..add('appointmenRef', appointmenRef)
          ..add('poinit', poinit)
          ..add('comment', comment)
          ..add('taskRef', taskRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RateRecordBuilder implements Builder<RateRecord, RateRecordBuilder> {
  _$RateRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  double? _aVGPoint;
  double? get aVGPoint => _$this._aVGPoint;
  set aVGPoint(double? aVGPoint) => _$this._aVGPoint = aVGPoint;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _appointmenRef;
  DocumentReference<Object?>? get appointmenRef => _$this._appointmenRef;
  set appointmenRef(DocumentReference<Object?>? appointmenRef) =>
      _$this._appointmenRef = appointmenRef;

  double? _poinit;
  double? get poinit => _$this._poinit;
  set poinit(double? poinit) => _$this._poinit = poinit;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DocumentReference<Object?>? _taskRef;
  DocumentReference<Object?>? get taskRef => _$this._taskRef;
  set taskRef(DocumentReference<Object?>? taskRef) => _$this._taskRef = taskRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RateRecordBuilder() {
    RateRecord._initializeBuilder(this);
  }

  RateRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _displayName = $v.displayName;
      _aVGPoint = $v.aVGPoint;
      _userRef = $v.userRef;
      _appointmenRef = $v.appointmenRef;
      _poinit = $v.poinit;
      _comment = $v.comment;
      _taskRef = $v.taskRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RateRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RateRecord;
  }

  @override
  void update(void Function(RateRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RateRecord build() => _build();

  _$RateRecord _build() {
    final _$result = _$v ??
        new _$RateRecord._(
            name: name,
            displayName: displayName,
            aVGPoint: aVGPoint,
            userRef: userRef,
            appointmenRef: appointmenRef,
            poinit: poinit,
            comment: comment,
            taskRef: taskRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
