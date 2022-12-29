// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskRecord> _$taskRecordSerializer = new _$TaskRecordSerializer();

class _$TaskRecordSerializer implements StructuredSerializer<TaskRecord> {
  @override
  final Iterable<Type> types = const [TaskRecord, _$TaskRecord];
  @override
  final String wireName = 'TaskRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'task_time',
      serializers.serialize(object.taskTime,
          specifiedType: const FullType(TaskDateTimeStruct)),
      'tasker_type',
      serializers.serialize(object.taskerType,
          specifiedType: const FullType(TaskerTypeStruct)),
    ];
    Object? value;
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.skill;
    if (value != null) {
      result
        ..add('skill')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.skillLevels;
    if (value != null) {
      result
        ..add('skill_levels')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.languages;
    if (value != null) {
      result
        ..add('languages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.file;
    if (value != null) {
      result
        ..add('file')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedTime;
    if (value != null) {
      result
        ..add('modified_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.published;
    if (value != null) {
      result
        ..add('published')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.archived;
    if (value != null) {
      result
        ..add('archived')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.selectedAddress;
    if (value != null) {
      result
        ..add('selected_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
  TaskRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'skill':
          result.skill = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'skill_levels':
          result.skillLevels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'languages':
          result.languages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'file':
          result.file = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_time':
          result.modifiedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'published':
          result.published = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'archived':
          result.archived = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'selected_address':
          result.selectedAddress = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'task_time':
          result.taskTime.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TaskDateTimeStruct))!
              as TaskDateTimeStruct);
          break;
        case 'tasker_type':
          result.taskerType.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TaskerTypeStruct))!
              as TaskerTypeStruct);
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
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

class _$TaskRecord extends TaskRecord {
  @override
  final DocumentReference<Object?>? category;
  @override
  final DocumentReference<Object?>? skill;
  @override
  final BuiltList<DocumentReference<Object?>>? skillLevels;
  @override
  final BuiltList<String>? languages;
  @override
  final String? description;
  @override
  final String? file;
  @override
  final DateTime? createdTime;
  @override
  final DateTime? modifiedTime;
  @override
  final bool? published;
  @override
  final bool? archived;
  @override
  final DocumentReference<Object?>? selectedAddress;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final TaskDateTimeStruct taskTime;
  @override
  final TaskerTypeStruct taskerType;
  @override
  final BuiltList<DocumentReference<Object?>>? users;
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskRecord([void Function(TaskRecordBuilder)? updates]) =>
      (new TaskRecordBuilder()..update(updates))._build();

  _$TaskRecord._(
      {this.category,
      this.skill,
      this.skillLevels,
      this.languages,
      this.description,
      this.file,
      this.createdTime,
      this.modifiedTime,
      this.published,
      this.archived,
      this.selectedAddress,
      this.owner,
      required this.taskTime,
      required this.taskerType,
      this.users,
      this.name,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(taskTime, r'TaskRecord', 'taskTime');
    BuiltValueNullFieldError.checkNotNull(
        taskerType, r'TaskRecord', 'taskerType');
  }

  @override
  TaskRecord rebuild(void Function(TaskRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskRecordBuilder toBuilder() => new TaskRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskRecord &&
        category == other.category &&
        skill == other.skill &&
        skillLevels == other.skillLevels &&
        languages == other.languages &&
        description == other.description &&
        file == other.file &&
        createdTime == other.createdTime &&
        modifiedTime == other.modifiedTime &&
        published == other.published &&
        archived == other.archived &&
        selectedAddress == other.selectedAddress &&
        owner == other.owner &&
        taskTime == other.taskTime &&
        taskerType == other.taskerType &&
        users == other.users &&
        name == other.name &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        category
                                                                            .hashCode),
                                                                    skill
                                                                        .hashCode),
                                                                skillLevels
                                                                    .hashCode),
                                                            languages.hashCode),
                                                        description.hashCode),
                                                    file.hashCode),
                                                createdTime.hashCode),
                                            modifiedTime.hashCode),
                                        published.hashCode),
                                    archived.hashCode),
                                selectedAddress.hashCode),
                            owner.hashCode),
                        taskTime.hashCode),
                    taskerType.hashCode),
                users.hashCode),
            name.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskRecord')
          ..add('category', category)
          ..add('skill', skill)
          ..add('skillLevels', skillLevels)
          ..add('languages', languages)
          ..add('description', description)
          ..add('file', file)
          ..add('createdTime', createdTime)
          ..add('modifiedTime', modifiedTime)
          ..add('published', published)
          ..add('archived', archived)
          ..add('selectedAddress', selectedAddress)
          ..add('owner', owner)
          ..add('taskTime', taskTime)
          ..add('taskerType', taskerType)
          ..add('users', users)
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskRecordBuilder implements Builder<TaskRecord, TaskRecordBuilder> {
  _$TaskRecord? _$v;

  DocumentReference<Object?>? _category;
  DocumentReference<Object?>? get category => _$this._category;
  set category(DocumentReference<Object?>? category) =>
      _$this._category = category;

  DocumentReference<Object?>? _skill;
  DocumentReference<Object?>? get skill => _$this._skill;
  set skill(DocumentReference<Object?>? skill) => _$this._skill = skill;

  ListBuilder<DocumentReference<Object?>>? _skillLevels;
  ListBuilder<DocumentReference<Object?>> get skillLevels =>
      _$this._skillLevels ??= new ListBuilder<DocumentReference<Object?>>();
  set skillLevels(ListBuilder<DocumentReference<Object?>>? skillLevels) =>
      _$this._skillLevels = skillLevels;

  ListBuilder<String>? _languages;
  ListBuilder<String> get languages =>
      _$this._languages ??= new ListBuilder<String>();
  set languages(ListBuilder<String>? languages) =>
      _$this._languages = languages;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _file;
  String? get file => _$this._file;
  set file(String? file) => _$this._file = file;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _$this._modifiedTime;
  set modifiedTime(DateTime? modifiedTime) =>
      _$this._modifiedTime = modifiedTime;

  bool? _published;
  bool? get published => _$this._published;
  set published(bool? published) => _$this._published = published;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  DocumentReference<Object?>? _selectedAddress;
  DocumentReference<Object?>? get selectedAddress => _$this._selectedAddress;
  set selectedAddress(DocumentReference<Object?>? selectedAddress) =>
      _$this._selectedAddress = selectedAddress;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  TaskDateTimeStructBuilder? _taskTime;
  TaskDateTimeStructBuilder get taskTime =>
      _$this._taskTime ??= new TaskDateTimeStructBuilder();
  set taskTime(TaskDateTimeStructBuilder? taskTime) =>
      _$this._taskTime = taskTime;

  TaskerTypeStructBuilder? _taskerType;
  TaskerTypeStructBuilder get taskerType =>
      _$this._taskerType ??= new TaskerTypeStructBuilder();
  set taskerType(TaskerTypeStructBuilder? taskerType) =>
      _$this._taskerType = taskerType;

  ListBuilder<DocumentReference<Object?>>? _users;
  ListBuilder<DocumentReference<Object?>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object?>>();
  set users(ListBuilder<DocumentReference<Object?>>? users) =>
      _$this._users = users;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskRecordBuilder() {
    TaskRecord._initializeBuilder(this);
  }

  TaskRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _skill = $v.skill;
      _skillLevels = $v.skillLevels?.toBuilder();
      _languages = $v.languages?.toBuilder();
      _description = $v.description;
      _file = $v.file;
      _createdTime = $v.createdTime;
      _modifiedTime = $v.modifiedTime;
      _published = $v.published;
      _archived = $v.archived;
      _selectedAddress = $v.selectedAddress;
      _owner = $v.owner;
      _taskTime = $v.taskTime.toBuilder();
      _taskerType = $v.taskerType.toBuilder();
      _users = $v.users?.toBuilder();
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskRecord;
  }

  @override
  void update(void Function(TaskRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskRecord build() => _build();

  _$TaskRecord _build() {
    _$TaskRecord _$result;
    try {
      _$result = _$v ??
          new _$TaskRecord._(
              category: category,
              skill: skill,
              skillLevels: _skillLevels?.build(),
              languages: _languages?.build(),
              description: description,
              file: file,
              createdTime: createdTime,
              modifiedTime: modifiedTime,
              published: published,
              archived: archived,
              selectedAddress: selectedAddress,
              owner: owner,
              taskTime: taskTime.build(),
              taskerType: taskerType.build(),
              users: _users?.build(),
              name: name,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skillLevels';
        _skillLevels?.build();
        _$failedField = 'languages';
        _languages?.build();

        _$failedField = 'taskTime';
        taskTime.build();
        _$failedField = 'taskerType';
        taskerType.build();
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
