// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_date_time_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskDateTimeStruct> _$taskDateTimeStructSerializer =
    new _$TaskDateTimeStructSerializer();

class _$TaskDateTimeStructSerializer
    implements StructuredSerializer<TaskDateTimeStruct> {
  @override
  final Iterable<Type> types = const [TaskDateTimeStruct, _$TaskDateTimeStruct];
  @override
  final String wireName = 'TaskDateTimeStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TaskDateTimeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.periodic;
    if (value != null) {
      result
        ..add('periodic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.exact;
    if (value != null) {
      result
        ..add('exact')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.exactStartTime;
    if (value != null) {
      result
        ..add('exact_start_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.typeOfPeriod;
    if (value != null) {
      result
        ..add('type_of_period')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sessionHour;
    if (value != null) {
      result
        ..add('session_hour')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.preferedSpans;
    if (value != null) {
      result
        ..add('prefered_spans')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.preferedDays;
    if (value != null) {
      result
        ..add('prefered_days')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.daysPerWeek;
    if (value != null) {
      result
        ..add('days_per_week')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  TaskDateTimeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskDateTimeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'periodic':
          result.periodic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'exact':
          result.exact = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'exact_start_time':
          result.exactStartTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'type_of_period':
          result.typeOfPeriod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'session_hour':
          result.sessionHour = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'prefered_spans':
          result.preferedSpans.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'prefered_days':
          result.preferedDays.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'days_per_week':
          result.daysPerWeek = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$TaskDateTimeStruct extends TaskDateTimeStruct {
  @override
  final bool? periodic;
  @override
  final DateTime? startDate;
  @override
  final bool? exact;
  @override
  final DateTime? exactStartTime;
  @override
  final String? typeOfPeriod;
  @override
  final int? sessionHour;
  @override
  final BuiltList<String>? preferedSpans;
  @override
  final BuiltList<String>? preferedDays;
  @override
  final DateTime? endDate;
  @override
  final int? daysPerWeek;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TaskDateTimeStruct(
          [void Function(TaskDateTimeStructBuilder)? updates]) =>
      (new TaskDateTimeStructBuilder()..update(updates))._build();

  _$TaskDateTimeStruct._(
      {this.periodic,
      this.startDate,
      this.exact,
      this.exactStartTime,
      this.typeOfPeriod,
      this.sessionHour,
      this.preferedSpans,
      this.preferedDays,
      this.endDate,
      this.daysPerWeek,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'TaskDateTimeStruct', 'firestoreUtilData');
  }

  @override
  TaskDateTimeStruct rebuild(
          void Function(TaskDateTimeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskDateTimeStructBuilder toBuilder() =>
      new TaskDateTimeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskDateTimeStruct &&
        periodic == other.periodic &&
        startDate == other.startDate &&
        exact == other.exact &&
        exactStartTime == other.exactStartTime &&
        typeOfPeriod == other.typeOfPeriod &&
        sessionHour == other.sessionHour &&
        preferedSpans == other.preferedSpans &&
        preferedDays == other.preferedDays &&
        endDate == other.endDate &&
        daysPerWeek == other.daysPerWeek &&
        firestoreUtilData == other.firestoreUtilData;
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
                                $jc(
                                    $jc(
                                        $jc($jc(0, periodic.hashCode),
                                            startDate.hashCode),
                                        exact.hashCode),
                                    exactStartTime.hashCode),
                                typeOfPeriod.hashCode),
                            sessionHour.hashCode),
                        preferedSpans.hashCode),
                    preferedDays.hashCode),
                endDate.hashCode),
            daysPerWeek.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskDateTimeStruct')
          ..add('periodic', periodic)
          ..add('startDate', startDate)
          ..add('exact', exact)
          ..add('exactStartTime', exactStartTime)
          ..add('typeOfPeriod', typeOfPeriod)
          ..add('sessionHour', sessionHour)
          ..add('preferedSpans', preferedSpans)
          ..add('preferedDays', preferedDays)
          ..add('endDate', endDate)
          ..add('daysPerWeek', daysPerWeek)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TaskDateTimeStructBuilder
    implements Builder<TaskDateTimeStruct, TaskDateTimeStructBuilder> {
  _$TaskDateTimeStruct? _$v;

  bool? _periodic;
  bool? get periodic => _$this._periodic;
  set periodic(bool? periodic) => _$this._periodic = periodic;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  bool? _exact;
  bool? get exact => _$this._exact;
  set exact(bool? exact) => _$this._exact = exact;

  DateTime? _exactStartTime;
  DateTime? get exactStartTime => _$this._exactStartTime;
  set exactStartTime(DateTime? exactStartTime) =>
      _$this._exactStartTime = exactStartTime;

  String? _typeOfPeriod;
  String? get typeOfPeriod => _$this._typeOfPeriod;
  set typeOfPeriod(String? typeOfPeriod) => _$this._typeOfPeriod = typeOfPeriod;

  int? _sessionHour;
  int? get sessionHour => _$this._sessionHour;
  set sessionHour(int? sessionHour) => _$this._sessionHour = sessionHour;

  ListBuilder<String>? _preferedSpans;
  ListBuilder<String> get preferedSpans =>
      _$this._preferedSpans ??= new ListBuilder<String>();
  set preferedSpans(ListBuilder<String>? preferedSpans) =>
      _$this._preferedSpans = preferedSpans;

  ListBuilder<String>? _preferedDays;
  ListBuilder<String> get preferedDays =>
      _$this._preferedDays ??= new ListBuilder<String>();
  set preferedDays(ListBuilder<String>? preferedDays) =>
      _$this._preferedDays = preferedDays;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  int? _daysPerWeek;
  int? get daysPerWeek => _$this._daysPerWeek;
  set daysPerWeek(int? daysPerWeek) => _$this._daysPerWeek = daysPerWeek;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TaskDateTimeStructBuilder() {
    TaskDateTimeStruct._initializeBuilder(this);
  }

  TaskDateTimeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _periodic = $v.periodic;
      _startDate = $v.startDate;
      _exact = $v.exact;
      _exactStartTime = $v.exactStartTime;
      _typeOfPeriod = $v.typeOfPeriod;
      _sessionHour = $v.sessionHour;
      _preferedSpans = $v.preferedSpans?.toBuilder();
      _preferedDays = $v.preferedDays?.toBuilder();
      _endDate = $v.endDate;
      _daysPerWeek = $v.daysPerWeek;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskDateTimeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskDateTimeStruct;
  }

  @override
  void update(void Function(TaskDateTimeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskDateTimeStruct build() => _build();

  _$TaskDateTimeStruct _build() {
    _$TaskDateTimeStruct _$result;
    try {
      _$result = _$v ??
          new _$TaskDateTimeStruct._(
              periodic: periodic,
              startDate: startDate,
              exact: exact,
              exactStartTime: exactStartTime,
              typeOfPeriod: typeOfPeriod,
              sessionHour: sessionHour,
              preferedSpans: _preferedSpans?.build(),
              preferedDays: _preferedDays?.build(),
              endDate: endDate,
              daysPerWeek: daysPerWeek,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'TaskDateTimeStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'preferedSpans';
        _preferedSpans?.build();
        _$failedField = 'preferedDays';
        _preferedDays?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskDateTimeStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
