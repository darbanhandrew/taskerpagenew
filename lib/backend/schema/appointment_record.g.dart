// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppointmentRecord> _$appointmentRecordSerializer =
    new _$AppointmentRecordSerializer();

class _$AppointmentRecordSerializer
    implements StructuredSerializer<AppointmentRecord> {
  @override
  final Iterable<Type> types = const [AppointmentRecord, _$AppointmentRecord];
  @override
  final String wireName = 'AppointmentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppointmentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.dateTime;
    if (value != null) {
      result
        ..add('date_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.accepted;
    if (value != null) {
      result
        ..add('accepted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.invited;
    if (value != null) {
      result
        ..add('invited')
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
  AppointmentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppointmentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'date_time':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'accepted':
          result.accepted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'invited':
          result.invited = serializers.deserialize(value,
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

class _$AppointmentRecord extends AppointmentRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? users;
  @override
  final DateTime? dateTime;
  @override
  final bool? accepted;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DocumentReference<Object?>? invited;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppointmentRecord(
          [void Function(AppointmentRecordBuilder)? updates]) =>
      (new AppointmentRecordBuilder()..update(updates))._build();

  _$AppointmentRecord._(
      {this.users,
      this.dateTime,
      this.accepted,
      this.createdAt,
      this.createdBy,
      this.invited,
      this.ffRef})
      : super._();

  @override
  AppointmentRecord rebuild(void Function(AppointmentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppointmentRecordBuilder toBuilder() =>
      new AppointmentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppointmentRecord &&
        users == other.users &&
        dateTime == other.dateTime &&
        accepted == other.accepted &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        invited == other.invited &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, users.hashCode), dateTime.hashCode),
                        accepted.hashCode),
                    createdAt.hashCode),
                createdBy.hashCode),
            invited.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppointmentRecord')
          ..add('users', users)
          ..add('dateTime', dateTime)
          ..add('accepted', accepted)
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('invited', invited)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppointmentRecordBuilder
    implements Builder<AppointmentRecord, AppointmentRecordBuilder> {
  _$AppointmentRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _users;
  ListBuilder<DocumentReference<Object?>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object?>>();
  set users(ListBuilder<DocumentReference<Object?>>? users) =>
      _$this._users = users;

  DateTime? _dateTime;
  DateTime? get dateTime => _$this._dateTime;
  set dateTime(DateTime? dateTime) => _$this._dateTime = dateTime;

  bool? _accepted;
  bool? get accepted => _$this._accepted;
  set accepted(bool? accepted) => _$this._accepted = accepted;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object?>? _invited;
  DocumentReference<Object?>? get invited => _$this._invited;
  set invited(DocumentReference<Object?>? invited) => _$this._invited = invited;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppointmentRecordBuilder() {
    AppointmentRecord._initializeBuilder(this);
  }

  AppointmentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _dateTime = $v.dateTime;
      _accepted = $v.accepted;
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _invited = $v.invited;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppointmentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppointmentRecord;
  }

  @override
  void update(void Function(AppointmentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppointmentRecord build() => _build();

  _$AppointmentRecord _build() {
    _$AppointmentRecord _$result;
    try {
      _$result = _$v ??
          new _$AppointmentRecord._(
              users: _users?.build(),
              dateTime: dateTime,
              accepted: accepted,
              createdAt: createdAt,
              createdBy: createdBy,
              invited: invited,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppointmentRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
