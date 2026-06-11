// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RoutineTemplatesTable extends RoutineTemplates
    with TableInfo<$RoutineTemplatesTable, RoutineTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
    'weekday',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, weekday, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    } else if (isInserting) {
      context.missing(_weekdayMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RoutineTemplatesTable createAlias(String alias) {
    return $RoutineTemplatesTable(attachedDatabase, alias);
  }
}

class RoutineTemplate extends DataClass implements Insertable<RoutineTemplate> {
  final String id;
  final String name;
  final int weekday;
  final DateTime createdAt;
  const RoutineTemplate({
    required this.id,
    required this.name,
    required this.weekday,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['weekday'] = Variable<int>(weekday);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RoutineTemplatesCompanion toCompanion(bool nullToAbsent) {
    return RoutineTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      weekday: Value(weekday),
      createdAt: Value(createdAt),
    );
  }

  factory RoutineTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineTemplate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      weekday: serializer.fromJson<int>(json['weekday']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'weekday': serializer.toJson<int>(weekday),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RoutineTemplate copyWith({
    String? id,
    String? name,
    int? weekday,
    DateTime? createdAt,
  }) => RoutineTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    weekday: weekday ?? this.weekday,
    createdAt: createdAt ?? this.createdAt,
  );
  RoutineTemplate copyWithCompanion(RoutineTemplatesCompanion data) {
    return RoutineTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weekday: $weekday, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, weekday, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.weekday == this.weekday &&
          other.createdAt == this.createdAt);
}

class RoutineTemplatesCompanion extends UpdateCompanion<RoutineTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> weekday;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const RoutineTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.weekday = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineTemplatesCompanion.insert({
    required String id,
    required String name,
    required int weekday,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       weekday = Value(weekday),
       createdAt = Value(createdAt);
  static Insertable<RoutineTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? weekday,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (weekday != null) 'weekday': weekday,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? weekday,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return RoutineTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      weekday: weekday ?? this.weekday,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weekday: $weekday, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineEventsTable extends RoutineEvents
    with TableInfo<$RoutineEventsTable, RoutineEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
    'weekday',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMinutesMeta = const VerificationMeta(
    'startMinutes',
  );
  @override
  late final GeneratedColumn<int> startMinutes = GeneratedColumn<int>(
    'start_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinutesMeta = const VerificationMeta(
    'endMinutes',
  );
  @override
  late final GeneratedColumn<int> endMinutes = GeneratedColumn<int>(
    'end_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaTagsMeta = const VerificationMeta(
    'areaTags',
  );
  @override
  late final GeneratedColumn<String> areaTags = GeneratedColumn<String>(
    'area_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notifyMeta = const VerificationMeta('notify');
  @override
  late final GeneratedColumn<bool> notify = GeneratedColumn<bool>(
    'notify',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    templateId,
    title,
    type,
    weekday,
    startMinutes,
    endMinutes,
    areaTags,
    notify,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    } else if (isInserting) {
      context.missing(_weekdayMeta);
    }
    if (data.containsKey('start_minutes')) {
      context.handle(
        _startMinutesMeta,
        startMinutes.isAcceptableOrUnknown(
          data['start_minutes']!,
          _startMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinutesMeta);
    }
    if (data.containsKey('end_minutes')) {
      context.handle(
        _endMinutesMeta,
        endMinutes.isAcceptableOrUnknown(data['end_minutes']!, _endMinutesMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinutesMeta);
    }
    if (data.containsKey('area_tags')) {
      context.handle(
        _areaTagsMeta,
        areaTags.isAcceptableOrUnknown(data['area_tags']!, _areaTagsMeta),
      );
    }
    if (data.containsKey('notify')) {
      context.handle(
        _notifyMeta,
        notify.isAcceptableOrUnknown(data['notify']!, _notifyMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      weekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday'],
      )!,
      startMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minutes'],
      )!,
      endMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minutes'],
      )!,
      areaTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_tags'],
      )!,
      notify: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RoutineEventsTable createAlias(String alias) {
    return $RoutineEventsTable(attachedDatabase, alias);
  }
}

class RoutineEvent extends DataClass implements Insertable<RoutineEvent> {
  final String id;
  final String? templateId;
  final String title;
  final String type;
  final int weekday;
  final int startMinutes;
  final int endMinutes;
  final String areaTags;
  final bool notify;
  final String? description;
  final DateTime createdAt;
  const RoutineEvent({
    required this.id,
    this.templateId,
    required this.title,
    required this.type,
    required this.weekday,
    required this.startMinutes,
    required this.endMinutes,
    required this.areaTags,
    required this.notify,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<String>(templateId);
    }
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['weekday'] = Variable<int>(weekday);
    map['start_minutes'] = Variable<int>(startMinutes);
    map['end_minutes'] = Variable<int>(endMinutes);
    map['area_tags'] = Variable<String>(areaTags);
    map['notify'] = Variable<bool>(notify);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RoutineEventsCompanion toCompanion(bool nullToAbsent) {
    return RoutineEventsCompanion(
      id: Value(id),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
      title: Value(title),
      type: Value(type),
      weekday: Value(weekday),
      startMinutes: Value(startMinutes),
      endMinutes: Value(endMinutes),
      areaTags: Value(areaTags),
      notify: Value(notify),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory RoutineEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineEvent(
      id: serializer.fromJson<String>(json['id']),
      templateId: serializer.fromJson<String?>(json['templateId']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      weekday: serializer.fromJson<int>(json['weekday']),
      startMinutes: serializer.fromJson<int>(json['startMinutes']),
      endMinutes: serializer.fromJson<int>(json['endMinutes']),
      areaTags: serializer.fromJson<String>(json['areaTags']),
      notify: serializer.fromJson<bool>(json['notify']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'templateId': serializer.toJson<String?>(templateId),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'weekday': serializer.toJson<int>(weekday),
      'startMinutes': serializer.toJson<int>(startMinutes),
      'endMinutes': serializer.toJson<int>(endMinutes),
      'areaTags': serializer.toJson<String>(areaTags),
      'notify': serializer.toJson<bool>(notify),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RoutineEvent copyWith({
    String? id,
    Value<String?> templateId = const Value.absent(),
    String? title,
    String? type,
    int? weekday,
    int? startMinutes,
    int? endMinutes,
    String? areaTags,
    bool? notify,
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => RoutineEvent(
    id: id ?? this.id,
    templateId: templateId.present ? templateId.value : this.templateId,
    title: title ?? this.title,
    type: type ?? this.type,
    weekday: weekday ?? this.weekday,
    startMinutes: startMinutes ?? this.startMinutes,
    endMinutes: endMinutes ?? this.endMinutes,
    areaTags: areaTags ?? this.areaTags,
    notify: notify ?? this.notify,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  RoutineEvent copyWithCompanion(RoutineEventsCompanion data) {
    return RoutineEvent(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      startMinutes: data.startMinutes.present
          ? data.startMinutes.value
          : this.startMinutes,
      endMinutes: data.endMinutes.present
          ? data.endMinutes.value
          : this.endMinutes,
      areaTags: data.areaTags.present ? data.areaTags.value : this.areaTags,
      notify: data.notify.present ? data.notify.value : this.notify,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineEvent(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('weekday: $weekday, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('areaTags: $areaTags, ')
          ..write('notify: $notify, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    templateId,
    title,
    type,
    weekday,
    startMinutes,
    endMinutes,
    areaTags,
    notify,
    description,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineEvent &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.title == this.title &&
          other.type == this.type &&
          other.weekday == this.weekday &&
          other.startMinutes == this.startMinutes &&
          other.endMinutes == this.endMinutes &&
          other.areaTags == this.areaTags &&
          other.notify == this.notify &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class RoutineEventsCompanion extends UpdateCompanion<RoutineEvent> {
  final Value<String> id;
  final Value<String?> templateId;
  final Value<String> title;
  final Value<String> type;
  final Value<int> weekday;
  final Value<int> startMinutes;
  final Value<int> endMinutes;
  final Value<String> areaTags;
  final Value<bool> notify;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const RoutineEventsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.weekday = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.areaTags = const Value.absent(),
    this.notify = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineEventsCompanion.insert({
    required String id,
    this.templateId = const Value.absent(),
    required String title,
    required String type,
    required int weekday,
    required int startMinutes,
    required int endMinutes,
    this.areaTags = const Value.absent(),
    this.notify = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       type = Value(type),
       weekday = Value(weekday),
       startMinutes = Value(startMinutes),
       endMinutes = Value(endMinutes),
       createdAt = Value(createdAt);
  static Insertable<RoutineEvent> custom({
    Expression<String>? id,
    Expression<String>? templateId,
    Expression<String>? title,
    Expression<String>? type,
    Expression<int>? weekday,
    Expression<int>? startMinutes,
    Expression<int>? endMinutes,
    Expression<String>? areaTags,
    Expression<bool>? notify,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (weekday != null) 'weekday': weekday,
      if (startMinutes != null) 'start_minutes': startMinutes,
      if (endMinutes != null) 'end_minutes': endMinutes,
      if (areaTags != null) 'area_tags': areaTags,
      if (notify != null) 'notify': notify,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineEventsCompanion copyWith({
    Value<String>? id,
    Value<String?>? templateId,
    Value<String>? title,
    Value<String>? type,
    Value<int>? weekday,
    Value<int>? startMinutes,
    Value<int>? endMinutes,
    Value<String>? areaTags,
    Value<bool>? notify,
    Value<String?>? description,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return RoutineEventsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      title: title ?? this.title,
      type: type ?? this.type,
      weekday: weekday ?? this.weekday,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
      areaTags: areaTags ?? this.areaTags,
      notify: notify ?? this.notify,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (startMinutes.present) {
      map['start_minutes'] = Variable<int>(startMinutes.value);
    }
    if (endMinutes.present) {
      map['end_minutes'] = Variable<int>(endMinutes.value);
    }
    if (areaTags.present) {
      map['area_tags'] = Variable<String>(areaTags.value);
    }
    if (notify.present) {
      map['notify'] = Variable<bool>(notify.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineEventsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('weekday: $weekday, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('areaTags: $areaTags, ')
          ..write('notify: $notify, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineOverridesTable extends RoutineOverrides
    with TableInfo<$RoutineOverridesTable, RoutineOverride> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineOverridesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routineEventIdMeta = const VerificationMeta(
    'routineEventId',
  );
  @override
  late final GeneratedColumn<String> routineEventId = GeneratedColumn<String>(
    'routine_event_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('single_day'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startMinutesMeta = const VerificationMeta(
    'startMinutes',
  );
  @override
  late final GeneratedColumn<int> startMinutes = GeneratedColumn<int>(
    'start_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endMinutesMeta = const VerificationMeta(
    'endMinutes',
  );
  @override
  late final GeneratedColumn<int> endMinutes = GeneratedColumn<int>(
    'end_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routineEventId,
    date,
    scope,
    title,
    startMinutes,
    endMinutes,
    isDeleted,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_overrides';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineOverride> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('routine_event_id')) {
      context.handle(
        _routineEventIdMeta,
        routineEventId.isAcceptableOrUnknown(
          data['routine_event_id']!,
          _routineEventIdMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('start_minutes')) {
      context.handle(
        _startMinutesMeta,
        startMinutes.isAcceptableOrUnknown(
          data['start_minutes']!,
          _startMinutesMeta,
        ),
      );
    }
    if (data.containsKey('end_minutes')) {
      context.handle(
        _endMinutesMeta,
        endMinutes.isAcceptableOrUnknown(data['end_minutes']!, _endMinutesMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineOverride map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineOverride(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      routineEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_event_id'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      startMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minutes'],
      ),
      endMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minutes'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RoutineOverridesTable createAlias(String alias) {
    return $RoutineOverridesTable(attachedDatabase, alias);
  }
}

class RoutineOverride extends DataClass implements Insertable<RoutineOverride> {
  final String id;
  final String? routineEventId;
  final DateTime date;
  final String scope;
  final String? title;
  final int? startMinutes;
  final int? endMinutes;
  final bool isDeleted;
  final DateTime createdAt;
  const RoutineOverride({
    required this.id,
    this.routineEventId,
    required this.date,
    required this.scope,
    this.title,
    this.startMinutes,
    this.endMinutes,
    required this.isDeleted,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || routineEventId != null) {
      map['routine_event_id'] = Variable<String>(routineEventId);
    }
    map['date'] = Variable<DateTime>(date);
    map['scope'] = Variable<String>(scope);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || startMinutes != null) {
      map['start_minutes'] = Variable<int>(startMinutes);
    }
    if (!nullToAbsent || endMinutes != null) {
      map['end_minutes'] = Variable<int>(endMinutes);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RoutineOverridesCompanion toCompanion(bool nullToAbsent) {
    return RoutineOverridesCompanion(
      id: Value(id),
      routineEventId: routineEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineEventId),
      date: Value(date),
      scope: Value(scope),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      startMinutes: startMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(startMinutes),
      endMinutes: endMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(endMinutes),
      isDeleted: Value(isDeleted),
      createdAt: Value(createdAt),
    );
  }

  factory RoutineOverride.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineOverride(
      id: serializer.fromJson<String>(json['id']),
      routineEventId: serializer.fromJson<String?>(json['routineEventId']),
      date: serializer.fromJson<DateTime>(json['date']),
      scope: serializer.fromJson<String>(json['scope']),
      title: serializer.fromJson<String?>(json['title']),
      startMinutes: serializer.fromJson<int?>(json['startMinutes']),
      endMinutes: serializer.fromJson<int?>(json['endMinutes']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'routineEventId': serializer.toJson<String?>(routineEventId),
      'date': serializer.toJson<DateTime>(date),
      'scope': serializer.toJson<String>(scope),
      'title': serializer.toJson<String?>(title),
      'startMinutes': serializer.toJson<int?>(startMinutes),
      'endMinutes': serializer.toJson<int?>(endMinutes),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RoutineOverride copyWith({
    String? id,
    Value<String?> routineEventId = const Value.absent(),
    DateTime? date,
    String? scope,
    Value<String?> title = const Value.absent(),
    Value<int?> startMinutes = const Value.absent(),
    Value<int?> endMinutes = const Value.absent(),
    bool? isDeleted,
    DateTime? createdAt,
  }) => RoutineOverride(
    id: id ?? this.id,
    routineEventId: routineEventId.present
        ? routineEventId.value
        : this.routineEventId,
    date: date ?? this.date,
    scope: scope ?? this.scope,
    title: title.present ? title.value : this.title,
    startMinutes: startMinutes.present ? startMinutes.value : this.startMinutes,
    endMinutes: endMinutes.present ? endMinutes.value : this.endMinutes,
    isDeleted: isDeleted ?? this.isDeleted,
    createdAt: createdAt ?? this.createdAt,
  );
  RoutineOverride copyWithCompanion(RoutineOverridesCompanion data) {
    return RoutineOverride(
      id: data.id.present ? data.id.value : this.id,
      routineEventId: data.routineEventId.present
          ? data.routineEventId.value
          : this.routineEventId,
      date: data.date.present ? data.date.value : this.date,
      scope: data.scope.present ? data.scope.value : this.scope,
      title: data.title.present ? data.title.value : this.title,
      startMinutes: data.startMinutes.present
          ? data.startMinutes.value
          : this.startMinutes,
      endMinutes: data.endMinutes.present
          ? data.endMinutes.value
          : this.endMinutes,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineOverride(')
          ..write('id: $id, ')
          ..write('routineEventId: $routineEventId, ')
          ..write('date: $date, ')
          ..write('scope: $scope, ')
          ..write('title: $title, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    routineEventId,
    date,
    scope,
    title,
    startMinutes,
    endMinutes,
    isDeleted,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineOverride &&
          other.id == this.id &&
          other.routineEventId == this.routineEventId &&
          other.date == this.date &&
          other.scope == this.scope &&
          other.title == this.title &&
          other.startMinutes == this.startMinutes &&
          other.endMinutes == this.endMinutes &&
          other.isDeleted == this.isDeleted &&
          other.createdAt == this.createdAt);
}

class RoutineOverridesCompanion extends UpdateCompanion<RoutineOverride> {
  final Value<String> id;
  final Value<String?> routineEventId;
  final Value<DateTime> date;
  final Value<String> scope;
  final Value<String?> title;
  final Value<int?> startMinutes;
  final Value<int?> endMinutes;
  final Value<bool> isDeleted;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const RoutineOverridesCompanion({
    this.id = const Value.absent(),
    this.routineEventId = const Value.absent(),
    this.date = const Value.absent(),
    this.scope = const Value.absent(),
    this.title = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineOverridesCompanion.insert({
    required String id,
    this.routineEventId = const Value.absent(),
    required DateTime date,
    this.scope = const Value.absent(),
    this.title = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<RoutineOverride> custom({
    Expression<String>? id,
    Expression<String>? routineEventId,
    Expression<DateTime>? date,
    Expression<String>? scope,
    Expression<String>? title,
    Expression<int>? startMinutes,
    Expression<int>? endMinutes,
    Expression<bool>? isDeleted,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routineEventId != null) 'routine_event_id': routineEventId,
      if (date != null) 'date': date,
      if (scope != null) 'scope': scope,
      if (title != null) 'title': title,
      if (startMinutes != null) 'start_minutes': startMinutes,
      if (endMinutes != null) 'end_minutes': endMinutes,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineOverridesCompanion copyWith({
    Value<String>? id,
    Value<String?>? routineEventId,
    Value<DateTime>? date,
    Value<String>? scope,
    Value<String?>? title,
    Value<int?>? startMinutes,
    Value<int?>? endMinutes,
    Value<bool>? isDeleted,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return RoutineOverridesCompanion(
      id: id ?? this.id,
      routineEventId: routineEventId ?? this.routineEventId,
      date: date ?? this.date,
      scope: scope ?? this.scope,
      title: title ?? this.title,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (routineEventId.present) {
      map['routine_event_id'] = Variable<String>(routineEventId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startMinutes.present) {
      map['start_minutes'] = Variable<int>(startMinutes.value);
    }
    if (endMinutes.present) {
      map['end_minutes'] = Variable<int>(endMinutes.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineOverridesCompanion(')
          ..write('id: $id, ')
          ..write('routineEventId: $routineEventId, ')
          ..write('date: $date, ')
          ..write('scope: $scope, ')
          ..write('title: $title, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineEventLogsTable extends RoutineEventLogs
    with TableInfo<$RoutineEventLogsTable, RoutineEventLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineEventLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routineEventIdMeta = const VerificationMeta(
    'routineEventId',
  );
  @override
  late final GeneratedColumn<String> routineEventId = GeneratedColumn<String>(
    'routine_event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routineEventId,
    date,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_event_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineEventLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('routine_event_id')) {
      context.handle(
        _routineEventIdMeta,
        routineEventId.isAcceptableOrUnknown(
          data['routine_event_id']!,
          _routineEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_routineEventIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineEventLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineEventLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      routineEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_event_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RoutineEventLogsTable createAlias(String alias) {
    return $RoutineEventLogsTable(attachedDatabase, alias);
  }
}

class RoutineEventLog extends DataClass implements Insertable<RoutineEventLog> {
  final String id;
  final String routineEventId;
  final DateTime date;
  final String status;
  final DateTime createdAt;
  const RoutineEventLog({
    required this.id,
    required this.routineEventId,
    required this.date,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['routine_event_id'] = Variable<String>(routineEventId);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RoutineEventLogsCompanion toCompanion(bool nullToAbsent) {
    return RoutineEventLogsCompanion(
      id: Value(id),
      routineEventId: Value(routineEventId),
      date: Value(date),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory RoutineEventLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineEventLog(
      id: serializer.fromJson<String>(json['id']),
      routineEventId: serializer.fromJson<String>(json['routineEventId']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'routineEventId': serializer.toJson<String>(routineEventId),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RoutineEventLog copyWith({
    String? id,
    String? routineEventId,
    DateTime? date,
    String? status,
    DateTime? createdAt,
  }) => RoutineEventLog(
    id: id ?? this.id,
    routineEventId: routineEventId ?? this.routineEventId,
    date: date ?? this.date,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  RoutineEventLog copyWithCompanion(RoutineEventLogsCompanion data) {
    return RoutineEventLog(
      id: data.id.present ? data.id.value : this.id,
      routineEventId: data.routineEventId.present
          ? data.routineEventId.value
          : this.routineEventId,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineEventLog(')
          ..write('id: $id, ')
          ..write('routineEventId: $routineEventId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, routineEventId, date, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineEventLog &&
          other.id == this.id &&
          other.routineEventId == this.routineEventId &&
          other.date == this.date &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class RoutineEventLogsCompanion extends UpdateCompanion<RoutineEventLog> {
  final Value<String> id;
  final Value<String> routineEventId;
  final Value<DateTime> date;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const RoutineEventLogsCompanion({
    this.id = const Value.absent(),
    this.routineEventId = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineEventLogsCompanion.insert({
    required String id,
    required String routineEventId,
    required DateTime date,
    required String status,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       routineEventId = Value(routineEventId),
       date = Value(date),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<RoutineEventLog> custom({
    Expression<String>? id,
    Expression<String>? routineEventId,
    Expression<DateTime>? date,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routineEventId != null) 'routine_event_id': routineEventId,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineEventLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? routineEventId,
    Value<DateTime>? date,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return RoutineEventLogsCompanion(
      id: id ?? this.id,
      routineEventId: routineEventId ?? this.routineEventId,
      date: date ?? this.date,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (routineEventId.present) {
      map['routine_event_id'] = Variable<String>(routineEventId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineEventLogsCompanion(')
          ..write('id: $id, ')
          ..write('routineEventId: $routineEventId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyMissionsTable extends DailyMissions
    with TableInfo<$DailyMissionsTable, DailyMission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyMissionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _xpRewardMeta = const VerificationMeta(
    'xpReward',
  );
  @override
  late final GeneratedColumn<int> xpReward = GeneratedColumn<int>(
    'xp_reward',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    title,
    description,
    status,
    xpReward,
    createdAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_missions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyMission> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('xp_reward')) {
      context.handle(
        _xpRewardMeta,
        xpReward.isAcceptableOrUnknown(data['xp_reward']!, _xpRewardMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyMission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyMission(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      xpReward: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_reward'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $DailyMissionsTable createAlias(String alias) {
    return $DailyMissionsTable(attachedDatabase, alias);
  }
}

class DailyMission extends DataClass implements Insertable<DailyMission> {
  final String id;
  final DateTime date;
  final String title;
  final String? description;
  final String status;
  final int xpReward;
  final DateTime createdAt;
  final DateTime? completedAt;
  const DailyMission({
    required this.id,
    required this.date,
    required this.title,
    this.description,
    required this.status,
    required this.xpReward,
    required this.createdAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<String>(status);
    map['xp_reward'] = Variable<int>(xpReward);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  DailyMissionsCompanion toCompanion(bool nullToAbsent) {
    return DailyMissionsCompanion(
      id: Value(id),
      date: Value(date),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      xpReward: Value(xpReward),
      createdAt: Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory DailyMission.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyMission(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<String>(json['status']),
      xpReward: serializer.fromJson<int>(json['xpReward']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<String>(status),
      'xpReward': serializer.toJson<int>(xpReward),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  DailyMission copyWith({
    String? id,
    DateTime? date,
    String? title,
    Value<String?> description = const Value.absent(),
    String? status,
    int? xpReward,
    DateTime? createdAt,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => DailyMission(
    id: id ?? this.id,
    date: date ?? this.date,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    status: status ?? this.status,
    xpReward: xpReward ?? this.xpReward,
    createdAt: createdAt ?? this.createdAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  DailyMission copyWithCompanion(DailyMissionsCompanion data) {
    return DailyMission(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      status: data.status.present ? data.status.value : this.status,
      xpReward: data.xpReward.present ? data.xpReward.value : this.xpReward,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyMission(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    title,
    description,
    status,
    xpReward,
    createdAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyMission &&
          other.id == this.id &&
          other.date == this.date &&
          other.title == this.title &&
          other.description == this.description &&
          other.status == this.status &&
          other.xpReward == this.xpReward &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt);
}

class DailyMissionsCompanion extends UpdateCompanion<DailyMission> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> status;
  final Value<int> xpReward;
  final Value<DateTime> createdAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const DailyMissionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyMissionsCompanion.insert({
    required String id,
    required DateTime date,
    required String title,
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.xpReward = const Value.absent(),
    required DateTime createdAt,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<DailyMission> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? status,
    Expression<int>? xpReward,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (xpReward != null) 'xp_reward': xpReward,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyMissionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? status,
    Value<int>? xpReward,
    Value<DateTime>? createdAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return DailyMissionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      xpReward: xpReward ?? this.xpReward,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (xpReward.present) {
      map['xp_reward'] = Variable<int>(xpReward.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyMissionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MissionTasksTable extends MissionTasks
    with TableInfo<$MissionTasksTable, MissionTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MissionTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _missionIdMeta = const VerificationMeta(
    'missionId',
  );
  @override
  late final GeneratedColumn<String> missionId = GeneratedColumn<String>(
    'mission_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _xpRewardMeta = const VerificationMeta(
    'xpReward',
  );
  @override
  late final GeneratedColumn<int> xpReward = GeneratedColumn<int>(
    'xp_reward',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    missionId,
    title,
    isDone,
    xpReward,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mission_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<MissionTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mission_id')) {
      context.handle(
        _missionIdMeta,
        missionId.isAcceptableOrUnknown(data['mission_id']!, _missionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_missionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('xp_reward')) {
      context.handle(
        _xpRewardMeta,
        xpReward.isAcceptableOrUnknown(data['xp_reward']!, _xpRewardMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MissionTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MissionTask(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      missionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mission_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
      xpReward: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_reward'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MissionTasksTable createAlias(String alias) {
    return $MissionTasksTable(attachedDatabase, alias);
  }
}

class MissionTask extends DataClass implements Insertable<MissionTask> {
  final String id;
  final String missionId;
  final String title;
  final bool isDone;
  final int xpReward;
  final DateTime createdAt;
  const MissionTask({
    required this.id,
    required this.missionId,
    required this.title,
    required this.isDone,
    required this.xpReward,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mission_id'] = Variable<String>(missionId);
    map['title'] = Variable<String>(title);
    map['is_done'] = Variable<bool>(isDone);
    map['xp_reward'] = Variable<int>(xpReward);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MissionTasksCompanion toCompanion(bool nullToAbsent) {
    return MissionTasksCompanion(
      id: Value(id),
      missionId: Value(missionId),
      title: Value(title),
      isDone: Value(isDone),
      xpReward: Value(xpReward),
      createdAt: Value(createdAt),
    );
  }

  factory MissionTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MissionTask(
      id: serializer.fromJson<String>(json['id']),
      missionId: serializer.fromJson<String>(json['missionId']),
      title: serializer.fromJson<String>(json['title']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      xpReward: serializer.fromJson<int>(json['xpReward']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'missionId': serializer.toJson<String>(missionId),
      'title': serializer.toJson<String>(title),
      'isDone': serializer.toJson<bool>(isDone),
      'xpReward': serializer.toJson<int>(xpReward),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MissionTask copyWith({
    String? id,
    String? missionId,
    String? title,
    bool? isDone,
    int? xpReward,
    DateTime? createdAt,
  }) => MissionTask(
    id: id ?? this.id,
    missionId: missionId ?? this.missionId,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    xpReward: xpReward ?? this.xpReward,
    createdAt: createdAt ?? this.createdAt,
  );
  MissionTask copyWithCompanion(MissionTasksCompanion data) {
    return MissionTask(
      id: data.id.present ? data.id.value : this.id,
      missionId: data.missionId.present ? data.missionId.value : this.missionId,
      title: data.title.present ? data.title.value : this.title,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      xpReward: data.xpReward.present ? data.xpReward.value : this.xpReward,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MissionTask(')
          ..write('id: $id, ')
          ..write('missionId: $missionId, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, missionId, title, isDone, xpReward, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MissionTask &&
          other.id == this.id &&
          other.missionId == this.missionId &&
          other.title == this.title &&
          other.isDone == this.isDone &&
          other.xpReward == this.xpReward &&
          other.createdAt == this.createdAt);
}

class MissionTasksCompanion extends UpdateCompanion<MissionTask> {
  final Value<String> id;
  final Value<String> missionId;
  final Value<String> title;
  final Value<bool> isDone;
  final Value<int> xpReward;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MissionTasksCompanion({
    this.id = const Value.absent(),
    this.missionId = const Value.absent(),
    this.title = const Value.absent(),
    this.isDone = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MissionTasksCompanion.insert({
    required String id,
    required String missionId,
    required String title,
    this.isDone = const Value.absent(),
    this.xpReward = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       missionId = Value(missionId),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<MissionTask> custom({
    Expression<String>? id,
    Expression<String>? missionId,
    Expression<String>? title,
    Expression<bool>? isDone,
    Expression<int>? xpReward,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (missionId != null) 'mission_id': missionId,
      if (title != null) 'title': title,
      if (isDone != null) 'is_done': isDone,
      if (xpReward != null) 'xp_reward': xpReward,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MissionTasksCompanion copyWith({
    Value<String>? id,
    Value<String>? missionId,
    Value<String>? title,
    Value<bool>? isDone,
    Value<int>? xpReward,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MissionTasksCompanion(
      id: id ?? this.id,
      missionId: missionId ?? this.missionId,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      xpReward: xpReward ?? this.xpReward,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (missionId.present) {
      map['mission_id'] = Variable<String>(missionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (xpReward.present) {
      map['xp_reward'] = Variable<int>(xpReward.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MissionTasksCompanion(')
          ..write('id: $id, ')
          ..write('missionId: $missionId, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MissionLogsTable extends MissionLogs
    with TableInfo<$MissionLogsTable, MissionLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MissionLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _missionIdMeta = const VerificationMeta(
    'missionId',
  );
  @override
  late final GeneratedColumn<String> missionId = GeneratedColumn<String>(
    'mission_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    missionId,
    action,
    note,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mission_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MissionLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mission_id')) {
      context.handle(
        _missionIdMeta,
        missionId.isAcceptableOrUnknown(data['mission_id']!, _missionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_missionIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MissionLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MissionLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      missionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mission_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MissionLogsTable createAlias(String alias) {
    return $MissionLogsTable(attachedDatabase, alias);
  }
}

class MissionLog extends DataClass implements Insertable<MissionLog> {
  final String id;
  final String missionId;
  final String action;
  final String? note;
  final DateTime createdAt;
  const MissionLog({
    required this.id,
    required this.missionId,
    required this.action,
    this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mission_id'] = Variable<String>(missionId);
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MissionLogsCompanion toCompanion(bool nullToAbsent) {
    return MissionLogsCompanion(
      id: Value(id),
      missionId: Value(missionId),
      action: Value(action),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory MissionLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MissionLog(
      id: serializer.fromJson<String>(json['id']),
      missionId: serializer.fromJson<String>(json['missionId']),
      action: serializer.fromJson<String>(json['action']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'missionId': serializer.toJson<String>(missionId),
      'action': serializer.toJson<String>(action),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MissionLog copyWith({
    String? id,
    String? missionId,
    String? action,
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
  }) => MissionLog(
    id: id ?? this.id,
    missionId: missionId ?? this.missionId,
    action: action ?? this.action,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  MissionLog copyWithCompanion(MissionLogsCompanion data) {
    return MissionLog(
      id: data.id.present ? data.id.value : this.id,
      missionId: data.missionId.present ? data.missionId.value : this.missionId,
      action: data.action.present ? data.action.value : this.action,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MissionLog(')
          ..write('id: $id, ')
          ..write('missionId: $missionId, ')
          ..write('action: $action, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, missionId, action, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MissionLog &&
          other.id == this.id &&
          other.missionId == this.missionId &&
          other.action == this.action &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class MissionLogsCompanion extends UpdateCompanion<MissionLog> {
  final Value<String> id;
  final Value<String> missionId;
  final Value<String> action;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MissionLogsCompanion({
    this.id = const Value.absent(),
    this.missionId = const Value.absent(),
    this.action = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MissionLogsCompanion.insert({
    required String id,
    required String missionId,
    required String action,
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       missionId = Value(missionId),
       action = Value(action),
       createdAt = Value(createdAt);
  static Insertable<MissionLog> custom({
    Expression<String>? id,
    Expression<String>? missionId,
    Expression<String>? action,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (missionId != null) 'mission_id': missionId,
      if (action != null) 'action': action,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MissionLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? missionId,
    Value<String>? action,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MissionLogsCompanion(
      id: id ?? this.id,
      missionId: missionId ?? this.missionId,
      action: action ?? this.action,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (missionId.present) {
      map['mission_id'] = Variable<String>(missionId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MissionLogsCompanion(')
          ..write('id: $id, ')
          ..write('missionId: $missionId, ')
          ..write('action: $action, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('open'),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('normal'),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _xpRewardMeta = const VerificationMeta(
    'xpReward',
  );
  @override
  late final GeneratedColumn<int> xpReward = GeneratedColumn<int>(
    'xp_reward',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    categoryId,
    status,
    priority,
    dueDate,
    xpReward,
    createdAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('xp_reward')) {
      context.handle(
        _xpRewardMeta,
        xpReward.isAcceptableOrUnknown(data['xp_reward']!, _xpRewardMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      xpReward: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_reward'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String title;
  final String? categoryId;
  final String status;
  final String priority;
  final DateTime? dueDate;
  final int xpReward;
  final DateTime createdAt;
  final DateTime? completedAt;
  const Task({
    required this.id,
    required this.title,
    this.categoryId,
    required this.status,
    required this.priority,
    this.dueDate,
    required this.xpReward,
    required this.createdAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['status'] = Variable<String>(status);
    map['priority'] = Variable<String>(priority);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['xp_reward'] = Variable<int>(xpReward);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      status: Value(status),
      priority: Value(priority),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      xpReward: Value(xpReward),
      createdAt: Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      status: serializer.fromJson<String>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      xpReward: serializer.fromJson<int>(json['xpReward']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'categoryId': serializer.toJson<String?>(categoryId),
      'status': serializer.toJson<String>(status),
      'priority': serializer.toJson<String>(priority),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'xpReward': serializer.toJson<int>(xpReward),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  Task copyWith({
    String? id,
    String? title,
    Value<String?> categoryId = const Value.absent(),
    String? status,
    String? priority,
    Value<DateTime?> dueDate = const Value.absent(),
    int? xpReward,
    DateTime? createdAt,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    status: status ?? this.status,
    priority: priority ?? this.priority,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    xpReward: xpReward ?? this.xpReward,
    createdAt: createdAt ?? this.createdAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      xpReward: data.xpReward.present ? data.xpReward.value : this.xpReward,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('categoryId: $categoryId, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('dueDate: $dueDate, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    categoryId,
    status,
    priority,
    dueDate,
    xpReward,
    createdAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.categoryId == this.categoryId &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.dueDate == this.dueDate &&
          other.xpReward == this.xpReward &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> categoryId;
  final Value<String> status;
  final Value<String> priority;
  final Value<DateTime?> dueDate;
  final Value<int> xpReward;
  final Value<DateTime> createdAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String title,
    this.categoryId = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.xpReward = const Value.absent(),
    required DateTime createdAt,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? categoryId,
    Expression<String>? status,
    Expression<String>? priority,
    Expression<DateTime>? dueDate,
    Expression<int>? xpReward,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (categoryId != null) 'category_id': categoryId,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (dueDate != null) 'due_date': dueDate,
      if (xpReward != null) 'xp_reward': xpReward,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? categoryId,
    Value<String>? status,
    Value<String>? priority,
    Value<DateTime?>? dueDate,
    Value<int>? xpReward,
    Value<DateTime>? createdAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      categoryId: categoryId ?? this.categoryId,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      xpReward: xpReward ?? this.xpReward,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (xpReward.present) {
      map['xp_reward'] = Variable<int>(xpReward.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('categoryId: $categoryId, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('dueDate: $dueDate, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskCategoriesTable extends TaskCategories
    with TableInfo<$TaskCategoriesTable, TaskCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lifeAreaMeta = const VerificationMeta(
    'lifeArea',
  );
  @override
  late final GeneratedColumn<String> lifeArea = GeneratedColumn<String>(
    'life_area',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    lifeArea,
    colorHex,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('life_area')) {
      context.handle(
        _lifeAreaMeta,
        lifeArea.isAcceptableOrUnknown(data['life_area']!, _lifeAreaMeta),
      );
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lifeArea: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_area'],
      ),
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TaskCategoriesTable createAlias(String alias) {
    return $TaskCategoriesTable(attachedDatabase, alias);
  }
}

class TaskCategory extends DataClass implements Insertable<TaskCategory> {
  final String id;
  final String name;
  final String? lifeArea;
  final String? colorHex;
  final DateTime createdAt;
  const TaskCategory({
    required this.id,
    required this.name,
    this.lifeArea,
    this.colorHex,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || lifeArea != null) {
      map['life_area'] = Variable<String>(lifeArea);
    }
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TaskCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TaskCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      lifeArea: lifeArea == null && nullToAbsent
          ? const Value.absent()
          : Value(lifeArea),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      createdAt: Value(createdAt),
    );
  }

  factory TaskCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskCategory(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lifeArea: serializer.fromJson<String?>(json['lifeArea']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'lifeArea': serializer.toJson<String?>(lifeArea),
      'colorHex': serializer.toJson<String?>(colorHex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TaskCategory copyWith({
    String? id,
    String? name,
    Value<String?> lifeArea = const Value.absent(),
    Value<String?> colorHex = const Value.absent(),
    DateTime? createdAt,
  }) => TaskCategory(
    id: id ?? this.id,
    name: name ?? this.name,
    lifeArea: lifeArea.present ? lifeArea.value : this.lifeArea,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    createdAt: createdAt ?? this.createdAt,
  );
  TaskCategory copyWithCompanion(TaskCategoriesCompanion data) {
    return TaskCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lifeArea: data.lifeArea.present ? data.lifeArea.value : this.lifeArea,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lifeArea: $lifeArea, ')
          ..write('colorHex: $colorHex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lifeArea, colorHex, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.lifeArea == this.lifeArea &&
          other.colorHex == this.colorHex &&
          other.createdAt == this.createdAt);
}

class TaskCategoriesCompanion extends UpdateCompanion<TaskCategory> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> lifeArea;
  final Value<String?> colorHex;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TaskCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lifeArea = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskCategoriesCompanion.insert({
    required String id,
    required String name,
    this.lifeArea = const Value.absent(),
    this.colorHex = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<TaskCategory> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? lifeArea,
    Expression<String>? colorHex,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lifeArea != null) 'life_area': lifeArea,
      if (colorHex != null) 'color_hex': colorHex,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? lifeArea,
    Value<String?>? colorHex,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TaskCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lifeArea: lifeArea ?? this.lifeArea,
      colorHex: colorHex ?? this.colorHex,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lifeArea.present) {
      map['life_area'] = Variable<String>(lifeArea.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lifeArea: $lifeArea, ')
          ..write('colorHex: $colorHex, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskLogsTable extends TaskLogs with TableInfo<$TaskLogsTable, TaskLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, taskId, action, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TaskLogsTable createAlias(String alias) {
    return $TaskLogsTable(attachedDatabase, alias);
  }
}

class TaskLog extends DataClass implements Insertable<TaskLog> {
  final String id;
  final String taskId;
  final String action;
  final DateTime createdAt;
  const TaskLog({
    required this.id,
    required this.taskId,
    required this.action,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['task_id'] = Variable<String>(taskId);
    map['action'] = Variable<String>(action);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TaskLogsCompanion toCompanion(bool nullToAbsent) {
    return TaskLogsCompanion(
      id: Value(id),
      taskId: Value(taskId),
      action: Value(action),
      createdAt: Value(createdAt),
    );
  }

  factory TaskLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskLog(
      id: serializer.fromJson<String>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      action: serializer.fromJson<String>(json['action']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taskId': serializer.toJson<String>(taskId),
      'action': serializer.toJson<String>(action),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TaskLog copyWith({
    String? id,
    String? taskId,
    String? action,
    DateTime? createdAt,
  }) => TaskLog(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    action: action ?? this.action,
    createdAt: createdAt ?? this.createdAt,
  );
  TaskLog copyWithCompanion(TaskLogsCompanion data) {
    return TaskLog(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      action: data.action.present ? data.action.value : this.action,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskLog(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('action: $action, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskId, action, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskLog &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.action == this.action &&
          other.createdAt == this.createdAt);
}

class TaskLogsCompanion extends UpdateCompanion<TaskLog> {
  final Value<String> id;
  final Value<String> taskId;
  final Value<String> action;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TaskLogsCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.action = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskLogsCompanion.insert({
    required String id,
    required String taskId,
    required String action,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taskId = Value(taskId),
       action = Value(action),
       createdAt = Value(createdAt);
  static Insertable<TaskLog> custom({
    Expression<String>? id,
    Expression<String>? taskId,
    Expression<String>? action,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (action != null) 'action': action,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? taskId,
    Value<String>? action,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TaskLogsCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      action: action ?? this.action,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskLogsCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('action: $action, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  @override
  late final GeneratedColumn<double> sugar = GeneratedColumn<double>(
    'sugar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _saltMeta = const VerificationMeta('salt');
  @override
  late final GeneratedColumn<double> salt = GeneratedColumn<double>(
    'salt',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _portionMeta = const VerificationMeta(
    'portion',
  );
  @override
  late final GeneratedColumn<String> portion = GeneratedColumn<String>(
    'portion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _favoriteMeta = const VerificationMeta(
    'favorite',
  );
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
    'favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    calories,
    sugar,
    salt,
    protein,
    fat,
    carbs,
    category,
    portion,
    favorite,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'foods';
  @override
  VerificationContext validateIntegrity(
    Insertable<Food> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    if (data.containsKey('sugar')) {
      context.handle(
        _sugarMeta,
        sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta),
      );
    }
    if (data.containsKey('salt')) {
      context.handle(
        _saltMeta,
        salt.isAcceptableOrUnknown(data['salt']!, _saltMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('portion')) {
      context.handle(
        _portionMeta,
        portion.isAcceptableOrUnknown(data['portion']!, _portionMeta),
      );
    }
    if (data.containsKey('favorite')) {
      context.handle(
        _favoriteMeta,
        favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Food(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      )!,
      sugar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar'],
      )!,
      salt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salt'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      )!,
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      )!,
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      portion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}portion'],
      ),
      favorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favorite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(attachedDatabase, alias);
  }
}

class Food extends DataClass implements Insertable<Food> {
  final String id;
  final String name;
  final double calories;
  final double sugar;
  final double salt;
  final double protein;
  final double fat;
  final double carbs;
  final String? category;
  final String? portion;
  final bool favorite;
  final DateTime createdAt;
  const Food({
    required this.id,
    required this.name,
    required this.calories,
    required this.sugar,
    required this.salt,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.category,
    this.portion,
    required this.favorite,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['calories'] = Variable<double>(calories);
    map['sugar'] = Variable<double>(sugar);
    map['salt'] = Variable<double>(salt);
    map['protein'] = Variable<double>(protein);
    map['fat'] = Variable<double>(fat);
    map['carbs'] = Variable<double>(carbs);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || portion != null) {
      map['portion'] = Variable<String>(portion);
    }
    map['favorite'] = Variable<bool>(favorite);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: Value(id),
      name: Value(name),
      calories: Value(calories),
      sugar: Value(sugar),
      salt: Value(salt),
      protein: Value(protein),
      fat: Value(fat),
      carbs: Value(carbs),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      portion: portion == null && nullToAbsent
          ? const Value.absent()
          : Value(portion),
      favorite: Value(favorite),
      createdAt: Value(createdAt),
    );
  }

  factory Food.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      calories: serializer.fromJson<double>(json['calories']),
      sugar: serializer.fromJson<double>(json['sugar']),
      salt: serializer.fromJson<double>(json['salt']),
      protein: serializer.fromJson<double>(json['protein']),
      fat: serializer.fromJson<double>(json['fat']),
      carbs: serializer.fromJson<double>(json['carbs']),
      category: serializer.fromJson<String?>(json['category']),
      portion: serializer.fromJson<String?>(json['portion']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'calories': serializer.toJson<double>(calories),
      'sugar': serializer.toJson<double>(sugar),
      'salt': serializer.toJson<double>(salt),
      'protein': serializer.toJson<double>(protein),
      'fat': serializer.toJson<double>(fat),
      'carbs': serializer.toJson<double>(carbs),
      'category': serializer.toJson<String?>(category),
      'portion': serializer.toJson<String?>(portion),
      'favorite': serializer.toJson<bool>(favorite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Food copyWith({
    String? id,
    String? name,
    double? calories,
    double? sugar,
    double? salt,
    double? protein,
    double? fat,
    double? carbs,
    Value<String?> category = const Value.absent(),
    Value<String?> portion = const Value.absent(),
    bool? favorite,
    DateTime? createdAt,
  }) => Food(
    id: id ?? this.id,
    name: name ?? this.name,
    calories: calories ?? this.calories,
    sugar: sugar ?? this.sugar,
    salt: salt ?? this.salt,
    protein: protein ?? this.protein,
    fat: fat ?? this.fat,
    carbs: carbs ?? this.carbs,
    category: category.present ? category.value : this.category,
    portion: portion.present ? portion.value : this.portion,
    favorite: favorite ?? this.favorite,
    createdAt: createdAt ?? this.createdAt,
  );
  Food copyWithCompanion(FoodsCompanion data) {
    return Food(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      calories: data.calories.present ? data.calories.value : this.calories,
      sugar: data.sugar.present ? data.sugar.value : this.sugar,
      salt: data.salt.present ? data.salt.value : this.salt,
      protein: data.protein.present ? data.protein.value : this.protein,
      fat: data.fat.present ? data.fat.value : this.fat,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      category: data.category.present ? data.category.value : this.category,
      portion: data.portion.present ? data.portion.value : this.portion,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('sugar: $sugar, ')
          ..write('salt: $salt, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('category: $category, ')
          ..write('portion: $portion, ')
          ..write('favorite: $favorite, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    calories,
    sugar,
    salt,
    protein,
    fat,
    carbs,
    category,
    portion,
    favorite,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.calories == this.calories &&
          other.sugar == this.sugar &&
          other.salt == this.salt &&
          other.protein == this.protein &&
          other.fat == this.fat &&
          other.carbs == this.carbs &&
          other.category == this.category &&
          other.portion == this.portion &&
          other.favorite == this.favorite &&
          other.createdAt == this.createdAt);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> calories;
  final Value<double> sugar;
  final Value<double> salt;
  final Value<double> protein;
  final Value<double> fat;
  final Value<double> carbs;
  final Value<String?> category;
  final Value<String?> portion;
  final Value<bool> favorite;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
    this.sugar = const Value.absent(),
    this.salt = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.category = const Value.absent(),
    this.portion = const Value.absent(),
    this.favorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoodsCompanion.insert({
    required String id,
    required String name,
    this.calories = const Value.absent(),
    this.sugar = const Value.absent(),
    this.salt = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.category = const Value.absent(),
    this.portion = const Value.absent(),
    this.favorite = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Food> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? calories,
    Expression<double>? sugar,
    Expression<double>? salt,
    Expression<double>? protein,
    Expression<double>? fat,
    Expression<double>? carbs,
    Expression<String>? category,
    Expression<String>? portion,
    Expression<bool>? favorite,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (calories != null) 'calories': calories,
      if (sugar != null) 'sugar': sugar,
      if (salt != null) 'salt': salt,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
      if (carbs != null) 'carbs': carbs,
      if (category != null) 'category': category,
      if (portion != null) 'portion': portion,
      if (favorite != null) 'favorite': favorite,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoodsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? calories,
    Value<double>? sugar,
    Value<double>? salt,
    Value<double>? protein,
    Value<double>? fat,
    Value<double>? carbs,
    Value<String?>? category,
    Value<String?>? portion,
    Value<bool>? favorite,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      sugar: sugar ?? this.sugar,
      salt: salt ?? this.salt,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      category: category ?? this.category,
      portion: portion ?? this.portion,
      favorite: favorite ?? this.favorite,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    if (salt.present) {
      map['salt'] = Variable<double>(salt.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (portion.present) {
      map['portion'] = Variable<String>(portion.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('sugar: $sugar, ')
          ..write('salt: $salt, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('category: $category, ')
          ..write('portion: $portion, ')
          ..write('favorite: $favorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FoodLogsTable extends FoodLogs with TableInfo<$FoodLogsTable, FoodLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  @override
  late final GeneratedColumn<String> foodId = GeneratedColumn<String>(
    'food_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  @override
  late final GeneratedColumn<double> sugar = GeneratedColumn<double>(
    'sugar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _saltMeta = const VerificationMeta('salt');
  @override
  late final GeneratedColumn<double> salt = GeneratedColumn<double>(
    'salt',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    foodId,
    name,
    quantity,
    calories,
    sugar,
    salt,
    protein,
    fat,
    carbs,
    loggedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('food_id')) {
      context.handle(
        _foodIdMeta,
        foodId.isAcceptableOrUnknown(data['food_id']!, _foodIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    if (data.containsKey('sugar')) {
      context.handle(
        _sugarMeta,
        sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta),
      );
    }
    if (data.containsKey('salt')) {
      context.handle(
        _saltMeta,
        salt.isAcceptableOrUnknown(data['salt']!, _saltMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      foodId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      )!,
      sugar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar'],
      )!,
      salt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salt'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      )!,
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      )!,
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $FoodLogsTable createAlias(String alias) {
    return $FoodLogsTable(attachedDatabase, alias);
  }
}

class FoodLog extends DataClass implements Insertable<FoodLog> {
  final String id;
  final String? foodId;
  final String name;
  final double quantity;
  final double calories;
  final double sugar;
  final double salt;
  final double protein;
  final double fat;
  final double carbs;
  final DateTime loggedAt;
  const FoodLog({
    required this.id,
    this.foodId,
    required this.name,
    required this.quantity,
    required this.calories,
    required this.sugar,
    required this.salt,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || foodId != null) {
      map['food_id'] = Variable<String>(foodId);
    }
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<double>(quantity);
    map['calories'] = Variable<double>(calories);
    map['sugar'] = Variable<double>(sugar);
    map['salt'] = Variable<double>(salt);
    map['protein'] = Variable<double>(protein);
    map['fat'] = Variable<double>(fat);
    map['carbs'] = Variable<double>(carbs);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  FoodLogsCompanion toCompanion(bool nullToAbsent) {
    return FoodLogsCompanion(
      id: Value(id),
      foodId: foodId == null && nullToAbsent
          ? const Value.absent()
          : Value(foodId),
      name: Value(name),
      quantity: Value(quantity),
      calories: Value(calories),
      sugar: Value(sugar),
      salt: Value(salt),
      protein: Value(protein),
      fat: Value(fat),
      carbs: Value(carbs),
      loggedAt: Value(loggedAt),
    );
  }

  factory FoodLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodLog(
      id: serializer.fromJson<String>(json['id']),
      foodId: serializer.fromJson<String?>(json['foodId']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<double>(json['quantity']),
      calories: serializer.fromJson<double>(json['calories']),
      sugar: serializer.fromJson<double>(json['sugar']),
      salt: serializer.fromJson<double>(json['salt']),
      protein: serializer.fromJson<double>(json['protein']),
      fat: serializer.fromJson<double>(json['fat']),
      carbs: serializer.fromJson<double>(json['carbs']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'foodId': serializer.toJson<String?>(foodId),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<double>(quantity),
      'calories': serializer.toJson<double>(calories),
      'sugar': serializer.toJson<double>(sugar),
      'salt': serializer.toJson<double>(salt),
      'protein': serializer.toJson<double>(protein),
      'fat': serializer.toJson<double>(fat),
      'carbs': serializer.toJson<double>(carbs),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  FoodLog copyWith({
    String? id,
    Value<String?> foodId = const Value.absent(),
    String? name,
    double? quantity,
    double? calories,
    double? sugar,
    double? salt,
    double? protein,
    double? fat,
    double? carbs,
    DateTime? loggedAt,
  }) => FoodLog(
    id: id ?? this.id,
    foodId: foodId.present ? foodId.value : this.foodId,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    calories: calories ?? this.calories,
    sugar: sugar ?? this.sugar,
    salt: salt ?? this.salt,
    protein: protein ?? this.protein,
    fat: fat ?? this.fat,
    carbs: carbs ?? this.carbs,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  FoodLog copyWithCompanion(FoodLogsCompanion data) {
    return FoodLog(
      id: data.id.present ? data.id.value : this.id,
      foodId: data.foodId.present ? data.foodId.value : this.foodId,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      calories: data.calories.present ? data.calories.value : this.calories,
      sugar: data.sugar.present ? data.sugar.value : this.sugar,
      salt: data.salt.present ? data.salt.value : this.salt,
      protein: data.protein.present ? data.protein.value : this.protein,
      fat: data.fat.present ? data.fat.value : this.fat,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodLog(')
          ..write('id: $id, ')
          ..write('foodId: $foodId, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('calories: $calories, ')
          ..write('sugar: $sugar, ')
          ..write('salt: $salt, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    foodId,
    name,
    quantity,
    calories,
    sugar,
    salt,
    protein,
    fat,
    carbs,
    loggedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodLog &&
          other.id == this.id &&
          other.foodId == this.foodId &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.calories == this.calories &&
          other.sugar == this.sugar &&
          other.salt == this.salt &&
          other.protein == this.protein &&
          other.fat == this.fat &&
          other.carbs == this.carbs &&
          other.loggedAt == this.loggedAt);
}

class FoodLogsCompanion extends UpdateCompanion<FoodLog> {
  final Value<String> id;
  final Value<String?> foodId;
  final Value<String> name;
  final Value<double> quantity;
  final Value<double> calories;
  final Value<double> sugar;
  final Value<double> salt;
  final Value<double> protein;
  final Value<double> fat;
  final Value<double> carbs;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const FoodLogsCompanion({
    this.id = const Value.absent(),
    this.foodId = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.calories = const Value.absent(),
    this.sugar = const Value.absent(),
    this.salt = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoodLogsCompanion.insert({
    required String id,
    this.foodId = const Value.absent(),
    required String name,
    this.quantity = const Value.absent(),
    this.calories = const Value.absent(),
    this.sugar = const Value.absent(),
    this.salt = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    required DateTime loggedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       loggedAt = Value(loggedAt);
  static Insertable<FoodLog> custom({
    Expression<String>? id,
    Expression<String>? foodId,
    Expression<String>? name,
    Expression<double>? quantity,
    Expression<double>? calories,
    Expression<double>? sugar,
    Expression<double>? salt,
    Expression<double>? protein,
    Expression<double>? fat,
    Expression<double>? carbs,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (foodId != null) 'food_id': foodId,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (calories != null) 'calories': calories,
      if (sugar != null) 'sugar': sugar,
      if (salt != null) 'salt': salt,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
      if (carbs != null) 'carbs': carbs,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoodLogsCompanion copyWith({
    Value<String>? id,
    Value<String?>? foodId,
    Value<String>? name,
    Value<double>? quantity,
    Value<double>? calories,
    Value<double>? sugar,
    Value<double>? salt,
    Value<double>? protein,
    Value<double>? fat,
    Value<double>? carbs,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return FoodLogsCompanion(
      id: id ?? this.id,
      foodId: foodId ?? this.foodId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      calories: calories ?? this.calories,
      sugar: sugar ?? this.sugar,
      salt: salt ?? this.salt,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (foodId.present) {
      map['food_id'] = Variable<String>(foodId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    if (salt.present) {
      map['salt'] = Variable<double>(salt.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodLogsCompanion(')
          ..write('id: $id, ')
          ..write('foodId: $foodId, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('calories: $calories, ')
          ..write('sugar: $sugar, ')
          ..write('salt: $salt, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WaterLogsTable extends WaterLogs
    with TableInfo<$WaterLogsTable, WaterLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaterLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMlMeta = const VerificationMeta(
    'amountMl',
  );
  @override
  late final GeneratedColumn<int> amountMl = GeneratedColumn<int>(
    'amount_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, amountMl, loggedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'water_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WaterLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount_ml')) {
      context.handle(
        _amountMlMeta,
        amountMl.isAcceptableOrUnknown(data['amount_ml']!, _amountMlMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMlMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaterLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      amountMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_ml'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $WaterLogsTable createAlias(String alias) {
    return $WaterLogsTable(attachedDatabase, alias);
  }
}

class WaterLog extends DataClass implements Insertable<WaterLog> {
  final String id;
  final int amountMl;
  final DateTime loggedAt;
  const WaterLog({
    required this.id,
    required this.amountMl,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount_ml'] = Variable<int>(amountMl);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  WaterLogsCompanion toCompanion(bool nullToAbsent) {
    return WaterLogsCompanion(
      id: Value(id),
      amountMl: Value(amountMl),
      loggedAt: Value(loggedAt),
    );
  }

  factory WaterLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaterLog(
      id: serializer.fromJson<String>(json['id']),
      amountMl: serializer.fromJson<int>(json['amountMl']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amountMl': serializer.toJson<int>(amountMl),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  WaterLog copyWith({String? id, int? amountMl, DateTime? loggedAt}) =>
      WaterLog(
        id: id ?? this.id,
        amountMl: amountMl ?? this.amountMl,
        loggedAt: loggedAt ?? this.loggedAt,
      );
  WaterLog copyWithCompanion(WaterLogsCompanion data) {
    return WaterLog(
      id: data.id.present ? data.id.value : this.id,
      amountMl: data.amountMl.present ? data.amountMl.value : this.amountMl,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaterLog(')
          ..write('id: $id, ')
          ..write('amountMl: $amountMl, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amountMl, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterLog &&
          other.id == this.id &&
          other.amountMl == this.amountMl &&
          other.loggedAt == this.loggedAt);
}

class WaterLogsCompanion extends UpdateCompanion<WaterLog> {
  final Value<String> id;
  final Value<int> amountMl;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const WaterLogsCompanion({
    this.id = const Value.absent(),
    this.amountMl = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WaterLogsCompanion.insert({
    required String id,
    required int amountMl,
    required DateTime loggedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       amountMl = Value(amountMl),
       loggedAt = Value(loggedAt);
  static Insertable<WaterLog> custom({
    Expression<String>? id,
    Expression<int>? amountMl,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amountMl != null) 'amount_ml': amountMl,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WaterLogsCompanion copyWith({
    Value<String>? id,
    Value<int>? amountMl,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return WaterLogsCompanion(
      id: id ?? this.id,
      amountMl: amountMl ?? this.amountMl,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amountMl.present) {
      map['amount_ml'] = Variable<int>(amountMl.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterLogsCompanion(')
          ..write('id: $id, ')
          ..write('amountMl: $amountMl, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NutritionGoalsTable extends NutritionGoals
    with TableInfo<$NutritionGoalsTable, NutritionGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutritionGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waterMlMeta = const VerificationMeta(
    'waterMl',
  );
  @override
  late final GeneratedColumn<int> waterMl = GeneratedColumn<int>(
    'water_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2000),
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sugarLimitMeta = const VerificationMeta(
    'sugarLimit',
  );
  @override
  late final GeneratedColumn<double> sugarLimit = GeneratedColumn<double>(
    'sugar_limit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    waterMl,
    calories,
    protein,
    sugarLimit,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutrition_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<NutritionGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('water_ml')) {
      context.handle(
        _waterMlMeta,
        waterMl.isAcceptableOrUnknown(data['water_ml']!, _waterMlMeta),
      );
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('sugar_limit')) {
      context.handle(
        _sugarLimitMeta,
        sugarLimit.isAcceptableOrUnknown(data['sugar_limit']!, _sugarLimitMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NutritionGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NutritionGoal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      waterMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}water_ml'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      ),
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      ),
      sugarLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar_limit'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $NutritionGoalsTable createAlias(String alias) {
    return $NutritionGoalsTable(attachedDatabase, alias);
  }
}

class NutritionGoal extends DataClass implements Insertable<NutritionGoal> {
  final String id;
  final int waterMl;
  final double? calories;
  final double? protein;
  final double? sugarLimit;
  final DateTime createdAt;
  const NutritionGoal({
    required this.id,
    required this.waterMl,
    this.calories,
    this.protein,
    this.sugarLimit,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['water_ml'] = Variable<int>(waterMl);
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<double>(calories);
    }
    if (!nullToAbsent || protein != null) {
      map['protein'] = Variable<double>(protein);
    }
    if (!nullToAbsent || sugarLimit != null) {
      map['sugar_limit'] = Variable<double>(sugarLimit);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NutritionGoalsCompanion toCompanion(bool nullToAbsent) {
    return NutritionGoalsCompanion(
      id: Value(id),
      waterMl: Value(waterMl),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      protein: protein == null && nullToAbsent
          ? const Value.absent()
          : Value(protein),
      sugarLimit: sugarLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(sugarLimit),
      createdAt: Value(createdAt),
    );
  }

  factory NutritionGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutritionGoal(
      id: serializer.fromJson<String>(json['id']),
      waterMl: serializer.fromJson<int>(json['waterMl']),
      calories: serializer.fromJson<double?>(json['calories']),
      protein: serializer.fromJson<double?>(json['protein']),
      sugarLimit: serializer.fromJson<double?>(json['sugarLimit']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'waterMl': serializer.toJson<int>(waterMl),
      'calories': serializer.toJson<double?>(calories),
      'protein': serializer.toJson<double?>(protein),
      'sugarLimit': serializer.toJson<double?>(sugarLimit),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NutritionGoal copyWith({
    String? id,
    int? waterMl,
    Value<double?> calories = const Value.absent(),
    Value<double?> protein = const Value.absent(),
    Value<double?> sugarLimit = const Value.absent(),
    DateTime? createdAt,
  }) => NutritionGoal(
    id: id ?? this.id,
    waterMl: waterMl ?? this.waterMl,
    calories: calories.present ? calories.value : this.calories,
    protein: protein.present ? protein.value : this.protein,
    sugarLimit: sugarLimit.present ? sugarLimit.value : this.sugarLimit,
    createdAt: createdAt ?? this.createdAt,
  );
  NutritionGoal copyWithCompanion(NutritionGoalsCompanion data) {
    return NutritionGoal(
      id: data.id.present ? data.id.value : this.id,
      waterMl: data.waterMl.present ? data.waterMl.value : this.waterMl,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      sugarLimit: data.sugarLimit.present
          ? data.sugarLimit.value
          : this.sugarLimit,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NutritionGoal(')
          ..write('id: $id, ')
          ..write('waterMl: $waterMl, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('sugarLimit: $sugarLimit, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, waterMl, calories, protein, sugarLimit, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutritionGoal &&
          other.id == this.id &&
          other.waterMl == this.waterMl &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.sugarLimit == this.sugarLimit &&
          other.createdAt == this.createdAt);
}

class NutritionGoalsCompanion extends UpdateCompanion<NutritionGoal> {
  final Value<String> id;
  final Value<int> waterMl;
  final Value<double?> calories;
  final Value<double?> protein;
  final Value<double?> sugarLimit;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const NutritionGoalsCompanion({
    this.id = const Value.absent(),
    this.waterMl = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.sugarLimit = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NutritionGoalsCompanion.insert({
    required String id,
    this.waterMl = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.sugarLimit = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt);
  static Insertable<NutritionGoal> custom({
    Expression<String>? id,
    Expression<int>? waterMl,
    Expression<double>? calories,
    Expression<double>? protein,
    Expression<double>? sugarLimit,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (waterMl != null) 'water_ml': waterMl,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (sugarLimit != null) 'sugar_limit': sugarLimit,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NutritionGoalsCompanion copyWith({
    Value<String>? id,
    Value<int>? waterMl,
    Value<double?>? calories,
    Value<double?>? protein,
    Value<double?>? sugarLimit,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return NutritionGoalsCompanion(
      id: id ?? this.id,
      waterMl: waterMl ?? this.waterMl,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      sugarLimit: sugarLimit ?? this.sugarLimit,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (waterMl.present) {
      map['water_ml'] = Variable<int>(waterMl.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (sugarLimit.present) {
      map['sugar_limit'] = Variable<double>(sugarLimit.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutritionGoalsCompanion(')
          ..write('id: $id, ')
          ..write('waterMl: $waterMl, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('sugarLimit: $sugarLimit, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subcategoryMeta = const VerificationMeta(
    'subcategory',
  );
  @override
  late final GeneratedColumn<String> subcategory = GeneratedColumn<String>(
    'subcategory',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _objectiveMeta = const VerificationMeta(
    'objective',
  );
  @override
  late final GeneratedColumn<String> objective = GeneratedColumn<String>(
    'objective',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Base'),
  );
  static const VerificationMeta _averageMinutesMeta = const VerificationMeta(
    'averageMinutes',
  );
  @override
  late final GeneratedColumn<int> averageMinutes = GeneratedColumn<int>(
    'average_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _metricsMeta = const VerificationMeta(
    'metrics',
  );
  @override
  late final GeneratedColumn<String> metrics = GeneratedColumn<String>(
    'metrics',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _precautionsMeta = const VerificationMeta(
    'precautions',
  );
  @override
  late final GeneratedColumn<String> precautions = GeneratedColumn<String>(
    'precautions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    category,
    subcategory,
    name,
    objective,
    description,
    level,
    averageMinutes,
    metrics,
    precautions,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('subcategory')) {
      context.handle(
        _subcategoryMeta,
        subcategory.isAcceptableOrUnknown(
          data['subcategory']!,
          _subcategoryMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('objective')) {
      context.handle(
        _objectiveMeta,
        objective.isAcceptableOrUnknown(data['objective']!, _objectiveMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('average_minutes')) {
      context.handle(
        _averageMinutesMeta,
        averageMinutes.isAcceptableOrUnknown(
          data['average_minutes']!,
          _averageMinutesMeta,
        ),
      );
    }
    if (data.containsKey('metrics')) {
      context.handle(
        _metricsMeta,
        metrics.isAcceptableOrUnknown(data['metrics']!, _metricsMeta),
      );
    }
    if (data.containsKey('precautions')) {
      context.handle(
        _precautionsMeta,
        precautions.isAcceptableOrUnknown(
          data['precautions']!,
          _precautionsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      subcategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subcategory'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      objective: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objective'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}level'],
      )!,
      averageMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}average_minutes'],
      )!,
      metrics: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metrics'],
      ),
      precautions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}precautions'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final String id;
  final String category;
  final String? subcategory;
  final String name;
  final String? objective;
  final String? description;
  final String level;
  final int averageMinutes;
  final String? metrics;
  final String? precautions;
  final DateTime createdAt;
  const Exercise({
    required this.id,
    required this.category,
    this.subcategory,
    required this.name,
    this.objective,
    this.description,
    required this.level,
    required this.averageMinutes,
    this.metrics,
    this.precautions,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || subcategory != null) {
      map['subcategory'] = Variable<String>(subcategory);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || objective != null) {
      map['objective'] = Variable<String>(objective);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['level'] = Variable<String>(level);
    map['average_minutes'] = Variable<int>(averageMinutes);
    if (!nullToAbsent || metrics != null) {
      map['metrics'] = Variable<String>(metrics);
    }
    if (!nullToAbsent || precautions != null) {
      map['precautions'] = Variable<String>(precautions);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      category: Value(category),
      subcategory: subcategory == null && nullToAbsent
          ? const Value.absent()
          : Value(subcategory),
      name: Value(name),
      objective: objective == null && nullToAbsent
          ? const Value.absent()
          : Value(objective),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      level: Value(level),
      averageMinutes: Value(averageMinutes),
      metrics: metrics == null && nullToAbsent
          ? const Value.absent()
          : Value(metrics),
      precautions: precautions == null && nullToAbsent
          ? const Value.absent()
          : Value(precautions),
      createdAt: Value(createdAt),
    );
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<String>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      subcategory: serializer.fromJson<String?>(json['subcategory']),
      name: serializer.fromJson<String>(json['name']),
      objective: serializer.fromJson<String?>(json['objective']),
      description: serializer.fromJson<String?>(json['description']),
      level: serializer.fromJson<String>(json['level']),
      averageMinutes: serializer.fromJson<int>(json['averageMinutes']),
      metrics: serializer.fromJson<String?>(json['metrics']),
      precautions: serializer.fromJson<String?>(json['precautions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'category': serializer.toJson<String>(category),
      'subcategory': serializer.toJson<String?>(subcategory),
      'name': serializer.toJson<String>(name),
      'objective': serializer.toJson<String?>(objective),
      'description': serializer.toJson<String?>(description),
      'level': serializer.toJson<String>(level),
      'averageMinutes': serializer.toJson<int>(averageMinutes),
      'metrics': serializer.toJson<String?>(metrics),
      'precautions': serializer.toJson<String?>(precautions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Exercise copyWith({
    String? id,
    String? category,
    Value<String?> subcategory = const Value.absent(),
    String? name,
    Value<String?> objective = const Value.absent(),
    Value<String?> description = const Value.absent(),
    String? level,
    int? averageMinutes,
    Value<String?> metrics = const Value.absent(),
    Value<String?> precautions = const Value.absent(),
    DateTime? createdAt,
  }) => Exercise(
    id: id ?? this.id,
    category: category ?? this.category,
    subcategory: subcategory.present ? subcategory.value : this.subcategory,
    name: name ?? this.name,
    objective: objective.present ? objective.value : this.objective,
    description: description.present ? description.value : this.description,
    level: level ?? this.level,
    averageMinutes: averageMinutes ?? this.averageMinutes,
    metrics: metrics.present ? metrics.value : this.metrics,
    precautions: precautions.present ? precautions.value : this.precautions,
    createdAt: createdAt ?? this.createdAt,
  );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      subcategory: data.subcategory.present
          ? data.subcategory.value
          : this.subcategory,
      name: data.name.present ? data.name.value : this.name,
      objective: data.objective.present ? data.objective.value : this.objective,
      description: data.description.present
          ? data.description.value
          : this.description,
      level: data.level.present ? data.level.value : this.level,
      averageMinutes: data.averageMinutes.present
          ? data.averageMinutes.value
          : this.averageMinutes,
      metrics: data.metrics.present ? data.metrics.value : this.metrics,
      precautions: data.precautions.present
          ? data.precautions.value
          : this.precautions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('subcategory: $subcategory, ')
          ..write('name: $name, ')
          ..write('objective: $objective, ')
          ..write('description: $description, ')
          ..write('level: $level, ')
          ..write('averageMinutes: $averageMinutes, ')
          ..write('metrics: $metrics, ')
          ..write('precautions: $precautions, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    category,
    subcategory,
    name,
    objective,
    description,
    level,
    averageMinutes,
    metrics,
    precautions,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.category == this.category &&
          other.subcategory == this.subcategory &&
          other.name == this.name &&
          other.objective == this.objective &&
          other.description == this.description &&
          other.level == this.level &&
          other.averageMinutes == this.averageMinutes &&
          other.metrics == this.metrics &&
          other.precautions == this.precautions &&
          other.createdAt == this.createdAt);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> id;
  final Value<String> category;
  final Value<String?> subcategory;
  final Value<String> name;
  final Value<String?> objective;
  final Value<String?> description;
  final Value<String> level;
  final Value<int> averageMinutes;
  final Value<String?> metrics;
  final Value<String?> precautions;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.subcategory = const Value.absent(),
    this.name = const Value.absent(),
    this.objective = const Value.absent(),
    this.description = const Value.absent(),
    this.level = const Value.absent(),
    this.averageMinutes = const Value.absent(),
    this.metrics = const Value.absent(),
    this.precautions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String id,
    required String category,
    this.subcategory = const Value.absent(),
    required String name,
    this.objective = const Value.absent(),
    this.description = const Value.absent(),
    this.level = const Value.absent(),
    this.averageMinutes = const Value.absent(),
    this.metrics = const Value.absent(),
    this.precautions = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       category = Value(category),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Exercise> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<String>? subcategory,
    Expression<String>? name,
    Expression<String>? objective,
    Expression<String>? description,
    Expression<String>? level,
    Expression<int>? averageMinutes,
    Expression<String>? metrics,
    Expression<String>? precautions,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (subcategory != null) 'subcategory': subcategory,
      if (name != null) 'name': name,
      if (objective != null) 'objective': objective,
      if (description != null) 'description': description,
      if (level != null) 'level': level,
      if (averageMinutes != null) 'average_minutes': averageMinutes,
      if (metrics != null) 'metrics': metrics,
      if (precautions != null) 'precautions': precautions,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith({
    Value<String>? id,
    Value<String>? category,
    Value<String?>? subcategory,
    Value<String>? name,
    Value<String?>? objective,
    Value<String?>? description,
    Value<String>? level,
    Value<int>? averageMinutes,
    Value<String?>? metrics,
    Value<String?>? precautions,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      name: name ?? this.name,
      objective: objective ?? this.objective,
      description: description ?? this.description,
      level: level ?? this.level,
      averageMinutes: averageMinutes ?? this.averageMinutes,
      metrics: metrics ?? this.metrics,
      precautions: precautions ?? this.precautions,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (subcategory.present) {
      map['subcategory'] = Variable<String>(subcategory.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (objective.present) {
      map['objective'] = Variable<String>(objective.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (averageMinutes.present) {
      map['average_minutes'] = Variable<int>(averageMinutes.value);
    }
    if (metrics.present) {
      map['metrics'] = Variable<String>(metrics.value);
    }
    if (precautions.present) {
      map['precautions'] = Variable<String>(precautions.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('subcategory: $subcategory, ')
          ..write('name: $name, ')
          ..write('objective: $objective, ')
          ..write('description: $description, ')
          ..write('level: $level, ')
          ..write('averageMinutes: $averageMinutes, ')
          ..write('metrics: $metrics, ')
          ..write('precautions: $precautions, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _intensityMeta = const VerificationMeta(
    'intensity',
  );
  @override
  late final GeneratedColumn<String> intensity = GeneratedColumn<String>(
    'intensity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Media'),
  );
  static const VerificationMeta _objectiveMeta = const VerificationMeta(
    'objective',
  );
  @override
  late final GeneratedColumn<String> objective = GeneratedColumn<String>(
    'objective',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _templateJsonMeta = const VerificationMeta(
    'templateJson',
  );
  @override
  late final GeneratedColumn<String> templateJson = GeneratedColumn<String>(
    'template_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    durationMinutes,
    intensity,
    objective,
    templateJson,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Workout> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('intensity')) {
      context.handle(
        _intensityMeta,
        intensity.isAcceptableOrUnknown(data['intensity']!, _intensityMeta),
      );
    }
    if (data.containsKey('objective')) {
      context.handle(
        _objectiveMeta,
        objective.isAcceptableOrUnknown(data['objective']!, _objectiveMeta),
      );
    }
    if (data.containsKey('template_json')) {
      context.handle(
        _templateJsonMeta,
        templateJson.isAcceptableOrUnknown(
          data['template_json']!,
          _templateJsonMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Workout(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
      intensity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intensity'],
      )!,
      objective: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objective'],
      ),
      templateJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_json'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final String id;
  final String name;
  final String type;
  final int durationMinutes;
  final String intensity;
  final String? objective;
  final String? templateJson;
  final String status;
  final DateTime createdAt;
  const Workout({
    required this.id,
    required this.name,
    required this.type,
    required this.durationMinutes,
    required this.intensity,
    this.objective,
    this.templateJson,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['intensity'] = Variable<String>(intensity);
    if (!nullToAbsent || objective != null) {
      map['objective'] = Variable<String>(objective);
    }
    if (!nullToAbsent || templateJson != null) {
      map['template_json'] = Variable<String>(templateJson);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      durationMinutes: Value(durationMinutes),
      intensity: Value(intensity),
      objective: objective == null && nullToAbsent
          ? const Value.absent()
          : Value(objective),
      templateJson: templateJson == null && nullToAbsent
          ? const Value.absent()
          : Value(templateJson),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory Workout.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      intensity: serializer.fromJson<String>(json['intensity']),
      objective: serializer.fromJson<String?>(json['objective']),
      templateJson: serializer.fromJson<String?>(json['templateJson']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'intensity': serializer.toJson<String>(intensity),
      'objective': serializer.toJson<String?>(objective),
      'templateJson': serializer.toJson<String?>(templateJson),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Workout copyWith({
    String? id,
    String? name,
    String? type,
    int? durationMinutes,
    String? intensity,
    Value<String?> objective = const Value.absent(),
    Value<String?> templateJson = const Value.absent(),
    String? status,
    DateTime? createdAt,
  }) => Workout(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    intensity: intensity ?? this.intensity,
    objective: objective.present ? objective.value : this.objective,
    templateJson: templateJson.present ? templateJson.value : this.templateJson,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  Workout copyWithCompanion(WorkoutsCompanion data) {
    return Workout(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      intensity: data.intensity.present ? data.intensity.value : this.intensity,
      objective: data.objective.present ? data.objective.value : this.objective,
      templateJson: data.templateJson.present
          ? data.templateJson.value
          : this.templateJson,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('intensity: $intensity, ')
          ..write('objective: $objective, ')
          ..write('templateJson: $templateJson, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    durationMinutes,
    intensity,
    objective,
    templateJson,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.durationMinutes == this.durationMinutes &&
          other.intensity == this.intensity &&
          other.objective == this.objective &&
          other.templateJson == this.templateJson &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<int> durationMinutes;
  final Value<String> intensity;
  final Value<String?> objective;
  final Value<String?> templateJson;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.intensity = const Value.absent(),
    this.objective = const Value.absent(),
    this.templateJson = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    required String id,
    required String name,
    required String type,
    required int durationMinutes,
    this.intensity = const Value.absent(),
    this.objective = const Value.absent(),
    this.templateJson = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type),
       durationMinutes = Value(durationMinutes),
       createdAt = Value(createdAt);
  static Insertable<Workout> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? durationMinutes,
    Expression<String>? intensity,
    Expression<String>? objective,
    Expression<String>? templateJson,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (intensity != null) 'intensity': intensity,
      if (objective != null) 'objective': objective,
      if (templateJson != null) 'template_json': templateJson,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? type,
    Value<int>? durationMinutes,
    Value<String>? intensity,
    Value<String?>? objective,
    Value<String?>? templateJson,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      intensity: intensity ?? this.intensity,
      objective: objective ?? this.objective,
      templateJson: templateJson ?? this.templateJson,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (intensity.present) {
      map['intensity'] = Variable<String>(intensity.value);
    }
    if (objective.present) {
      map['objective'] = Variable<String>(objective.value);
    }
    if (templateJson.present) {
      map['template_json'] = Variable<String>(templateJson.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('intensity: $intensity, ')
          ..write('objective: $objective, ')
          ..write('templateJson: $templateJson, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTable extends WorkoutSessions
    with TableInfo<$WorkoutSessionsTable, WorkoutSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workoutIdMeta = const VerificationMeta(
    'workoutId',
  );
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
    'workout_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finishedAtMeta = const VerificationMeta(
    'finishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
    'finished_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _xpRewardMeta = const VerificationMeta(
    'xpReward',
  );
  @override
  late final GeneratedColumn<int> xpReward = GeneratedColumn<int>(
    'xp_reward',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(20),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workoutId,
    startedAt,
    finishedAt,
    status,
    xpReward,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(
        _workoutIdMeta,
        workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
        _finishedAtMeta,
        finishedAt.isAcceptableOrUnknown(data['finished_at']!, _finishedAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('xp_reward')) {
      context.handle(
        _xpRewardMeta,
        xpReward.isAcceptableOrUnknown(data['xp_reward']!, _xpRewardMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      workoutId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_id'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      finishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finished_at'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      xpReward: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_reward'],
      )!,
    );
  }

  @override
  $WorkoutSessionsTable createAlias(String alias) {
    return $WorkoutSessionsTable(attachedDatabase, alias);
  }
}

class WorkoutSession extends DataClass implements Insertable<WorkoutSession> {
  final String id;
  final String? workoutId;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final String status;
  final int xpReward;
  const WorkoutSession({
    required this.id,
    this.workoutId,
    required this.startedAt,
    this.finishedAt,
    required this.status,
    required this.xpReward,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<String>(workoutId);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    map['status'] = Variable<String>(status);
    map['xp_reward'] = Variable<int>(xpReward);
    return map;
  }

  WorkoutSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsCompanion(
      id: Value(id),
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
      status: Value(status),
      xpReward: Value(xpReward),
    );
  }

  factory WorkoutSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSession(
      id: serializer.fromJson<String>(json['id']),
      workoutId: serializer.fromJson<String?>(json['workoutId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
      status: serializer.fromJson<String>(json['status']),
      xpReward: serializer.fromJson<int>(json['xpReward']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workoutId': serializer.toJson<String?>(workoutId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
      'status': serializer.toJson<String>(status),
      'xpReward': serializer.toJson<int>(xpReward),
    };
  }

  WorkoutSession copyWith({
    String? id,
    Value<String?> workoutId = const Value.absent(),
    DateTime? startedAt,
    Value<DateTime?> finishedAt = const Value.absent(),
    String? status,
    int? xpReward,
  }) => WorkoutSession(
    id: id ?? this.id,
    workoutId: workoutId.present ? workoutId.value : this.workoutId,
    startedAt: startedAt ?? this.startedAt,
    finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
    status: status ?? this.status,
    xpReward: xpReward ?? this.xpReward,
  );
  WorkoutSession copyWithCompanion(WorkoutSessionsCompanion data) {
    return WorkoutSession(
      id: data.id.present ? data.id.value : this.id,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt: data.finishedAt.present
          ? data.finishedAt.value
          : this.finishedAt,
      status: data.status.present ? data.status.value : this.status,
      xpReward: data.xpReward.present ? data.xpReward.value : this.xpReward,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSession(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('status: $status, ')
          ..write('xpReward: $xpReward')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, workoutId, startedAt, finishedAt, status, xpReward);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSession &&
          other.id == this.id &&
          other.workoutId == this.workoutId &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt &&
          other.status == this.status &&
          other.xpReward == this.xpReward);
}

class WorkoutSessionsCompanion extends UpdateCompanion<WorkoutSession> {
  final Value<String> id;
  final Value<String?> workoutId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> finishedAt;
  final Value<String> status;
  final Value<int> xpReward;
  final Value<int> rowid;
  const WorkoutSessionsCompanion({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionsCompanion.insert({
    required String id,
    this.workoutId = const Value.absent(),
    required DateTime startedAt,
    this.finishedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startedAt = Value(startedAt);
  static Insertable<WorkoutSession> custom({
    Expression<String>? id,
    Expression<String>? workoutId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? finishedAt,
    Expression<String>? status,
    Expression<int>? xpReward,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutId != null) 'workout_id': workoutId,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (status != null) 'status': status,
      if (xpReward != null) 'xp_reward': xpReward,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? workoutId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? finishedAt,
    Value<String>? status,
    Value<int>? xpReward,
    Value<int>? rowid,
  }) {
    return WorkoutSessionsCompanion(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      status: status ?? this.status,
      xpReward: xpReward ?? this.xpReward,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (xpReward.present) {
      map['xp_reward'] = Variable<int>(xpReward.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsCompanion(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('status: $status, ')
          ..write('xpReward: $xpReward, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionStepsTable extends WorkoutSessionSteps
    with TableInfo<$WorkoutSessionStepsTable, WorkoutSessionStep> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionStepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
    'sets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _restSecondsMeta = const VerificationMeta(
    'restSeconds',
  );
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
    'rest_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(45),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    exerciseId,
    title,
    orderIndex,
    durationSeconds,
    repetitions,
    sets,
    restSeconds,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_session_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSessionStep> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    if (data.containsKey('sets')) {
      context.handle(
        _setsMeta,
        sets.isAcceptableOrUnknown(data['sets']!, _setsMeta),
      );
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
        _restSecondsMeta,
        restSeconds.isAcceptableOrUnknown(
          data['rest_seconds']!,
          _restSecondsMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSessionStep map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSessionStep(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      ),
      sets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sets'],
      )!,
      restSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_seconds'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $WorkoutSessionStepsTable createAlias(String alias) {
    return $WorkoutSessionStepsTable(attachedDatabase, alias);
  }
}

class WorkoutSessionStep extends DataClass
    implements Insertable<WorkoutSessionStep> {
  final String id;
  final String sessionId;
  final String? exerciseId;
  final String title;
  final int orderIndex;
  final int? durationSeconds;
  final int? repetitions;
  final int sets;
  final int restSeconds;
  final String status;
  const WorkoutSessionStep({
    required this.id,
    required this.sessionId,
    this.exerciseId,
    required this.title,
    required this.orderIndex,
    this.durationSeconds,
    this.repetitions,
    required this.sets,
    required this.restSeconds,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<String>(exerciseId);
    }
    map['title'] = Variable<String>(title);
    map['order_index'] = Variable<int>(orderIndex);
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || repetitions != null) {
      map['repetitions'] = Variable<int>(repetitions);
    }
    map['sets'] = Variable<int>(sets);
    map['rest_seconds'] = Variable<int>(restSeconds);
    map['status'] = Variable<String>(status);
    return map;
  }

  WorkoutSessionStepsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionStepsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      title: Value(title),
      orderIndex: Value(orderIndex),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      repetitions: repetitions == null && nullToAbsent
          ? const Value.absent()
          : Value(repetitions),
      sets: Value(sets),
      restSeconds: Value(restSeconds),
      status: Value(status),
    );
  }

  factory WorkoutSessionStep.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSessionStep(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      exerciseId: serializer.fromJson<String?>(json['exerciseId']),
      title: serializer.fromJson<String>(json['title']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      repetitions: serializer.fromJson<int?>(json['repetitions']),
      sets: serializer.fromJson<int>(json['sets']),
      restSeconds: serializer.fromJson<int>(json['restSeconds']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'exerciseId': serializer.toJson<String?>(exerciseId),
      'title': serializer.toJson<String>(title),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'repetitions': serializer.toJson<int?>(repetitions),
      'sets': serializer.toJson<int>(sets),
      'restSeconds': serializer.toJson<int>(restSeconds),
      'status': serializer.toJson<String>(status),
    };
  }

  WorkoutSessionStep copyWith({
    String? id,
    String? sessionId,
    Value<String?> exerciseId = const Value.absent(),
    String? title,
    int? orderIndex,
    Value<int?> durationSeconds = const Value.absent(),
    Value<int?> repetitions = const Value.absent(),
    int? sets,
    int? restSeconds,
    String? status,
  }) => WorkoutSessionStep(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    exerciseId: exerciseId.present ? exerciseId.value : this.exerciseId,
    title: title ?? this.title,
    orderIndex: orderIndex ?? this.orderIndex,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    repetitions: repetitions.present ? repetitions.value : this.repetitions,
    sets: sets ?? this.sets,
    restSeconds: restSeconds ?? this.restSeconds,
    status: status ?? this.status,
  );
  WorkoutSessionStep copyWithCompanion(WorkoutSessionStepsCompanion data) {
    return WorkoutSessionStep(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      title: data.title.present ? data.title.value : this.title,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
      sets: data.sets.present ? data.sets.value : this.sets,
      restSeconds: data.restSeconds.present
          ? data.restSeconds.value
          : this.restSeconds,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionStep(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('title: $title, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('repetitions: $repetitions, ')
          ..write('sets: $sets, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    exerciseId,
    title,
    orderIndex,
    durationSeconds,
    repetitions,
    sets,
    restSeconds,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSessionStep &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.exerciseId == this.exerciseId &&
          other.title == this.title &&
          other.orderIndex == this.orderIndex &&
          other.durationSeconds == this.durationSeconds &&
          other.repetitions == this.repetitions &&
          other.sets == this.sets &&
          other.restSeconds == this.restSeconds &&
          other.status == this.status);
}

class WorkoutSessionStepsCompanion extends UpdateCompanion<WorkoutSessionStep> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String?> exerciseId;
  final Value<String> title;
  final Value<int> orderIndex;
  final Value<int?> durationSeconds;
  final Value<int?> repetitions;
  final Value<int> sets;
  final Value<int> restSeconds;
  final Value<String> status;
  final Value<int> rowid;
  const WorkoutSessionStepsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.title = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.sets = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionStepsCompanion.insert({
    required String id,
    required String sessionId,
    this.exerciseId = const Value.absent(),
    required String title,
    required int orderIndex,
    this.durationSeconds = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.sets = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       title = Value(title),
       orderIndex = Value(orderIndex);
  static Insertable<WorkoutSessionStep> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? exerciseId,
    Expression<String>? title,
    Expression<int>? orderIndex,
    Expression<int>? durationSeconds,
    Expression<int>? repetitions,
    Expression<int>? sets,
    Expression<int>? restSeconds,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (title != null) 'title': title,
      if (orderIndex != null) 'order_index': orderIndex,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (repetitions != null) 'repetitions': repetitions,
      if (sets != null) 'sets': sets,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionStepsCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String?>? exerciseId,
    Value<String>? title,
    Value<int>? orderIndex,
    Value<int?>? durationSeconds,
    Value<int?>? repetitions,
    Value<int>? sets,
    Value<int>? restSeconds,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return WorkoutSessionStepsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      exerciseId: exerciseId ?? this.exerciseId,
      title: title ?? this.title,
      orderIndex: orderIndex ?? this.orderIndex,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      repetitions: repetitions ?? this.repetitions,
      sets: sets ?? this.sets,
      restSeconds: restSeconds ?? this.restSeconds,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionStepsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('title: $title, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('repetitions: $repetitions, ')
          ..write('sets: $sets, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutLogsTable extends WorkoutLogs
    with TableInfo<$WorkoutLogsTable, WorkoutLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatigueMeta = const VerificationMeta(
    'fatigue',
  );
  @override
  late final GeneratedColumn<int> fatigue = GeneratedColumn<int>(
    'fatigue',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    note,
    fatigue,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('fatigue')) {
      context.handle(
        _fatigueMeta,
        fatigue.isAcceptableOrUnknown(data['fatigue']!, _fatigueMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      fatigue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fatigue'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WorkoutLogsTable createAlias(String alias) {
    return $WorkoutLogsTable(attachedDatabase, alias);
  }
}

class WorkoutLog extends DataClass implements Insertable<WorkoutLog> {
  final String id;
  final String sessionId;
  final String? note;
  final int? fatigue;
  final DateTime createdAt;
  const WorkoutLog({
    required this.id,
    required this.sessionId,
    this.note,
    this.fatigue,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || fatigue != null) {
      map['fatigue'] = Variable<int>(fatigue);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WorkoutLogsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutLogsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      fatigue: fatigue == null && nullToAbsent
          ? const Value.absent()
          : Value(fatigue),
      createdAt: Value(createdAt),
    );
  }

  factory WorkoutLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutLog(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      note: serializer.fromJson<String?>(json['note']),
      fatigue: serializer.fromJson<int?>(json['fatigue']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'note': serializer.toJson<String?>(note),
      'fatigue': serializer.toJson<int?>(fatigue),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WorkoutLog copyWith({
    String? id,
    String? sessionId,
    Value<String?> note = const Value.absent(),
    Value<int?> fatigue = const Value.absent(),
    DateTime? createdAt,
  }) => WorkoutLog(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    note: note.present ? note.value : this.note,
    fatigue: fatigue.present ? fatigue.value : this.fatigue,
    createdAt: createdAt ?? this.createdAt,
  );
  WorkoutLog copyWithCompanion(WorkoutLogsCompanion data) {
    return WorkoutLog(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      note: data.note.present ? data.note.value : this.note,
      fatigue: data.fatigue.present ? data.fatigue.value : this.fatigue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLog(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('note: $note, ')
          ..write('fatigue: $fatigue, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, note, fatigue, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutLog &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.note == this.note &&
          other.fatigue == this.fatigue &&
          other.createdAt == this.createdAt);
}

class WorkoutLogsCompanion extends UpdateCompanion<WorkoutLog> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String?> note;
  final Value<int?> fatigue;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const WorkoutLogsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.note = const Value.absent(),
    this.fatigue = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutLogsCompanion.insert({
    required String id,
    required String sessionId,
    this.note = const Value.absent(),
    this.fatigue = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       createdAt = Value(createdAt);
  static Insertable<WorkoutLog> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? note,
    Expression<int>? fatigue,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (note != null) 'note': note,
      if (fatigue != null) 'fatigue': fatigue,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String?>? note,
    Value<int?>? fatigue,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return WorkoutLogsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      note: note ?? this.note,
      fatigue: fatigue ?? this.fatigue,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (fatigue.present) {
      map['fatigue'] = Variable<int>(fatigue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLogsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('note: $note, ')
          ..write('fatigue: $fatigue, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudySubjectsTable extends StudySubjects
    with TableInfo<$StudySubjectsTable, StudySubject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudySubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, colorHex, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudySubject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudySubject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudySubject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StudySubjectsTable createAlias(String alias) {
    return $StudySubjectsTable(attachedDatabase, alias);
  }
}

class StudySubject extends DataClass implements Insertable<StudySubject> {
  final String id;
  final String name;
  final String? colorHex;
  final DateTime createdAt;
  const StudySubject({
    required this.id,
    required this.name,
    this.colorHex,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StudySubjectsCompanion toCompanion(bool nullToAbsent) {
    return StudySubjectsCompanion(
      id: Value(id),
      name: Value(name),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      createdAt: Value(createdAt),
    );
  }

  factory StudySubject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudySubject(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String?>(colorHex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StudySubject copyWith({
    String? id,
    String? name,
    Value<String?> colorHex = const Value.absent(),
    DateTime? createdAt,
  }) => StudySubject(
    id: id ?? this.id,
    name: name ?? this.name,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    createdAt: createdAt ?? this.createdAt,
  );
  StudySubject copyWithCompanion(StudySubjectsCompanion data) {
    return StudySubject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudySubject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorHex, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudySubject &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorHex == this.colorHex &&
          other.createdAt == this.createdAt);
}

class StudySubjectsCompanion extends UpdateCompanion<StudySubject> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> colorHex;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const StudySubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudySubjectsCompanion.insert({
    required String id,
    required String name,
    this.colorHex = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<StudySubject> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudySubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? colorHex,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return StudySubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudySubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudyUnitsTable extends StudyUnits
    with TableInfo<$StudyUnitsTable, StudyUnit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudyUnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _objectiveMeta = const VerificationMeta(
    'objective',
  );
  @override
  late final GeneratedColumn<String> objective = GeneratedColumn<String>(
    'objective',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Base'),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Normal'),
  );
  static const VerificationMeta _estimatedMinutesMeta = const VerificationMeta(
    'estimatedMinutes',
  );
  @override
  late final GeneratedColumn<int> estimatedMinutes = GeneratedColumn<int>(
    'estimated_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _masteryMeta = const VerificationMeta(
    'mastery',
  );
  @override
  late final GeneratedColumn<int> mastery = GeneratedColumn<int>(
    'mastery',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _examDateMeta = const VerificationMeta(
    'examDate',
  );
  @override
  late final GeneratedColumn<DateTime> examDate = GeneratedColumn<DateTime>(
    'exam_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastReviewAtMeta = const VerificationMeta(
    'lastReviewAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewAt = GeneratedColumn<DateTime>(
    'last_review_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    title,
    objective,
    difficulty,
    priority,
    estimatedMinutes,
    mastery,
    examDate,
    lastReviewAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_units';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudyUnit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('objective')) {
      context.handle(
        _objectiveMeta,
        objective.isAcceptableOrUnknown(data['objective']!, _objectiveMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('estimated_minutes')) {
      context.handle(
        _estimatedMinutesMeta,
        estimatedMinutes.isAcceptableOrUnknown(
          data['estimated_minutes']!,
          _estimatedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('mastery')) {
      context.handle(
        _masteryMeta,
        mastery.isAcceptableOrUnknown(data['mastery']!, _masteryMeta),
      );
    }
    if (data.containsKey('exam_date')) {
      context.handle(
        _examDateMeta,
        examDate.isAcceptableOrUnknown(data['exam_date']!, _examDateMeta),
      );
    }
    if (data.containsKey('last_review_at')) {
      context.handle(
        _lastReviewAtMeta,
        lastReviewAt.isAcceptableOrUnknown(
          data['last_review_at']!,
          _lastReviewAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudyUnit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyUnit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      objective: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objective'],
      ),
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      estimatedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_minutes'],
      )!,
      mastery: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mastery'],
      )!,
      examDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}exam_date'],
      ),
      lastReviewAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_review_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StudyUnitsTable createAlias(String alias) {
    return $StudyUnitsTable(attachedDatabase, alias);
  }
}

class StudyUnit extends DataClass implements Insertable<StudyUnit> {
  final String id;
  final String subjectId;
  final String title;
  final String? objective;
  final String difficulty;
  final String priority;
  final int estimatedMinutes;
  final int mastery;
  final DateTime? examDate;
  final DateTime? lastReviewAt;
  final DateTime createdAt;
  const StudyUnit({
    required this.id,
    required this.subjectId,
    required this.title,
    this.objective,
    required this.difficulty,
    required this.priority,
    required this.estimatedMinutes,
    required this.mastery,
    this.examDate,
    this.lastReviewAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subjectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || objective != null) {
      map['objective'] = Variable<String>(objective);
    }
    map['difficulty'] = Variable<String>(difficulty);
    map['priority'] = Variable<String>(priority);
    map['estimated_minutes'] = Variable<int>(estimatedMinutes);
    map['mastery'] = Variable<int>(mastery);
    if (!nullToAbsent || examDate != null) {
      map['exam_date'] = Variable<DateTime>(examDate);
    }
    if (!nullToAbsent || lastReviewAt != null) {
      map['last_review_at'] = Variable<DateTime>(lastReviewAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StudyUnitsCompanion toCompanion(bool nullToAbsent) {
    return StudyUnitsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      title: Value(title),
      objective: objective == null && nullToAbsent
          ? const Value.absent()
          : Value(objective),
      difficulty: Value(difficulty),
      priority: Value(priority),
      estimatedMinutes: Value(estimatedMinutes),
      mastery: Value(mastery),
      examDate: examDate == null && nullToAbsent
          ? const Value.absent()
          : Value(examDate),
      lastReviewAt: lastReviewAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewAt),
      createdAt: Value(createdAt),
    );
  }

  factory StudyUnit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyUnit(
      id: serializer.fromJson<String>(json['id']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      title: serializer.fromJson<String>(json['title']),
      objective: serializer.fromJson<String?>(json['objective']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      priority: serializer.fromJson<String>(json['priority']),
      estimatedMinutes: serializer.fromJson<int>(json['estimatedMinutes']),
      mastery: serializer.fromJson<int>(json['mastery']),
      examDate: serializer.fromJson<DateTime?>(json['examDate']),
      lastReviewAt: serializer.fromJson<DateTime?>(json['lastReviewAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectId': serializer.toJson<String>(subjectId),
      'title': serializer.toJson<String>(title),
      'objective': serializer.toJson<String?>(objective),
      'difficulty': serializer.toJson<String>(difficulty),
      'priority': serializer.toJson<String>(priority),
      'estimatedMinutes': serializer.toJson<int>(estimatedMinutes),
      'mastery': serializer.toJson<int>(mastery),
      'examDate': serializer.toJson<DateTime?>(examDate),
      'lastReviewAt': serializer.toJson<DateTime?>(lastReviewAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StudyUnit copyWith({
    String? id,
    String? subjectId,
    String? title,
    Value<String?> objective = const Value.absent(),
    String? difficulty,
    String? priority,
    int? estimatedMinutes,
    int? mastery,
    Value<DateTime?> examDate = const Value.absent(),
    Value<DateTime?> lastReviewAt = const Value.absent(),
    DateTime? createdAt,
  }) => StudyUnit(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    title: title ?? this.title,
    objective: objective.present ? objective.value : this.objective,
    difficulty: difficulty ?? this.difficulty,
    priority: priority ?? this.priority,
    estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
    mastery: mastery ?? this.mastery,
    examDate: examDate.present ? examDate.value : this.examDate,
    lastReviewAt: lastReviewAt.present ? lastReviewAt.value : this.lastReviewAt,
    createdAt: createdAt ?? this.createdAt,
  );
  StudyUnit copyWithCompanion(StudyUnitsCompanion data) {
    return StudyUnit(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      title: data.title.present ? data.title.value : this.title,
      objective: data.objective.present ? data.objective.value : this.objective,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      priority: data.priority.present ? data.priority.value : this.priority,
      estimatedMinutes: data.estimatedMinutes.present
          ? data.estimatedMinutes.value
          : this.estimatedMinutes,
      mastery: data.mastery.present ? data.mastery.value : this.mastery,
      examDate: data.examDate.present ? data.examDate.value : this.examDate,
      lastReviewAt: data.lastReviewAt.present
          ? data.lastReviewAt.value
          : this.lastReviewAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyUnit(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('title: $title, ')
          ..write('objective: $objective, ')
          ..write('difficulty: $difficulty, ')
          ..write('priority: $priority, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('mastery: $mastery, ')
          ..write('examDate: $examDate, ')
          ..write('lastReviewAt: $lastReviewAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    title,
    objective,
    difficulty,
    priority,
    estimatedMinutes,
    mastery,
    examDate,
    lastReviewAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyUnit &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.title == this.title &&
          other.objective == this.objective &&
          other.difficulty == this.difficulty &&
          other.priority == this.priority &&
          other.estimatedMinutes == this.estimatedMinutes &&
          other.mastery == this.mastery &&
          other.examDate == this.examDate &&
          other.lastReviewAt == this.lastReviewAt &&
          other.createdAt == this.createdAt);
}

class StudyUnitsCompanion extends UpdateCompanion<StudyUnit> {
  final Value<String> id;
  final Value<String> subjectId;
  final Value<String> title;
  final Value<String?> objective;
  final Value<String> difficulty;
  final Value<String> priority;
  final Value<int> estimatedMinutes;
  final Value<int> mastery;
  final Value<DateTime?> examDate;
  final Value<DateTime?> lastReviewAt;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const StudyUnitsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.title = const Value.absent(),
    this.objective = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.priority = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.mastery = const Value.absent(),
    this.examDate = const Value.absent(),
    this.lastReviewAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudyUnitsCompanion.insert({
    required String id,
    required String subjectId,
    required String title,
    this.objective = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.priority = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.mastery = const Value.absent(),
    this.examDate = const Value.absent(),
    this.lastReviewAt = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectId = Value(subjectId),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<StudyUnit> custom({
    Expression<String>? id,
    Expression<String>? subjectId,
    Expression<String>? title,
    Expression<String>? objective,
    Expression<String>? difficulty,
    Expression<String>? priority,
    Expression<int>? estimatedMinutes,
    Expression<int>? mastery,
    Expression<DateTime>? examDate,
    Expression<DateTime>? lastReviewAt,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (title != null) 'title': title,
      if (objective != null) 'objective': objective,
      if (difficulty != null) 'difficulty': difficulty,
      if (priority != null) 'priority': priority,
      if (estimatedMinutes != null) 'estimated_minutes': estimatedMinutes,
      if (mastery != null) 'mastery': mastery,
      if (examDate != null) 'exam_date': examDate,
      if (lastReviewAt != null) 'last_review_at': lastReviewAt,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudyUnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectId,
    Value<String>? title,
    Value<String?>? objective,
    Value<String>? difficulty,
    Value<String>? priority,
    Value<int>? estimatedMinutes,
    Value<int>? mastery,
    Value<DateTime?>? examDate,
    Value<DateTime?>? lastReviewAt,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return StudyUnitsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      title: title ?? this.title,
      objective: objective ?? this.objective,
      difficulty: difficulty ?? this.difficulty,
      priority: priority ?? this.priority,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      mastery: mastery ?? this.mastery,
      examDate: examDate ?? this.examDate,
      lastReviewAt: lastReviewAt ?? this.lastReviewAt,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (objective.present) {
      map['objective'] = Variable<String>(objective.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (estimatedMinutes.present) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes.value);
    }
    if (mastery.present) {
      map['mastery'] = Variable<int>(mastery.value);
    }
    if (examDate.present) {
      map['exam_date'] = Variable<DateTime>(examDate.value);
    }
    if (lastReviewAt.present) {
      map['last_review_at'] = Variable<DateTime>(lastReviewAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyUnitsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('title: $title, ')
          ..write('objective: $objective, ')
          ..write('difficulty: $difficulty, ')
          ..write('priority: $priority, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('mastery: $mastery, ')
          ..write('examDate: $examDate, ')
          ..write('lastReviewAt: $lastReviewAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudySessionsTable extends StudySessions
    with TableInfo<$StudySessionsTable, StudySession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudySessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionTypeMeta = const VerificationMeta(
    'sessionType',
  );
  @override
  late final GeneratedColumn<String> sessionType = GeneratedColumn<String>(
    'session_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutesMeta = const VerificationMeta(
    'minutes',
  );
  @override
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
    'minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finishedAtMeta = const VerificationMeta(
    'finishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
    'finished_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    unitId,
    sessionType,
    minutes,
    notes,
    startedAt,
    finishedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudySession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('session_type')) {
      context.handle(
        _sessionTypeMeta,
        sessionType.isAcceptableOrUnknown(
          data['session_type']!,
          _sessionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionTypeMeta);
    }
    if (data.containsKey('minutes')) {
      context.handle(
        _minutesMeta,
        minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta),
      );
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
        _finishedAtMeta,
        finishedAt.isAcceptableOrUnknown(data['finished_at']!, _finishedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudySession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudySession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      sessionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_type'],
      )!,
      minutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      finishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finished_at'],
      ),
    );
  }

  @override
  $StudySessionsTable createAlias(String alias) {
    return $StudySessionsTable(attachedDatabase, alias);
  }
}

class StudySession extends DataClass implements Insertable<StudySession> {
  final String id;
  final String? unitId;
  final String sessionType;
  final int minutes;
  final String? notes;
  final DateTime startedAt;
  final DateTime? finishedAt;
  const StudySession({
    required this.id,
    this.unitId,
    required this.sessionType,
    required this.minutes,
    this.notes,
    required this.startedAt,
    this.finishedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    map['session_type'] = Variable<String>(sessionType);
    map['minutes'] = Variable<int>(minutes);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    return map;
  }

  StudySessionsCompanion toCompanion(bool nullToAbsent) {
    return StudySessionsCompanion(
      id: Value(id),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      sessionType: Value(sessionType),
      minutes: Value(minutes),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
    );
  }

  factory StudySession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudySession(
      id: serializer.fromJson<String>(json['id']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      sessionType: serializer.fromJson<String>(json['sessionType']),
      minutes: serializer.fromJson<int>(json['minutes']),
      notes: serializer.fromJson<String?>(json['notes']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unitId': serializer.toJson<String?>(unitId),
      'sessionType': serializer.toJson<String>(sessionType),
      'minutes': serializer.toJson<int>(minutes),
      'notes': serializer.toJson<String?>(notes),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
    };
  }

  StudySession copyWith({
    String? id,
    Value<String?> unitId = const Value.absent(),
    String? sessionType,
    int? minutes,
    Value<String?> notes = const Value.absent(),
    DateTime? startedAt,
    Value<DateTime?> finishedAt = const Value.absent(),
  }) => StudySession(
    id: id ?? this.id,
    unitId: unitId.present ? unitId.value : this.unitId,
    sessionType: sessionType ?? this.sessionType,
    minutes: minutes ?? this.minutes,
    notes: notes.present ? notes.value : this.notes,
    startedAt: startedAt ?? this.startedAt,
    finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
  );
  StudySession copyWithCompanion(StudySessionsCompanion data) {
    return StudySession(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      sessionType: data.sessionType.present
          ? data.sessionType.value
          : this.sessionType,
      minutes: data.minutes.present ? data.minutes.value : this.minutes,
      notes: data.notes.present ? data.notes.value : this.notes,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt: data.finishedAt.present
          ? data.finishedAt.value
          : this.finishedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudySession(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('sessionType: $sessionType, ')
          ..write('minutes: $minutes, ')
          ..write('notes: $notes, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    unitId,
    sessionType,
    minutes,
    notes,
    startedAt,
    finishedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudySession &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.sessionType == this.sessionType &&
          other.minutes == this.minutes &&
          other.notes == this.notes &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt);
}

class StudySessionsCompanion extends UpdateCompanion<StudySession> {
  final Value<String> id;
  final Value<String?> unitId;
  final Value<String> sessionType;
  final Value<int> minutes;
  final Value<String?> notes;
  final Value<DateTime> startedAt;
  final Value<DateTime?> finishedAt;
  final Value<int> rowid;
  const StudySessionsCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.sessionType = const Value.absent(),
    this.minutes = const Value.absent(),
    this.notes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudySessionsCompanion.insert({
    required String id,
    this.unitId = const Value.absent(),
    required String sessionType,
    required int minutes,
    this.notes = const Value.absent(),
    required DateTime startedAt,
    this.finishedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionType = Value(sessionType),
       minutes = Value(minutes),
       startedAt = Value(startedAt);
  static Insertable<StudySession> custom({
    Expression<String>? id,
    Expression<String>? unitId,
    Expression<String>? sessionType,
    Expression<int>? minutes,
    Expression<String>? notes,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? finishedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (sessionType != null) 'session_type': sessionType,
      if (minutes != null) 'minutes': minutes,
      if (notes != null) 'notes': notes,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudySessionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? unitId,
    Value<String>? sessionType,
    Value<int>? minutes,
    Value<String?>? notes,
    Value<DateTime>? startedAt,
    Value<DateTime?>? finishedAt,
    Value<int>? rowid,
  }) {
    return StudySessionsCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      sessionType: sessionType ?? this.sessionType,
      minutes: minutes ?? this.minutes,
      notes: notes ?? this.notes,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (sessionType.present) {
      map['session_type'] = Variable<String>(sessionType.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionsCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('sessionType: $sessionType, ')
          ..write('minutes: $minutes, ')
          ..write('notes: $notes, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudyReviewsTable extends StudyReviews
    with TableInfo<$StudyReviewsTable, StudyReview> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudyReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<DateTime> dueAt = GeneratedColumn<DateTime>(
    'due_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, unitId, dueAt, completedAt, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_reviews';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudyReview> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('due_at')) {
      context.handle(
        _dueAtMeta,
        dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta),
      );
    } else if (isInserting) {
      context.missing(_dueAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudyReview map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyReview(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      dueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $StudyReviewsTable createAlias(String alias) {
    return $StudyReviewsTable(attachedDatabase, alias);
  }
}

class StudyReview extends DataClass implements Insertable<StudyReview> {
  final String id;
  final String unitId;
  final DateTime dueAt;
  final DateTime? completedAt;
  final String? notes;
  const StudyReview({
    required this.id,
    required this.unitId,
    required this.dueAt,
    this.completedAt,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unit_id'] = Variable<String>(unitId);
    map['due_at'] = Variable<DateTime>(dueAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  StudyReviewsCompanion toCompanion(bool nullToAbsent) {
    return StudyReviewsCompanion(
      id: Value(id),
      unitId: Value(unitId),
      dueAt: Value(dueAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory StudyReview.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyReview(
      id: serializer.fromJson<String>(json['id']),
      unitId: serializer.fromJson<String>(json['unitId']),
      dueAt: serializer.fromJson<DateTime>(json['dueAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unitId': serializer.toJson<String>(unitId),
      'dueAt': serializer.toJson<DateTime>(dueAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  StudyReview copyWith({
    String? id,
    String? unitId,
    DateTime? dueAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => StudyReview(
    id: id ?? this.id,
    unitId: unitId ?? this.unitId,
    dueAt: dueAt ?? this.dueAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    notes: notes.present ? notes.value : this.notes,
  );
  StudyReview copyWithCompanion(StudyReviewsCompanion data) {
    return StudyReview(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyReview(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('dueAt: $dueAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, unitId, dueAt, completedAt, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyReview &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.dueAt == this.dueAt &&
          other.completedAt == this.completedAt &&
          other.notes == this.notes);
}

class StudyReviewsCompanion extends UpdateCompanion<StudyReview> {
  final Value<String> id;
  final Value<String> unitId;
  final Value<DateTime> dueAt;
  final Value<DateTime?> completedAt;
  final Value<String?> notes;
  final Value<int> rowid;
  const StudyReviewsCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudyReviewsCompanion.insert({
    required String id,
    required String unitId,
    required DateTime dueAt,
    this.completedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       unitId = Value(unitId),
       dueAt = Value(dueAt);
  static Insertable<StudyReview> custom({
    Expression<String>? id,
    Expression<String>? unitId,
    Expression<DateTime>? dueAt,
    Expression<DateTime>? completedAt,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (dueAt != null) 'due_at': dueAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudyReviewsCompanion copyWith({
    Value<String>? id,
    Value<String>? unitId,
    Value<DateTime>? dueAt,
    Value<DateTime?>? completedAt,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return StudyReviewsCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      dueAt: dueAt ?? this.dueAt,
      completedAt: completedAt ?? this.completedAt,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<DateTime>(dueAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyReviewsCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('dueAt: $dueAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FinanceCategoriesTable extends FinanceCategories
    with TableInfo<$FinanceCategoriesTable, FinanceCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FinanceCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _natureMeta = const VerificationMeta('nature');
  @override
  late final GeneratedColumn<String> nature = GeneratedColumn<String>(
    'nature',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _acceptsRecurrenceMeta = const VerificationMeta(
    'acceptsRecurrence',
  );
  @override
  late final GeneratedColumn<bool> acceptsRecurrence = GeneratedColumn<bool>(
    'accepts_recurrence',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("accepts_recurrence" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _alertRuleMeta = const VerificationMeta(
    'alertRule',
  );
  @override
  late final GeneratedColumn<String> alertRule = GeneratedColumn<String>(
    'alert_rule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    nature,
    description,
    acceptsRecurrence,
    alertRule,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'finance_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<FinanceCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nature')) {
      context.handle(
        _natureMeta,
        nature.isAcceptableOrUnknown(data['nature']!, _natureMeta),
      );
    } else if (isInserting) {
      context.missing(_natureMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('accepts_recurrence')) {
      context.handle(
        _acceptsRecurrenceMeta,
        acceptsRecurrence.isAcceptableOrUnknown(
          data['accepts_recurrence']!,
          _acceptsRecurrenceMeta,
        ),
      );
    }
    if (data.containsKey('alert_rule')) {
      context.handle(
        _alertRuleMeta,
        alertRule.isAcceptableOrUnknown(data['alert_rule']!, _alertRuleMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinanceCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinanceCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nature'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      acceptsRecurrence: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}accepts_recurrence'],
      )!,
      alertRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alert_rule'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FinanceCategoriesTable createAlias(String alias) {
    return $FinanceCategoriesTable(attachedDatabase, alias);
  }
}

class FinanceCategory extends DataClass implements Insertable<FinanceCategory> {
  final String id;
  final String name;
  final String nature;
  final String? description;
  final bool acceptsRecurrence;
  final String? alertRule;
  final DateTime createdAt;
  const FinanceCategory({
    required this.id,
    required this.name,
    required this.nature,
    this.description,
    required this.acceptsRecurrence,
    this.alertRule,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['nature'] = Variable<String>(nature);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['accepts_recurrence'] = Variable<bool>(acceptsRecurrence);
    if (!nullToAbsent || alertRule != null) {
      map['alert_rule'] = Variable<String>(alertRule);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FinanceCategoriesCompanion toCompanion(bool nullToAbsent) {
    return FinanceCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      nature: Value(nature),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      acceptsRecurrence: Value(acceptsRecurrence),
      alertRule: alertRule == null && nullToAbsent
          ? const Value.absent()
          : Value(alertRule),
      createdAt: Value(createdAt),
    );
  }

  factory FinanceCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinanceCategory(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nature: serializer.fromJson<String>(json['nature']),
      description: serializer.fromJson<String?>(json['description']),
      acceptsRecurrence: serializer.fromJson<bool>(json['acceptsRecurrence']),
      alertRule: serializer.fromJson<String?>(json['alertRule']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nature': serializer.toJson<String>(nature),
      'description': serializer.toJson<String?>(description),
      'acceptsRecurrence': serializer.toJson<bool>(acceptsRecurrence),
      'alertRule': serializer.toJson<String?>(alertRule),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FinanceCategory copyWith({
    String? id,
    String? name,
    String? nature,
    Value<String?> description = const Value.absent(),
    bool? acceptsRecurrence,
    Value<String?> alertRule = const Value.absent(),
    DateTime? createdAt,
  }) => FinanceCategory(
    id: id ?? this.id,
    name: name ?? this.name,
    nature: nature ?? this.nature,
    description: description.present ? description.value : this.description,
    acceptsRecurrence: acceptsRecurrence ?? this.acceptsRecurrence,
    alertRule: alertRule.present ? alertRule.value : this.alertRule,
    createdAt: createdAt ?? this.createdAt,
  );
  FinanceCategory copyWithCompanion(FinanceCategoriesCompanion data) {
    return FinanceCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nature: data.nature.present ? data.nature.value : this.nature,
      description: data.description.present
          ? data.description.value
          : this.description,
      acceptsRecurrence: data.acceptsRecurrence.present
          ? data.acceptsRecurrence.value
          : this.acceptsRecurrence,
      alertRule: data.alertRule.present ? data.alertRule.value : this.alertRule,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinanceCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nature: $nature, ')
          ..write('description: $description, ')
          ..write('acceptsRecurrence: $acceptsRecurrence, ')
          ..write('alertRule: $alertRule, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    nature,
    description,
    acceptsRecurrence,
    alertRule,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinanceCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.nature == this.nature &&
          other.description == this.description &&
          other.acceptsRecurrence == this.acceptsRecurrence &&
          other.alertRule == this.alertRule &&
          other.createdAt == this.createdAt);
}

class FinanceCategoriesCompanion extends UpdateCompanion<FinanceCategory> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nature;
  final Value<String?> description;
  final Value<bool> acceptsRecurrence;
  final Value<String?> alertRule;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FinanceCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nature = const Value.absent(),
    this.description = const Value.absent(),
    this.acceptsRecurrence = const Value.absent(),
    this.alertRule = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FinanceCategoriesCompanion.insert({
    required String id,
    required String name,
    required String nature,
    this.description = const Value.absent(),
    this.acceptsRecurrence = const Value.absent(),
    this.alertRule = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       nature = Value(nature),
       createdAt = Value(createdAt);
  static Insertable<FinanceCategory> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nature,
    Expression<String>? description,
    Expression<bool>? acceptsRecurrence,
    Expression<String>? alertRule,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nature != null) 'nature': nature,
      if (description != null) 'description': description,
      if (acceptsRecurrence != null) 'accepts_recurrence': acceptsRecurrence,
      if (alertRule != null) 'alert_rule': alertRule,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FinanceCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? nature,
    Value<String?>? description,
    Value<bool>? acceptsRecurrence,
    Value<String?>? alertRule,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FinanceCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nature: nature ?? this.nature,
      description: description ?? this.description,
      acceptsRecurrence: acceptsRecurrence ?? this.acceptsRecurrence,
      alertRule: alertRule ?? this.alertRule,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nature.present) {
      map['nature'] = Variable<String>(nature.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (acceptsRecurrence.present) {
      map['accepts_recurrence'] = Variable<bool>(acceptsRecurrence.value);
    }
    if (alertRule.present) {
      map['alert_rule'] = Variable<String>(alertRule.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinanceCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nature: $nature, ')
          ..write('description: $description, ')
          ..write('acceptsRecurrence: $acceptsRecurrence, ')
          ..write('alertRule: $alertRule, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FinanceTransactionsTable extends FinanceTransactions
    with TableInfo<$FinanceTransactionsTable, FinanceTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FinanceTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fixedMeta = const VerificationMeta('fixed');
  @override
  late final GeneratedColumn<bool> fixed = GeneratedColumn<bool>(
    'fixed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("fixed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    amount,
    type,
    categoryId,
    description,
    paymentMethod,
    fixed,
    date,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'finance_transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<FinanceTransaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('fixed')) {
      context.handle(
        _fixedMeta,
        fixed.isAcceptableOrUnknown(data['fixed']!, _fixedMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinanceTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinanceTransaction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      ),
      fixed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}fixed'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FinanceTransactionsTable createAlias(String alias) {
    return $FinanceTransactionsTable(attachedDatabase, alias);
  }
}

class FinanceTransaction extends DataClass
    implements Insertable<FinanceTransaction> {
  final String id;
  final double amount;
  final String type;
  final String? categoryId;
  final String? description;
  final String? paymentMethod;
  final bool fixed;
  final DateTime date;
  final DateTime createdAt;
  const FinanceTransaction({
    required this.id,
    required this.amount,
    required this.type,
    this.categoryId,
    this.description,
    this.paymentMethod,
    required this.fixed,
    required this.date,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount'] = Variable<double>(amount);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    map['fixed'] = Variable<bool>(fixed);
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FinanceTransactionsCompanion toCompanion(bool nullToAbsent) {
    return FinanceTransactionsCompanion(
      id: Value(id),
      amount: Value(amount),
      type: Value(type),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      fixed: Value(fixed),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory FinanceTransaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinanceTransaction(
      id: serializer.fromJson<String>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      type: serializer.fromJson<String>(json['type']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      description: serializer.fromJson<String?>(json['description']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      fixed: serializer.fromJson<bool>(json['fixed']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amount': serializer.toJson<double>(amount),
      'type': serializer.toJson<String>(type),
      'categoryId': serializer.toJson<String?>(categoryId),
      'description': serializer.toJson<String?>(description),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'fixed': serializer.toJson<bool>(fixed),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FinanceTransaction copyWith({
    String? id,
    double? amount,
    String? type,
    Value<String?> categoryId = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> paymentMethod = const Value.absent(),
    bool? fixed,
    DateTime? date,
    DateTime? createdAt,
  }) => FinanceTransaction(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    type: type ?? this.type,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    description: description.present ? description.value : this.description,
    paymentMethod: paymentMethod.present
        ? paymentMethod.value
        : this.paymentMethod,
    fixed: fixed ?? this.fixed,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
  );
  FinanceTransaction copyWithCompanion(FinanceTransactionsCompanion data) {
    return FinanceTransaction(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      description: data.description.present
          ? data.description.value
          : this.description,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      fixed: data.fixed.present ? data.fixed.value : this.fixed,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinanceTransaction(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('fixed: $fixed, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    amount,
    type,
    categoryId,
    description,
    paymentMethod,
    fixed,
    date,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinanceTransaction &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.categoryId == this.categoryId &&
          other.description == this.description &&
          other.paymentMethod == this.paymentMethod &&
          other.fixed == this.fixed &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class FinanceTransactionsCompanion extends UpdateCompanion<FinanceTransaction> {
  final Value<String> id;
  final Value<double> amount;
  final Value<String> type;
  final Value<String?> categoryId;
  final Value<String?> description;
  final Value<String?> paymentMethod;
  final Value<bool> fixed;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FinanceTransactionsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.fixed = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FinanceTransactionsCompanion.insert({
    required String id,
    required double amount,
    required String type,
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.fixed = const Value.absent(),
    required DateTime date,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       amount = Value(amount),
       type = Value(type),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<FinanceTransaction> custom({
    Expression<String>? id,
    Expression<double>? amount,
    Expression<String>? type,
    Expression<String>? categoryId,
    Expression<String>? description,
    Expression<String>? paymentMethod,
    Expression<bool>? fixed,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (categoryId != null) 'category_id': categoryId,
      if (description != null) 'description': description,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (fixed != null) 'fixed': fixed,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FinanceTransactionsCompanion copyWith({
    Value<String>? id,
    Value<double>? amount,
    Value<String>? type,
    Value<String?>? categoryId,
    Value<String?>? description,
    Value<String?>? paymentMethod,
    Value<bool>? fixed,
    Value<DateTime>? date,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FinanceTransactionsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      fixed: fixed ?? this.fixed,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (fixed.present) {
      map['fixed'] = Variable<bool>(fixed.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinanceTransactionsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('fixed: $fixed, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FixedExpensesTable extends FixedExpenses
    with TableInfo<$FixedExpensesTable, FixedExpense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FixedExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueDayMeta = const VerificationMeta('dueDay');
  @override
  late final GeneratedColumn<int> dueDay = GeneratedColumn<int>(
    'due_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recurrenceMeta = const VerificationMeta(
    'recurrence',
  );
  @override
  late final GeneratedColumn<String> recurrence = GeneratedColumn<String>(
    'recurrence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Mensal'),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    amount,
    categoryId,
    dueDay,
    recurrence,
    active,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fixed_expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<FixedExpense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('due_day')) {
      context.handle(
        _dueDayMeta,
        dueDay.isAcceptableOrUnknown(data['due_day']!, _dueDayMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDayMeta);
    }
    if (data.containsKey('recurrence')) {
      context.handle(
        _recurrenceMeta,
        recurrence.isAcceptableOrUnknown(data['recurrence']!, _recurrenceMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FixedExpense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FixedExpense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      dueDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_day'],
      )!,
      recurrence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FixedExpensesTable createAlias(String alias) {
    return $FixedExpensesTable(attachedDatabase, alias);
  }
}

class FixedExpense extends DataClass implements Insertable<FixedExpense> {
  final String id;
  final String name;
  final double amount;
  final String? categoryId;
  final int dueDay;
  final String recurrence;
  final bool active;
  final DateTime createdAt;
  const FixedExpense({
    required this.id,
    required this.name,
    required this.amount,
    this.categoryId,
    required this.dueDay,
    required this.recurrence,
    required this.active,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['due_day'] = Variable<int>(dueDay);
    map['recurrence'] = Variable<String>(recurrence);
    map['active'] = Variable<bool>(active);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FixedExpensesCompanion toCompanion(bool nullToAbsent) {
    return FixedExpensesCompanion(
      id: Value(id),
      name: Value(name),
      amount: Value(amount),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      dueDay: Value(dueDay),
      recurrence: Value(recurrence),
      active: Value(active),
      createdAt: Value(createdAt),
    );
  }

  factory FixedExpense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FixedExpense(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      dueDay: serializer.fromJson<int>(json['dueDay']),
      recurrence: serializer.fromJson<String>(json['recurrence']),
      active: serializer.fromJson<bool>(json['active']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
      'categoryId': serializer.toJson<String?>(categoryId),
      'dueDay': serializer.toJson<int>(dueDay),
      'recurrence': serializer.toJson<String>(recurrence),
      'active': serializer.toJson<bool>(active),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FixedExpense copyWith({
    String? id,
    String? name,
    double? amount,
    Value<String?> categoryId = const Value.absent(),
    int? dueDay,
    String? recurrence,
    bool? active,
    DateTime? createdAt,
  }) => FixedExpense(
    id: id ?? this.id,
    name: name ?? this.name,
    amount: amount ?? this.amount,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    dueDay: dueDay ?? this.dueDay,
    recurrence: recurrence ?? this.recurrence,
    active: active ?? this.active,
    createdAt: createdAt ?? this.createdAt,
  );
  FixedExpense copyWithCompanion(FixedExpensesCompanion data) {
    return FixedExpense(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      dueDay: data.dueDay.present ? data.dueDay.value : this.dueDay,
      recurrence: data.recurrence.present
          ? data.recurrence.value
          : this.recurrence,
      active: data.active.present ? data.active.value : this.active,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FixedExpense(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('categoryId: $categoryId, ')
          ..write('dueDay: $dueDay, ')
          ..write('recurrence: $recurrence, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    amount,
    categoryId,
    dueDay,
    recurrence,
    active,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FixedExpense &&
          other.id == this.id &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.categoryId == this.categoryId &&
          other.dueDay == this.dueDay &&
          other.recurrence == this.recurrence &&
          other.active == this.active &&
          other.createdAt == this.createdAt);
}

class FixedExpensesCompanion extends UpdateCompanion<FixedExpense> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> amount;
  final Value<String?> categoryId;
  final Value<int> dueDay;
  final Value<String> recurrence;
  final Value<bool> active;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FixedExpensesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.dueDay = const Value.absent(),
    this.recurrence = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FixedExpensesCompanion.insert({
    required String id,
    required String name,
    required double amount,
    this.categoryId = const Value.absent(),
    required int dueDay,
    this.recurrence = const Value.absent(),
    this.active = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       amount = Value(amount),
       dueDay = Value(dueDay),
       createdAt = Value(createdAt);
  static Insertable<FixedExpense> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? amount,
    Expression<String>? categoryId,
    Expression<int>? dueDay,
    Expression<String>? recurrence,
    Expression<bool>? active,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (categoryId != null) 'category_id': categoryId,
      if (dueDay != null) 'due_day': dueDay,
      if (recurrence != null) 'recurrence': recurrence,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FixedExpensesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? amount,
    Value<String?>? categoryId,
    Value<int>? dueDay,
    Value<String>? recurrence,
    Value<bool>? active,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FixedExpensesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      categoryId: categoryId ?? this.categoryId,
      dueDay: dueDay ?? this.dueDay,
      recurrence: recurrence ?? this.recurrence,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (dueDay.present) {
      map['due_day'] = Variable<int>(dueDay.value);
    }
    if (recurrence.present) {
      map['recurrence'] = Variable<String>(recurrence.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FixedExpensesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('categoryId: $categoryId, ')
          ..write('dueDay: $dueDay, ')
          ..write('recurrence: $recurrence, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FinancialGoalsTable extends FinancialGoals
    with TableInfo<$FinancialGoalsTable, FinancialGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FinancialGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetAmountMeta = const VerificationMeta(
    'targetAmount',
  );
  @override
  late final GeneratedColumn<double> targetAmount = GeneratedColumn<double>(
    'target_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentAmountMeta = const VerificationMeta(
    'currentAmount',
  );
  @override
  late final GeneratedColumn<double> currentAmount = GeneratedColumn<double>(
    'current_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    targetAmount,
    currentAmount,
    deadline,
    category,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'financial_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<FinancialGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('target_amount')) {
      context.handle(
        _targetAmountMeta,
        targetAmount.isAcceptableOrUnknown(
          data['target_amount']!,
          _targetAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetAmountMeta);
    }
    if (data.containsKey('current_amount')) {
      context.handle(
        _currentAmountMeta,
        currentAmount.isAcceptableOrUnknown(
          data['current_amount']!,
          _currentAmountMeta,
        ),
      );
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinancialGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinancialGoal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      targetAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_amount'],
      )!,
      currentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_amount'],
      )!,
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FinancialGoalsTable createAlias(String alias) {
    return $FinancialGoalsTable(attachedDatabase, alias);
  }
}

class FinancialGoal extends DataClass implements Insertable<FinancialGoal> {
  final String id;
  final String name;
  final double targetAmount;
  final double currentAmount;
  final DateTime? deadline;
  final String? category;
  final DateTime createdAt;
  const FinancialGoal({
    required this.id,
    required this.name,
    required this.targetAmount,
    required this.currentAmount,
    this.deadline,
    this.category,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['target_amount'] = Variable<double>(targetAmount);
    map['current_amount'] = Variable<double>(currentAmount);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FinancialGoalsCompanion toCompanion(bool nullToAbsent) {
    return FinancialGoalsCompanion(
      id: Value(id),
      name: Value(name),
      targetAmount: Value(targetAmount),
      currentAmount: Value(currentAmount),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      createdAt: Value(createdAt),
    );
  }

  factory FinancialGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinancialGoal(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      targetAmount: serializer.fromJson<double>(json['targetAmount']),
      currentAmount: serializer.fromJson<double>(json['currentAmount']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      category: serializer.fromJson<String?>(json['category']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'targetAmount': serializer.toJson<double>(targetAmount),
      'currentAmount': serializer.toJson<double>(currentAmount),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'category': serializer.toJson<String?>(category),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FinancialGoal copyWith({
    String? id,
    String? name,
    double? targetAmount,
    double? currentAmount,
    Value<DateTime?> deadline = const Value.absent(),
    Value<String?> category = const Value.absent(),
    DateTime? createdAt,
  }) => FinancialGoal(
    id: id ?? this.id,
    name: name ?? this.name,
    targetAmount: targetAmount ?? this.targetAmount,
    currentAmount: currentAmount ?? this.currentAmount,
    deadline: deadline.present ? deadline.value : this.deadline,
    category: category.present ? category.value : this.category,
    createdAt: createdAt ?? this.createdAt,
  );
  FinancialGoal copyWithCompanion(FinancialGoalsCompanion data) {
    return FinancialGoal(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      targetAmount: data.targetAmount.present
          ? data.targetAmount.value
          : this.targetAmount,
      currentAmount: data.currentAmount.present
          ? data.currentAmount.value
          : this.currentAmount,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      category: data.category.present ? data.category.value : this.category,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinancialGoal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('deadline: $deadline, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    targetAmount,
    currentAmount,
    deadline,
    category,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinancialGoal &&
          other.id == this.id &&
          other.name == this.name &&
          other.targetAmount == this.targetAmount &&
          other.currentAmount == this.currentAmount &&
          other.deadline == this.deadline &&
          other.category == this.category &&
          other.createdAt == this.createdAt);
}

class FinancialGoalsCompanion extends UpdateCompanion<FinancialGoal> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> targetAmount;
  final Value<double> currentAmount;
  final Value<DateTime?> deadline;
  final Value<String?> category;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FinancialGoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.currentAmount = const Value.absent(),
    this.deadline = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FinancialGoalsCompanion.insert({
    required String id,
    required String name,
    required double targetAmount,
    this.currentAmount = const Value.absent(),
    this.deadline = const Value.absent(),
    this.category = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       targetAmount = Value(targetAmount),
       createdAt = Value(createdAt);
  static Insertable<FinancialGoal> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? targetAmount,
    Expression<double>? currentAmount,
    Expression<DateTime>? deadline,
    Expression<String>? category,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (targetAmount != null) 'target_amount': targetAmount,
      if (currentAmount != null) 'current_amount': currentAmount,
      if (deadline != null) 'deadline': deadline,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FinancialGoalsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? targetAmount,
    Value<double>? currentAmount,
    Value<DateTime?>? deadline,
    Value<String?>? category,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FinancialGoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      targetAmount: targetAmount ?? this.targetAmount,
      currentAmount: currentAmount ?? this.currentAmount,
      deadline: deadline ?? this.deadline,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (targetAmount.present) {
      map['target_amount'] = Variable<double>(targetAmount.value);
    }
    if (currentAmount.present) {
      map['current_amount'] = Variable<double>(currentAmount.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinancialGoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('deadline: $deadline, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReceiptImagesTable extends ReceiptImages
    with TableInfo<$ReceiptImagesTable, ReceiptImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, transactionId, path, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipt_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReceiptImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReceiptImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReceiptImage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_id'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ReceiptImagesTable createAlias(String alias) {
    return $ReceiptImagesTable(attachedDatabase, alias);
  }
}

class ReceiptImage extends DataClass implements Insertable<ReceiptImage> {
  final String id;
  final String transactionId;
  final String path;
  final DateTime createdAt;
  const ReceiptImage({
    required this.id,
    required this.transactionId,
    required this.path,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transaction_id'] = Variable<String>(transactionId);
    map['path'] = Variable<String>(path);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReceiptImagesCompanion toCompanion(bool nullToAbsent) {
    return ReceiptImagesCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      path: Value(path),
      createdAt: Value(createdAt),
    );
  }

  factory ReceiptImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReceiptImage(
      id: serializer.fromJson<String>(json['id']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      path: serializer.fromJson<String>(json['path']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'transactionId': serializer.toJson<String>(transactionId),
      'path': serializer.toJson<String>(path),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ReceiptImage copyWith({
    String? id,
    String? transactionId,
    String? path,
    DateTime? createdAt,
  }) => ReceiptImage(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    path: path ?? this.path,
    createdAt: createdAt ?? this.createdAt,
  );
  ReceiptImage copyWithCompanion(ReceiptImagesCompanion data) {
    return ReceiptImage(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      path: data.path.present ? data.path.value : this.path,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptImage(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('path: $path, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, transactionId, path, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReceiptImage &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.path == this.path &&
          other.createdAt == this.createdAt);
}

class ReceiptImagesCompanion extends UpdateCompanion<ReceiptImage> {
  final Value<String> id;
  final Value<String> transactionId;
  final Value<String> path;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ReceiptImagesCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.path = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReceiptImagesCompanion.insert({
    required String id,
    required String transactionId,
    required String path,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       transactionId = Value(transactionId),
       path = Value(path),
       createdAt = Value(createdAt);
  static Insertable<ReceiptImage> custom({
    Expression<String>? id,
    Expression<String>? transactionId,
    Expression<String>? path,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (path != null) 'path': path,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReceiptImagesCompanion copyWith({
    Value<String>? id,
    Value<String>? transactionId,
    Value<String>? path,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ReceiptImagesCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      path: path ?? this.path,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptImagesCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('path: $path, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Em andamento'),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Media'),
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextTaskMeta = const VerificationMeta(
    'nextTask',
  );
  @override
  late final GeneratedColumn<String> nextTask = GeneratedColumn<String>(
    'next_task',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Projetos'),
  );
  static const VerificationMeta _investedMinutesMeta = const VerificationMeta(
    'investedMinutes',
  );
  @override
  late final GeneratedColumn<int> investedMinutes = GeneratedColumn<int>(
    'invested_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    status,
    priority,
    progress,
    nextTask,
    area,
    investedMinutes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Project> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('next_task')) {
      context.handle(
        _nextTaskMeta,
        nextTask.isAcceptableOrUnknown(data['next_task']!, _nextTaskMeta),
      );
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    }
    if (data.containsKey('invested_minutes')) {
      context.handle(
        _investedMinutesMeta,
        investedMinutes.isAcceptableOrUnknown(
          data['invested_minutes']!,
          _investedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      nextTask: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_task'],
      ),
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      )!,
      investedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invested_minutes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final String id;
  final String name;
  final String? description;
  final String status;
  final String priority;
  final int progress;
  final String? nextTask;
  final String area;
  final int investedMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Project({
    required this.id,
    required this.name,
    this.description,
    required this.status,
    required this.priority,
    required this.progress,
    this.nextTask,
    required this.area,
    required this.investedMinutes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<String>(status);
    map['priority'] = Variable<String>(priority);
    map['progress'] = Variable<int>(progress);
    if (!nullToAbsent || nextTask != null) {
      map['next_task'] = Variable<String>(nextTask);
    }
    map['area'] = Variable<String>(area);
    map['invested_minutes'] = Variable<int>(investedMinutes);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      priority: Value(priority),
      progress: Value(progress),
      nextTask: nextTask == null && nullToAbsent
          ? const Value.absent()
          : Value(nextTask),
      area: Value(area),
      investedMinutes: Value(investedMinutes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<String>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      progress: serializer.fromJson<int>(json['progress']),
      nextTask: serializer.fromJson<String?>(json['nextTask']),
      area: serializer.fromJson<String>(json['area']),
      investedMinutes: serializer.fromJson<int>(json['investedMinutes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<String>(status),
      'priority': serializer.toJson<String>(priority),
      'progress': serializer.toJson<int>(progress),
      'nextTask': serializer.toJson<String?>(nextTask),
      'area': serializer.toJson<String>(area),
      'investedMinutes': serializer.toJson<int>(investedMinutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Project copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? status,
    String? priority,
    int? progress,
    Value<String?> nextTask = const Value.absent(),
    String? area,
    int? investedMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Project(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    status: status ?? this.status,
    priority: priority ?? this.priority,
    progress: progress ?? this.progress,
    nextTask: nextTask.present ? nextTask.value : this.nextTask,
    area: area ?? this.area,
    investedMinutes: investedMinutes ?? this.investedMinutes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      progress: data.progress.present ? data.progress.value : this.progress,
      nextTask: data.nextTask.present ? data.nextTask.value : this.nextTask,
      area: data.area.present ? data.area.value : this.area,
      investedMinutes: data.investedMinutes.present
          ? data.investedMinutes.value
          : this.investedMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('progress: $progress, ')
          ..write('nextTask: $nextTask, ')
          ..write('area: $area, ')
          ..write('investedMinutes: $investedMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    status,
    priority,
    progress,
    nextTask,
    area,
    investedMinutes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.progress == this.progress &&
          other.nextTask == this.nextTask &&
          other.area == this.area &&
          other.investedMinutes == this.investedMinutes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> status;
  final Value<String> priority;
  final Value<int> progress;
  final Value<String?> nextTask;
  final Value<String> area;
  final Value<int> investedMinutes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.progress = const Value.absent(),
    this.nextTask = const Value.absent(),
    this.area = const Value.absent(),
    this.investedMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.progress = const Value.absent(),
    this.nextTask = const Value.absent(),
    this.area = const Value.absent(),
    this.investedMinutes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Project> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? status,
    Expression<String>? priority,
    Expression<int>? progress,
    Expression<String>? nextTask,
    Expression<String>? area,
    Expression<int>? investedMinutes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (progress != null) 'progress': progress,
      if (nextTask != null) 'next_task': nextTask,
      if (area != null) 'area': area,
      if (investedMinutes != null) 'invested_minutes': investedMinutes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? status,
    Value<String>? priority,
    Value<int>? progress,
    Value<String?>? nextTask,
    Value<String>? area,
    Value<int>? investedMinutes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      progress: progress ?? this.progress,
      nextTask: nextTask ?? this.nextTask,
      area: area ?? this.area,
      investedMinutes: investedMinutes ?? this.investedMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (nextTask.present) {
      map['next_task'] = Variable<String>(nextTask.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (investedMinutes.present) {
      map['invested_minutes'] = Variable<int>(investedMinutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('progress: $progress, ')
          ..write('nextTask: $nextTask, ')
          ..write('area: $area, ')
          ..write('investedMinutes: $investedMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectTasksTable extends ProjectTasks
    with TableInfo<$ProjectTasksTable, ProjectTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    title,
    isDone,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectTask(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProjectTasksTable createAlias(String alias) {
    return $ProjectTasksTable(attachedDatabase, alias);
  }
}

class ProjectTask extends DataClass implements Insertable<ProjectTask> {
  final String id;
  final String projectId;
  final String title;
  final bool isDone;
  final DateTime createdAt;
  const ProjectTask({
    required this.id,
    required this.projectId,
    required this.title,
    required this.isDone,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['title'] = Variable<String>(title);
    map['is_done'] = Variable<bool>(isDone);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProjectTasksCompanion toCompanion(bool nullToAbsent) {
    return ProjectTasksCompanion(
      id: Value(id),
      projectId: Value(projectId),
      title: Value(title),
      isDone: Value(isDone),
      createdAt: Value(createdAt),
    );
  }

  factory ProjectTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectTask(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      title: serializer.fromJson<String>(json['title']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'title': serializer.toJson<String>(title),
      'isDone': serializer.toJson<bool>(isDone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProjectTask copyWith({
    String? id,
    String? projectId,
    String? title,
    bool? isDone,
    DateTime? createdAt,
  }) => ProjectTask(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    createdAt: createdAt ?? this.createdAt,
  );
  ProjectTask copyWithCompanion(ProjectTasksCompanion data) {
    return ProjectTask(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      title: data.title.present ? data.title.value : this.title,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTask(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, title, isDone, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectTask &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.title == this.title &&
          other.isDone == this.isDone &&
          other.createdAt == this.createdAt);
}

class ProjectTasksCompanion extends UpdateCompanion<ProjectTask> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> title;
  final Value<bool> isDone;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ProjectTasksCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.title = const Value.absent(),
    this.isDone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectTasksCompanion.insert({
    required String id,
    required String projectId,
    required String title,
    this.isDone = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<ProjectTask> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? title,
    Expression<bool>? isDone,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (title != null) 'title': title,
      if (isDone != null) 'is_done': isDone,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectTasksCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? title,
    Value<bool>? isDone,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ProjectTasksCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTasksCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectNotesTable extends ProjectNotes
    with TableInfo<$ProjectNotesTable, ProjectNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, projectId, note, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectNote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectNote(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProjectNotesTable createAlias(String alias) {
    return $ProjectNotesTable(attachedDatabase, alias);
  }
}

class ProjectNote extends DataClass implements Insertable<ProjectNote> {
  final String id;
  final String projectId;
  final String note;
  final DateTime createdAt;
  const ProjectNote({
    required this.id,
    required this.projectId,
    required this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['note'] = Variable<String>(note);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProjectNotesCompanion toCompanion(bool nullToAbsent) {
    return ProjectNotesCompanion(
      id: Value(id),
      projectId: Value(projectId),
      note: Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory ProjectNote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectNote(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      note: serializer.fromJson<String>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'note': serializer.toJson<String>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProjectNote copyWith({
    String? id,
    String? projectId,
    String? note,
    DateTime? createdAt,
  }) => ProjectNote(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    note: note ?? this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  ProjectNote copyWithCompanion(ProjectNotesCompanion data) {
    return ProjectNote(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectNote(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectNote &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class ProjectNotesCompanion extends UpdateCompanion<ProjectNote> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> note;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ProjectNotesCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectNotesCompanion.insert({
    required String id,
    required String projectId,
    required String note,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       note = Value(note),
       createdAt = Value(createdAt);
  static Insertable<ProjectNote> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectNotesCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? note,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ProjectNotesCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectNotesCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectTimeLogsTable extends ProjectTimeLogs
    with TableInfo<$ProjectTimeLogsTable, ProjectTimeLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTimeLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutesMeta = const VerificationMeta(
    'minutes',
  );
  @override
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
    'minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    minutes,
    note,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_time_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectTimeLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('minutes')) {
      context.handle(
        _minutesMeta,
        minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta),
      );
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectTimeLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectTimeLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      minutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProjectTimeLogsTable createAlias(String alias) {
    return $ProjectTimeLogsTable(attachedDatabase, alias);
  }
}

class ProjectTimeLog extends DataClass implements Insertable<ProjectTimeLog> {
  final String id;
  final String projectId;
  final int minutes;
  final String? note;
  final DateTime createdAt;
  const ProjectTimeLog({
    required this.id,
    required this.projectId,
    required this.minutes,
    this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['minutes'] = Variable<int>(minutes);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProjectTimeLogsCompanion toCompanion(bool nullToAbsent) {
    return ProjectTimeLogsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      minutes: Value(minutes),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory ProjectTimeLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectTimeLog(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      minutes: serializer.fromJson<int>(json['minutes']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'minutes': serializer.toJson<int>(minutes),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProjectTimeLog copyWith({
    String? id,
    String? projectId,
    int? minutes,
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
  }) => ProjectTimeLog(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    minutes: minutes ?? this.minutes,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  ProjectTimeLog copyWithCompanion(ProjectTimeLogsCompanion data) {
    return ProjectTimeLog(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      minutes: data.minutes.present ? data.minutes.value : this.minutes,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTimeLog(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('minutes: $minutes, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, minutes, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectTimeLog &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.minutes == this.minutes &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class ProjectTimeLogsCompanion extends UpdateCompanion<ProjectTimeLog> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<int> minutes;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ProjectTimeLogsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.minutes = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectTimeLogsCompanion.insert({
    required String id,
    required String projectId,
    required int minutes,
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       minutes = Value(minutes),
       createdAt = Value(createdAt);
  static Insertable<ProjectTimeLog> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<int>? minutes,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (minutes != null) 'minutes': minutes,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectTimeLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<int>? minutes,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ProjectTimeLogsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      minutes: minutes ?? this.minutes,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTimeLogsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('minutes: $minutes, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiaryEntriesTable extends DiaryEntries
    with TableInfo<$DiaryEntriesTable, DiaryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
    'mood',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<int> energy = GeneratedColumn<int>(
    'energy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productivityMeta = const VerificationMeta(
    'productivity',
  );
  @override
  late final GeneratedColumn<int> productivity = GeneratedColumn<int>(
    'productivity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleepMeta = const VerificationMeta('sleep');
  @override
  late final GeneratedColumn<String> sleep = GeneratedColumn<String>(
    'sleep',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nutritionMeta = const VerificationMeta(
    'nutrition',
  );
  @override
  late final GeneratedColumn<String> nutrition = GeneratedColumn<String>(
    'nutrition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainingMeta = const VerificationMeta(
    'training',
  );
  @override
  late final GeneratedColumn<String> training = GeneratedColumn<String>(
    'training',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _studiesMeta = const VerificationMeta(
    'studies',
  );
  @override
  late final GeneratedColumn<String> studies = GeneratedColumn<String>(
    'studies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _financesMeta = const VerificationMeta(
    'finances',
  );
  @override
  late final GeneratedColumn<String> finances = GeneratedColumn<String>(
    'finances',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _victoryMeta = const VerificationMeta(
    'victory',
  );
  @override
  late final GeneratedColumn<String> victory = GeneratedColumn<String>(
    'victory',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mistakeMeta = const VerificationMeta(
    'mistake',
  );
  @override
  late final GeneratedColumn<String> mistake = GeneratedColumn<String>(
    'mistake',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _learningMeta = const VerificationMeta(
    'learning',
  );
  @override
  late final GeneratedColumn<String> learning = GeneratedColumn<String>(
    'learning',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _freeNoteMeta = const VerificationMeta(
    'freeNote',
  );
  @override
  late final GeneratedColumn<String> freeNote = GeneratedColumn<String>(
    'free_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    mood,
    energy,
    productivity,
    sleep,
    nutrition,
    training,
    studies,
    finances,
    victory,
    mistake,
    learning,
    freeNote,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diary_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiaryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('energy')) {
      context.handle(
        _energyMeta,
        energy.isAcceptableOrUnknown(data['energy']!, _energyMeta),
      );
    }
    if (data.containsKey('productivity')) {
      context.handle(
        _productivityMeta,
        productivity.isAcceptableOrUnknown(
          data['productivity']!,
          _productivityMeta,
        ),
      );
    }
    if (data.containsKey('sleep')) {
      context.handle(
        _sleepMeta,
        sleep.isAcceptableOrUnknown(data['sleep']!, _sleepMeta),
      );
    }
    if (data.containsKey('nutrition')) {
      context.handle(
        _nutritionMeta,
        nutrition.isAcceptableOrUnknown(data['nutrition']!, _nutritionMeta),
      );
    }
    if (data.containsKey('training')) {
      context.handle(
        _trainingMeta,
        training.isAcceptableOrUnknown(data['training']!, _trainingMeta),
      );
    }
    if (data.containsKey('studies')) {
      context.handle(
        _studiesMeta,
        studies.isAcceptableOrUnknown(data['studies']!, _studiesMeta),
      );
    }
    if (data.containsKey('finances')) {
      context.handle(
        _financesMeta,
        finances.isAcceptableOrUnknown(data['finances']!, _financesMeta),
      );
    }
    if (data.containsKey('victory')) {
      context.handle(
        _victoryMeta,
        victory.isAcceptableOrUnknown(data['victory']!, _victoryMeta),
      );
    }
    if (data.containsKey('mistake')) {
      context.handle(
        _mistakeMeta,
        mistake.isAcceptableOrUnknown(data['mistake']!, _mistakeMeta),
      );
    }
    if (data.containsKey('learning')) {
      context.handle(
        _learningMeta,
        learning.isAcceptableOrUnknown(data['learning']!, _learningMeta),
      );
    }
    if (data.containsKey('free_note')) {
      context.handle(
        _freeNoteMeta,
        freeNote.isAcceptableOrUnknown(data['free_note']!, _freeNoteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiaryEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood'],
      ),
      energy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}energy'],
      ),
      productivity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}productivity'],
      ),
      sleep: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sleep'],
      ),
      nutrition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrition'],
      ),
      training: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}training'],
      ),
      studies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}studies'],
      ),
      finances: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}finances'],
      ),
      victory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}victory'],
      ),
      mistake: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mistake'],
      ),
      learning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}learning'],
      ),
      freeNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}free_note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DiaryEntriesTable createAlias(String alias) {
    return $DiaryEntriesTable(attachedDatabase, alias);
  }
}

class DiaryEntry extends DataClass implements Insertable<DiaryEntry> {
  final String id;
  final DateTime date;
  final int? mood;
  final int? energy;
  final int? productivity;
  final String? sleep;
  final String? nutrition;
  final String? training;
  final String? studies;
  final String? finances;
  final String? victory;
  final String? mistake;
  final String? learning;
  final String? freeNote;
  final DateTime createdAt;
  const DiaryEntry({
    required this.id,
    required this.date,
    this.mood,
    this.energy,
    this.productivity,
    this.sleep,
    this.nutrition,
    this.training,
    this.studies,
    this.finances,
    this.victory,
    this.mistake,
    this.learning,
    this.freeNote,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<int>(mood);
    }
    if (!nullToAbsent || energy != null) {
      map['energy'] = Variable<int>(energy);
    }
    if (!nullToAbsent || productivity != null) {
      map['productivity'] = Variable<int>(productivity);
    }
    if (!nullToAbsent || sleep != null) {
      map['sleep'] = Variable<String>(sleep);
    }
    if (!nullToAbsent || nutrition != null) {
      map['nutrition'] = Variable<String>(nutrition);
    }
    if (!nullToAbsent || training != null) {
      map['training'] = Variable<String>(training);
    }
    if (!nullToAbsent || studies != null) {
      map['studies'] = Variable<String>(studies);
    }
    if (!nullToAbsent || finances != null) {
      map['finances'] = Variable<String>(finances);
    }
    if (!nullToAbsent || victory != null) {
      map['victory'] = Variable<String>(victory);
    }
    if (!nullToAbsent || mistake != null) {
      map['mistake'] = Variable<String>(mistake);
    }
    if (!nullToAbsent || learning != null) {
      map['learning'] = Variable<String>(learning);
    }
    if (!nullToAbsent || freeNote != null) {
      map['free_note'] = Variable<String>(freeNote);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DiaryEntriesCompanion toCompanion(bool nullToAbsent) {
    return DiaryEntriesCompanion(
      id: Value(id),
      date: Value(date),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      energy: energy == null && nullToAbsent
          ? const Value.absent()
          : Value(energy),
      productivity: productivity == null && nullToAbsent
          ? const Value.absent()
          : Value(productivity),
      sleep: sleep == null && nullToAbsent
          ? const Value.absent()
          : Value(sleep),
      nutrition: nutrition == null && nullToAbsent
          ? const Value.absent()
          : Value(nutrition),
      training: training == null && nullToAbsent
          ? const Value.absent()
          : Value(training),
      studies: studies == null && nullToAbsent
          ? const Value.absent()
          : Value(studies),
      finances: finances == null && nullToAbsent
          ? const Value.absent()
          : Value(finances),
      victory: victory == null && nullToAbsent
          ? const Value.absent()
          : Value(victory),
      mistake: mistake == null && nullToAbsent
          ? const Value.absent()
          : Value(mistake),
      learning: learning == null && nullToAbsent
          ? const Value.absent()
          : Value(learning),
      freeNote: freeNote == null && nullToAbsent
          ? const Value.absent()
          : Value(freeNote),
      createdAt: Value(createdAt),
    );
  }

  factory DiaryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryEntry(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      mood: serializer.fromJson<int?>(json['mood']),
      energy: serializer.fromJson<int?>(json['energy']),
      productivity: serializer.fromJson<int?>(json['productivity']),
      sleep: serializer.fromJson<String?>(json['sleep']),
      nutrition: serializer.fromJson<String?>(json['nutrition']),
      training: serializer.fromJson<String?>(json['training']),
      studies: serializer.fromJson<String?>(json['studies']),
      finances: serializer.fromJson<String?>(json['finances']),
      victory: serializer.fromJson<String?>(json['victory']),
      mistake: serializer.fromJson<String?>(json['mistake']),
      learning: serializer.fromJson<String?>(json['learning']),
      freeNote: serializer.fromJson<String?>(json['freeNote']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'mood': serializer.toJson<int?>(mood),
      'energy': serializer.toJson<int?>(energy),
      'productivity': serializer.toJson<int?>(productivity),
      'sleep': serializer.toJson<String?>(sleep),
      'nutrition': serializer.toJson<String?>(nutrition),
      'training': serializer.toJson<String?>(training),
      'studies': serializer.toJson<String?>(studies),
      'finances': serializer.toJson<String?>(finances),
      'victory': serializer.toJson<String?>(victory),
      'mistake': serializer.toJson<String?>(mistake),
      'learning': serializer.toJson<String?>(learning),
      'freeNote': serializer.toJson<String?>(freeNote),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DiaryEntry copyWith({
    String? id,
    DateTime? date,
    Value<int?> mood = const Value.absent(),
    Value<int?> energy = const Value.absent(),
    Value<int?> productivity = const Value.absent(),
    Value<String?> sleep = const Value.absent(),
    Value<String?> nutrition = const Value.absent(),
    Value<String?> training = const Value.absent(),
    Value<String?> studies = const Value.absent(),
    Value<String?> finances = const Value.absent(),
    Value<String?> victory = const Value.absent(),
    Value<String?> mistake = const Value.absent(),
    Value<String?> learning = const Value.absent(),
    Value<String?> freeNote = const Value.absent(),
    DateTime? createdAt,
  }) => DiaryEntry(
    id: id ?? this.id,
    date: date ?? this.date,
    mood: mood.present ? mood.value : this.mood,
    energy: energy.present ? energy.value : this.energy,
    productivity: productivity.present ? productivity.value : this.productivity,
    sleep: sleep.present ? sleep.value : this.sleep,
    nutrition: nutrition.present ? nutrition.value : this.nutrition,
    training: training.present ? training.value : this.training,
    studies: studies.present ? studies.value : this.studies,
    finances: finances.present ? finances.value : this.finances,
    victory: victory.present ? victory.value : this.victory,
    mistake: mistake.present ? mistake.value : this.mistake,
    learning: learning.present ? learning.value : this.learning,
    freeNote: freeNote.present ? freeNote.value : this.freeNote,
    createdAt: createdAt ?? this.createdAt,
  );
  DiaryEntry copyWithCompanion(DiaryEntriesCompanion data) {
    return DiaryEntry(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      mood: data.mood.present ? data.mood.value : this.mood,
      energy: data.energy.present ? data.energy.value : this.energy,
      productivity: data.productivity.present
          ? data.productivity.value
          : this.productivity,
      sleep: data.sleep.present ? data.sleep.value : this.sleep,
      nutrition: data.nutrition.present ? data.nutrition.value : this.nutrition,
      training: data.training.present ? data.training.value : this.training,
      studies: data.studies.present ? data.studies.value : this.studies,
      finances: data.finances.present ? data.finances.value : this.finances,
      victory: data.victory.present ? data.victory.value : this.victory,
      mistake: data.mistake.present ? data.mistake.value : this.mistake,
      learning: data.learning.present ? data.learning.value : this.learning,
      freeNote: data.freeNote.present ? data.freeNote.value : this.freeNote,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntry(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('productivity: $productivity, ')
          ..write('sleep: $sleep, ')
          ..write('nutrition: $nutrition, ')
          ..write('training: $training, ')
          ..write('studies: $studies, ')
          ..write('finances: $finances, ')
          ..write('victory: $victory, ')
          ..write('mistake: $mistake, ')
          ..write('learning: $learning, ')
          ..write('freeNote: $freeNote, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    mood,
    energy,
    productivity,
    sleep,
    nutrition,
    training,
    studies,
    finances,
    victory,
    mistake,
    learning,
    freeNote,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryEntry &&
          other.id == this.id &&
          other.date == this.date &&
          other.mood == this.mood &&
          other.energy == this.energy &&
          other.productivity == this.productivity &&
          other.sleep == this.sleep &&
          other.nutrition == this.nutrition &&
          other.training == this.training &&
          other.studies == this.studies &&
          other.finances == this.finances &&
          other.victory == this.victory &&
          other.mistake == this.mistake &&
          other.learning == this.learning &&
          other.freeNote == this.freeNote &&
          other.createdAt == this.createdAt);
}

class DiaryEntriesCompanion extends UpdateCompanion<DiaryEntry> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<int?> mood;
  final Value<int?> energy;
  final Value<int?> productivity;
  final Value<String?> sleep;
  final Value<String?> nutrition;
  final Value<String?> training;
  final Value<String?> studies;
  final Value<String?> finances;
  final Value<String?> victory;
  final Value<String?> mistake;
  final Value<String?> learning;
  final Value<String?> freeNote;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DiaryEntriesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.mood = const Value.absent(),
    this.energy = const Value.absent(),
    this.productivity = const Value.absent(),
    this.sleep = const Value.absent(),
    this.nutrition = const Value.absent(),
    this.training = const Value.absent(),
    this.studies = const Value.absent(),
    this.finances = const Value.absent(),
    this.victory = const Value.absent(),
    this.mistake = const Value.absent(),
    this.learning = const Value.absent(),
    this.freeNote = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiaryEntriesCompanion.insert({
    required String id,
    required DateTime date,
    this.mood = const Value.absent(),
    this.energy = const Value.absent(),
    this.productivity = const Value.absent(),
    this.sleep = const Value.absent(),
    this.nutrition = const Value.absent(),
    this.training = const Value.absent(),
    this.studies = const Value.absent(),
    this.finances = const Value.absent(),
    this.victory = const Value.absent(),
    this.mistake = const Value.absent(),
    this.learning = const Value.absent(),
    this.freeNote = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<DiaryEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<int>? mood,
    Expression<int>? energy,
    Expression<int>? productivity,
    Expression<String>? sleep,
    Expression<String>? nutrition,
    Expression<String>? training,
    Expression<String>? studies,
    Expression<String>? finances,
    Expression<String>? victory,
    Expression<String>? mistake,
    Expression<String>? learning,
    Expression<String>? freeNote,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (mood != null) 'mood': mood,
      if (energy != null) 'energy': energy,
      if (productivity != null) 'productivity': productivity,
      if (sleep != null) 'sleep': sleep,
      if (nutrition != null) 'nutrition': nutrition,
      if (training != null) 'training': training,
      if (studies != null) 'studies': studies,
      if (finances != null) 'finances': finances,
      if (victory != null) 'victory': victory,
      if (mistake != null) 'mistake': mistake,
      if (learning != null) 'learning': learning,
      if (freeNote != null) 'free_note': freeNote,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiaryEntriesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<int?>? mood,
    Value<int?>? energy,
    Value<int?>? productivity,
    Value<String?>? sleep,
    Value<String?>? nutrition,
    Value<String?>? training,
    Value<String?>? studies,
    Value<String?>? finances,
    Value<String?>? victory,
    Value<String?>? mistake,
    Value<String?>? learning,
    Value<String?>? freeNote,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DiaryEntriesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      mood: mood ?? this.mood,
      energy: energy ?? this.energy,
      productivity: productivity ?? this.productivity,
      sleep: sleep ?? this.sleep,
      nutrition: nutrition ?? this.nutrition,
      training: training ?? this.training,
      studies: studies ?? this.studies,
      finances: finances ?? this.finances,
      victory: victory ?? this.victory,
      mistake: mistake ?? this.mistake,
      learning: learning ?? this.learning,
      freeNote: freeNote ?? this.freeNote,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mood.present) {
      map['mood'] = Variable<int>(mood.value);
    }
    if (energy.present) {
      map['energy'] = Variable<int>(energy.value);
    }
    if (productivity.present) {
      map['productivity'] = Variable<int>(productivity.value);
    }
    if (sleep.present) {
      map['sleep'] = Variable<String>(sleep.value);
    }
    if (nutrition.present) {
      map['nutrition'] = Variable<String>(nutrition.value);
    }
    if (training.present) {
      map['training'] = Variable<String>(training.value);
    }
    if (studies.present) {
      map['studies'] = Variable<String>(studies.value);
    }
    if (finances.present) {
      map['finances'] = Variable<String>(finances.value);
    }
    if (victory.present) {
      map['victory'] = Variable<String>(victory.value);
    }
    if (mistake.present) {
      map['mistake'] = Variable<String>(mistake.value);
    }
    if (learning.present) {
      map['learning'] = Variable<String>(learning.value);
    }
    if (freeNote.present) {
      map['free_note'] = Variable<String>(freeNote.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('productivity: $productivity, ')
          ..write('sleep: $sleep, ')
          ..write('nutrition: $nutrition, ')
          ..write('training: $training, ')
          ..write('studies: $studies, ')
          ..write('finances: $finances, ')
          ..write('victory: $victory, ')
          ..write('mistake: $mistake, ')
          ..write('learning: $learning, ')
          ..write('freeNote: $freeNote, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MoodLogsTable extends MoodLogs with TableInfo<$MoodLogsTable, MoodLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, value, note, loggedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MoodLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoodLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoodLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $MoodLogsTable createAlias(String alias) {
    return $MoodLogsTable(attachedDatabase, alias);
  }
}

class MoodLog extends DataClass implements Insertable<MoodLog> {
  final String id;
  final int value;
  final String? note;
  final DateTime loggedAt;
  const MoodLog({
    required this.id,
    required this.value,
    this.note,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['value'] = Variable<int>(value);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  MoodLogsCompanion toCompanion(bool nullToAbsent) {
    return MoodLogsCompanion(
      id: Value(id),
      value: Value(value),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      loggedAt: Value(loggedAt),
    );
  }

  factory MoodLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoodLog(
      id: serializer.fromJson<String>(json['id']),
      value: serializer.fromJson<int>(json['value']),
      note: serializer.fromJson<String?>(json['note']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'value': serializer.toJson<int>(value),
      'note': serializer.toJson<String?>(note),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  MoodLog copyWith({
    String? id,
    int? value,
    Value<String?> note = const Value.absent(),
    DateTime? loggedAt,
  }) => MoodLog(
    id: id ?? this.id,
    value: value ?? this.value,
    note: note.present ? note.value : this.note,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  MoodLog copyWithCompanion(MoodLogsCompanion data) {
    return MoodLog(
      id: data.id.present ? data.id.value : this.id,
      value: data.value.present ? data.value.value : this.value,
      note: data.note.present ? data.note.value : this.note,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MoodLog(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, value, note, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoodLog &&
          other.id == this.id &&
          other.value == this.value &&
          other.note == this.note &&
          other.loggedAt == this.loggedAt);
}

class MoodLogsCompanion extends UpdateCompanion<MoodLog> {
  final Value<String> id;
  final Value<int> value;
  final Value<String?> note;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const MoodLogsCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.note = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MoodLogsCompanion.insert({
    required String id,
    required int value,
    this.note = const Value.absent(),
    required DateTime loggedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       value = Value(value),
       loggedAt = Value(loggedAt);
  static Insertable<MoodLog> custom({
    Expression<String>? id,
    Expression<int>? value,
    Expression<String>? note,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (note != null) 'note': note,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MoodLogsCompanion copyWith({
    Value<String>? id,
    Value<int>? value,
    Value<String?>? note,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return MoodLogsCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      note: note ?? this.note,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodLogsCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EnergyLogsTable extends EnergyLogs
    with TableInfo<$EnergyLogsTable, EnergyLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnergyLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, value, note, loggedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'energy_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<EnergyLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EnergyLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnergyLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $EnergyLogsTable createAlias(String alias) {
    return $EnergyLogsTable(attachedDatabase, alias);
  }
}

class EnergyLog extends DataClass implements Insertable<EnergyLog> {
  final String id;
  final int value;
  final String? note;
  final DateTime loggedAt;
  const EnergyLog({
    required this.id,
    required this.value,
    this.note,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['value'] = Variable<int>(value);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  EnergyLogsCompanion toCompanion(bool nullToAbsent) {
    return EnergyLogsCompanion(
      id: Value(id),
      value: Value(value),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      loggedAt: Value(loggedAt),
    );
  }

  factory EnergyLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnergyLog(
      id: serializer.fromJson<String>(json['id']),
      value: serializer.fromJson<int>(json['value']),
      note: serializer.fromJson<String?>(json['note']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'value': serializer.toJson<int>(value),
      'note': serializer.toJson<String?>(note),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  EnergyLog copyWith({
    String? id,
    int? value,
    Value<String?> note = const Value.absent(),
    DateTime? loggedAt,
  }) => EnergyLog(
    id: id ?? this.id,
    value: value ?? this.value,
    note: note.present ? note.value : this.note,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  EnergyLog copyWithCompanion(EnergyLogsCompanion data) {
    return EnergyLog(
      id: data.id.present ? data.id.value : this.id,
      value: data.value.present ? data.value.value : this.value,
      note: data.note.present ? data.note.value : this.note,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnergyLog(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, value, note, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnergyLog &&
          other.id == this.id &&
          other.value == this.value &&
          other.note == this.note &&
          other.loggedAt == this.loggedAt);
}

class EnergyLogsCompanion extends UpdateCompanion<EnergyLog> {
  final Value<String> id;
  final Value<int> value;
  final Value<String?> note;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const EnergyLogsCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.note = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnergyLogsCompanion.insert({
    required String id,
    required int value,
    this.note = const Value.absent(),
    required DateTime loggedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       value = Value(value),
       loggedAt = Value(loggedAt);
  static Insertable<EnergyLog> custom({
    Expression<String>? id,
    Expression<int>? value,
    Expression<String>? note,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (note != null) 'note': note,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnergyLogsCompanion copyWith({
    Value<String>? id,
    Value<int>? value,
    Value<String?>? note,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return EnergyLogsCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      note: note ?? this.note,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnergyLogsCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lifeAreaMeta = const VerificationMeta(
    'lifeArea',
  );
  @override
  late final GeneratedColumn<String> lifeArea = GeneratedColumn<String>(
    'life_area',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Diario'),
  );
  static const VerificationMeta _triggerMeta = const VerificationMeta(
    'trigger',
  );
  @override
  late final GeneratedColumn<String> trigger = GeneratedColumn<String>(
    'trigger',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metricMeta = const VerificationMeta('metric');
  @override
  late final GeneratedColumn<String> metric = GeneratedColumn<String>(
    'metric',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _xpRewardMeta = const VerificationMeta(
    'xpReward',
  );
  @override
  late final GeneratedColumn<int> xpReward = GeneratedColumn<int>(
    'xp_reward',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    lifeArea,
    frequency,
    trigger,
    action,
    metric,
    xpReward,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Habit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('life_area')) {
      context.handle(
        _lifeAreaMeta,
        lifeArea.isAcceptableOrUnknown(data['life_area']!, _lifeAreaMeta),
      );
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    }
    if (data.containsKey('trigger')) {
      context.handle(
        _triggerMeta,
        trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    }
    if (data.containsKey('metric')) {
      context.handle(
        _metricMeta,
        metric.isAcceptableOrUnknown(data['metric']!, _metricMeta),
      );
    }
    if (data.containsKey('xp_reward')) {
      context.handle(
        _xpRewardMeta,
        xpReward.isAcceptableOrUnknown(data['xp_reward']!, _xpRewardMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lifeArea: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_area'],
      ),
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      trigger: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      ),
      metric: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metric'],
      ),
      xpReward: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_reward'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }
}

class Habit extends DataClass implements Insertable<Habit> {
  final String id;
  final String name;
  final String? lifeArea;
  final String frequency;
  final String? trigger;
  final String? action;
  final String? metric;
  final int xpReward;
  final DateTime createdAt;
  const Habit({
    required this.id,
    required this.name,
    this.lifeArea,
    required this.frequency,
    this.trigger,
    this.action,
    this.metric,
    required this.xpReward,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || lifeArea != null) {
      map['life_area'] = Variable<String>(lifeArea);
    }
    map['frequency'] = Variable<String>(frequency);
    if (!nullToAbsent || trigger != null) {
      map['trigger'] = Variable<String>(trigger);
    }
    if (!nullToAbsent || action != null) {
      map['action'] = Variable<String>(action);
    }
    if (!nullToAbsent || metric != null) {
      map['metric'] = Variable<String>(metric);
    }
    map['xp_reward'] = Variable<int>(xpReward);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      name: Value(name),
      lifeArea: lifeArea == null && nullToAbsent
          ? const Value.absent()
          : Value(lifeArea),
      frequency: Value(frequency),
      trigger: trigger == null && nullToAbsent
          ? const Value.absent()
          : Value(trigger),
      action: action == null && nullToAbsent
          ? const Value.absent()
          : Value(action),
      metric: metric == null && nullToAbsent
          ? const Value.absent()
          : Value(metric),
      xpReward: Value(xpReward),
      createdAt: Value(createdAt),
    );
  }

  factory Habit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lifeArea: serializer.fromJson<String?>(json['lifeArea']),
      frequency: serializer.fromJson<String>(json['frequency']),
      trigger: serializer.fromJson<String?>(json['trigger']),
      action: serializer.fromJson<String?>(json['action']),
      metric: serializer.fromJson<String?>(json['metric']),
      xpReward: serializer.fromJson<int>(json['xpReward']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'lifeArea': serializer.toJson<String?>(lifeArea),
      'frequency': serializer.toJson<String>(frequency),
      'trigger': serializer.toJson<String?>(trigger),
      'action': serializer.toJson<String?>(action),
      'metric': serializer.toJson<String?>(metric),
      'xpReward': serializer.toJson<int>(xpReward),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Habit copyWith({
    String? id,
    String? name,
    Value<String?> lifeArea = const Value.absent(),
    String? frequency,
    Value<String?> trigger = const Value.absent(),
    Value<String?> action = const Value.absent(),
    Value<String?> metric = const Value.absent(),
    int? xpReward,
    DateTime? createdAt,
  }) => Habit(
    id: id ?? this.id,
    name: name ?? this.name,
    lifeArea: lifeArea.present ? lifeArea.value : this.lifeArea,
    frequency: frequency ?? this.frequency,
    trigger: trigger.present ? trigger.value : this.trigger,
    action: action.present ? action.value : this.action,
    metric: metric.present ? metric.value : this.metric,
    xpReward: xpReward ?? this.xpReward,
    createdAt: createdAt ?? this.createdAt,
  );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lifeArea: data.lifeArea.present ? data.lifeArea.value : this.lifeArea,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      action: data.action.present ? data.action.value : this.action,
      metric: data.metric.present ? data.metric.value : this.metric,
      xpReward: data.xpReward.present ? data.xpReward.value : this.xpReward,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lifeArea: $lifeArea, ')
          ..write('frequency: $frequency, ')
          ..write('trigger: $trigger, ')
          ..write('action: $action, ')
          ..write('metric: $metric, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    lifeArea,
    frequency,
    trigger,
    action,
    metric,
    xpReward,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.name == this.name &&
          other.lifeArea == this.lifeArea &&
          other.frequency == this.frequency &&
          other.trigger == this.trigger &&
          other.action == this.action &&
          other.metric == this.metric &&
          other.xpReward == this.xpReward &&
          other.createdAt == this.createdAt);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> lifeArea;
  final Value<String> frequency;
  final Value<String?> trigger;
  final Value<String?> action;
  final Value<String?> metric;
  final Value<int> xpReward;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lifeArea = const Value.absent(),
    this.frequency = const Value.absent(),
    this.trigger = const Value.absent(),
    this.action = const Value.absent(),
    this.metric = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitsCompanion.insert({
    required String id,
    required String name,
    this.lifeArea = const Value.absent(),
    this.frequency = const Value.absent(),
    this.trigger = const Value.absent(),
    this.action = const Value.absent(),
    this.metric = const Value.absent(),
    this.xpReward = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Habit> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? lifeArea,
    Expression<String>? frequency,
    Expression<String>? trigger,
    Expression<String>? action,
    Expression<String>? metric,
    Expression<int>? xpReward,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lifeArea != null) 'life_area': lifeArea,
      if (frequency != null) 'frequency': frequency,
      if (trigger != null) 'trigger': trigger,
      if (action != null) 'action': action,
      if (metric != null) 'metric': metric,
      if (xpReward != null) 'xp_reward': xpReward,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? lifeArea,
    Value<String>? frequency,
    Value<String?>? trigger,
    Value<String?>? action,
    Value<String?>? metric,
    Value<int>? xpReward,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return HabitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lifeArea: lifeArea ?? this.lifeArea,
      frequency: frequency ?? this.frequency,
      trigger: trigger ?? this.trigger,
      action: action ?? this.action,
      metric: metric ?? this.metric,
      xpReward: xpReward ?? this.xpReward,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lifeArea.present) {
      map['life_area'] = Variable<String>(lifeArea.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(trigger.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (metric.present) {
      map['metric'] = Variable<String>(metric.value);
    }
    if (xpReward.present) {
      map['xp_reward'] = Variable<int>(xpReward.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lifeArea: $lifeArea, ')
          ..write('frequency: $frequency, ')
          ..write('trigger: $trigger, ')
          ..write('action: $action, ')
          ..write('metric: $metric, ')
          ..write('xpReward: $xpReward, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitLogsTable extends HabitLogs
    with TableInfo<$HabitLogsTable, HabitLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _habitIdMeta = const VerificationMeta(
    'habitId',
  );
  @override
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
    'habit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, habitId, date, isDone, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habit_id')) {
      context.handle(
        _habitIdMeta,
        habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      habitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habit_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $HabitLogsTable createAlias(String alias) {
    return $HabitLogsTable(attachedDatabase, alias);
  }
}

class HabitLog extends DataClass implements Insertable<HabitLog> {
  final String id;
  final String habitId;
  final DateTime date;
  final bool isDone;
  final DateTime createdAt;
  const HabitLog({
    required this.id,
    required this.habitId,
    required this.date,
    required this.isDone,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habit_id'] = Variable<String>(habitId);
    map['date'] = Variable<DateTime>(date);
    map['is_done'] = Variable<bool>(isDone);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitLogsCompanion toCompanion(bool nullToAbsent) {
    return HabitLogsCompanion(
      id: Value(id),
      habitId: Value(habitId),
      date: Value(date),
      isDone: Value(isDone),
      createdAt: Value(createdAt),
    );
  }

  factory HabitLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitLog(
      id: serializer.fromJson<String>(json['id']),
      habitId: serializer.fromJson<String>(json['habitId']),
      date: serializer.fromJson<DateTime>(json['date']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitId': serializer.toJson<String>(habitId),
      'date': serializer.toJson<DateTime>(date),
      'isDone': serializer.toJson<bool>(isDone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HabitLog copyWith({
    String? id,
    String? habitId,
    DateTime? date,
    bool? isDone,
    DateTime? createdAt,
  }) => HabitLog(
    id: id ?? this.id,
    habitId: habitId ?? this.habitId,
    date: date ?? this.date,
    isDone: isDone ?? this.isDone,
    createdAt: createdAt ?? this.createdAt,
  );
  HabitLog copyWithCompanion(HabitLogsCompanion data) {
    return HabitLog(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      date: data.date.present ? data.date.value : this.date,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitLog(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('isDone: $isDone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitId, date, isDone, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitLog &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.date == this.date &&
          other.isDone == this.isDone &&
          other.createdAt == this.createdAt);
}

class HabitLogsCompanion extends UpdateCompanion<HabitLog> {
  final Value<String> id;
  final Value<String> habitId;
  final Value<DateTime> date;
  final Value<bool> isDone;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const HabitLogsCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.date = const Value.absent(),
    this.isDone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitLogsCompanion.insert({
    required String id,
    required String habitId,
    required DateTime date,
    this.isDone = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitId = Value(habitId),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<HabitLog> custom({
    Expression<String>? id,
    Expression<String>? habitId,
    Expression<DateTime>? date,
    Expression<bool>? isDone,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (date != null) 'date': date,
      if (isDone != null) 'is_done': isDone,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? habitId,
    Value<DateTime>? date,
    Value<bool>? isDone,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return HabitLogsCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<String>(habitId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitLogsCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('isDone: $isDone, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LifeAreasTable extends LifeAreas
    with TableInfo<$LifeAreasTable, LifeArea> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LifeAreasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    colorHex,
    sortOrder,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'life_areas';
  @override
  VerificationContext validateIntegrity(
    Insertable<LifeArea> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LifeArea map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LifeArea(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LifeAreasTable createAlias(String alias) {
    return $LifeAreasTable(attachedDatabase, alias);
  }
}

class LifeArea extends DataClass implements Insertable<LifeArea> {
  final String id;
  final String name;
  final String? colorHex;
  final int sortOrder;
  final DateTime createdAt;
  const LifeArea({
    required this.id,
    required this.name,
    this.colorHex,
    required this.sortOrder,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LifeAreasCompanion toCompanion(bool nullToAbsent) {
    return LifeAreasCompanion(
      id: Value(id),
      name: Value(name),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
    );
  }

  factory LifeArea.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LifeArea(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String?>(colorHex),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LifeArea copyWith({
    String? id,
    String? name,
    Value<String?> colorHex = const Value.absent(),
    int? sortOrder,
    DateTime? createdAt,
  }) => LifeArea(
    id: id ?? this.id,
    name: name ?? this.name,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
  );
  LifeArea copyWithCompanion(LifeAreasCompanion data) {
    return LifeArea(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LifeArea(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorHex, sortOrder, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LifeArea &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorHex == this.colorHex &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt);
}

class LifeAreasCompanion extends UpdateCompanion<LifeArea> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> colorHex;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LifeAreasCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LifeAreasCompanion.insert({
    required String id,
    required String name,
    this.colorHex = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<LifeArea> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LifeAreasCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? colorHex,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return LifeAreasCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LifeAreasCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LifeAreaScoresTable extends LifeAreaScores
    with TableInfo<$LifeAreaScoresTable, LifeAreaScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LifeAreaScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lifeAreaIdMeta = const VerificationMeta(
    'lifeAreaId',
  );
  @override
  late final GeneratedColumn<String> lifeAreaId = GeneratedColumn<String>(
    'life_area_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekStartMeta = const VerificationMeta(
    'weekStart',
  );
  @override
  late final GeneratedColumn<DateTime> weekStart = GeneratedColumn<DateTime>(
    'week_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lifeAreaId,
    weekStart,
    score,
    source,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'life_area_scores';
  @override
  VerificationContext validateIntegrity(
    Insertable<LifeAreaScore> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('life_area_id')) {
      context.handle(
        _lifeAreaIdMeta,
        lifeAreaId.isAcceptableOrUnknown(
          data['life_area_id']!,
          _lifeAreaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lifeAreaIdMeta);
    }
    if (data.containsKey('week_start')) {
      context.handle(
        _weekStartMeta,
        weekStart.isAcceptableOrUnknown(data['week_start']!, _weekStartMeta),
      );
    } else if (isInserting) {
      context.missing(_weekStartMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LifeAreaScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LifeAreaScore(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      lifeAreaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_area_id'],
      )!,
      weekStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}week_start'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LifeAreaScoresTable createAlias(String alias) {
    return $LifeAreaScoresTable(attachedDatabase, alias);
  }
}

class LifeAreaScore extends DataClass implements Insertable<LifeAreaScore> {
  final String id;
  final String lifeAreaId;
  final DateTime weekStart;
  final int score;
  final String? source;
  final DateTime createdAt;
  const LifeAreaScore({
    required this.id,
    required this.lifeAreaId,
    required this.weekStart,
    required this.score,
    this.source,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['life_area_id'] = Variable<String>(lifeAreaId);
    map['week_start'] = Variable<DateTime>(weekStart);
    map['score'] = Variable<int>(score);
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LifeAreaScoresCompanion toCompanion(bool nullToAbsent) {
    return LifeAreaScoresCompanion(
      id: Value(id),
      lifeAreaId: Value(lifeAreaId),
      weekStart: Value(weekStart),
      score: Value(score),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      createdAt: Value(createdAt),
    );
  }

  factory LifeAreaScore.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LifeAreaScore(
      id: serializer.fromJson<String>(json['id']),
      lifeAreaId: serializer.fromJson<String>(json['lifeAreaId']),
      weekStart: serializer.fromJson<DateTime>(json['weekStart']),
      score: serializer.fromJson<int>(json['score']),
      source: serializer.fromJson<String?>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'lifeAreaId': serializer.toJson<String>(lifeAreaId),
      'weekStart': serializer.toJson<DateTime>(weekStart),
      'score': serializer.toJson<int>(score),
      'source': serializer.toJson<String?>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LifeAreaScore copyWith({
    String? id,
    String? lifeAreaId,
    DateTime? weekStart,
    int? score,
    Value<String?> source = const Value.absent(),
    DateTime? createdAt,
  }) => LifeAreaScore(
    id: id ?? this.id,
    lifeAreaId: lifeAreaId ?? this.lifeAreaId,
    weekStart: weekStart ?? this.weekStart,
    score: score ?? this.score,
    source: source.present ? source.value : this.source,
    createdAt: createdAt ?? this.createdAt,
  );
  LifeAreaScore copyWithCompanion(LifeAreaScoresCompanion data) {
    return LifeAreaScore(
      id: data.id.present ? data.id.value : this.id,
      lifeAreaId: data.lifeAreaId.present
          ? data.lifeAreaId.value
          : this.lifeAreaId,
      weekStart: data.weekStart.present ? data.weekStart.value : this.weekStart,
      score: data.score.present ? data.score.value : this.score,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LifeAreaScore(')
          ..write('id: $id, ')
          ..write('lifeAreaId: $lifeAreaId, ')
          ..write('weekStart: $weekStart, ')
          ..write('score: $score, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, lifeAreaId, weekStart, score, source, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LifeAreaScore &&
          other.id == this.id &&
          other.lifeAreaId == this.lifeAreaId &&
          other.weekStart == this.weekStart &&
          other.score == this.score &&
          other.source == this.source &&
          other.createdAt == this.createdAt);
}

class LifeAreaScoresCompanion extends UpdateCompanion<LifeAreaScore> {
  final Value<String> id;
  final Value<String> lifeAreaId;
  final Value<DateTime> weekStart;
  final Value<int> score;
  final Value<String?> source;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LifeAreaScoresCompanion({
    this.id = const Value.absent(),
    this.lifeAreaId = const Value.absent(),
    this.weekStart = const Value.absent(),
    this.score = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LifeAreaScoresCompanion.insert({
    required String id,
    required String lifeAreaId,
    required DateTime weekStart,
    required int score,
    this.source = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       lifeAreaId = Value(lifeAreaId),
       weekStart = Value(weekStart),
       score = Value(score),
       createdAt = Value(createdAt);
  static Insertable<LifeAreaScore> custom({
    Expression<String>? id,
    Expression<String>? lifeAreaId,
    Expression<DateTime>? weekStart,
    Expression<int>? score,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lifeAreaId != null) 'life_area_id': lifeAreaId,
      if (weekStart != null) 'week_start': weekStart,
      if (score != null) 'score': score,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LifeAreaScoresCompanion copyWith({
    Value<String>? id,
    Value<String>? lifeAreaId,
    Value<DateTime>? weekStart,
    Value<int>? score,
    Value<String?>? source,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return LifeAreaScoresCompanion(
      id: id ?? this.id,
      lifeAreaId: lifeAreaId ?? this.lifeAreaId,
      weekStart: weekStart ?? this.weekStart,
      score: score ?? this.score,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (lifeAreaId.present) {
      map['life_area_id'] = Variable<String>(lifeAreaId.value);
    }
    if (weekStart.present) {
      map['week_start'] = Variable<DateTime>(weekStart.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LifeAreaScoresCompanion(')
          ..write('id: $id, ')
          ..write('lifeAreaId: $lifeAreaId, ')
          ..write('weekStart: $weekStart, ')
          ..write('score: $score, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $XpLogsTable extends XpLogs with TableInfo<$XpLogsTable, XpLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $XpLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, amount, source, note, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'xp_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<XpLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  XpLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return XpLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $XpLogsTable createAlias(String alias) {
    return $XpLogsTable(attachedDatabase, alias);
  }
}

class XpLog extends DataClass implements Insertable<XpLog> {
  final String id;
  final int amount;
  final String source;
  final String? note;
  final DateTime createdAt;
  const XpLog({
    required this.id,
    required this.amount,
    required this.source,
    this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount'] = Variable<int>(amount);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  XpLogsCompanion toCompanion(bool nullToAbsent) {
    return XpLogsCompanion(
      id: Value(id),
      amount: Value(amount),
      source: Value(source),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory XpLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return XpLog(
      id: serializer.fromJson<String>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      source: serializer.fromJson<String>(json['source']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amount': serializer.toJson<int>(amount),
      'source': serializer.toJson<String>(source),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  XpLog copyWith({
    String? id,
    int? amount,
    String? source,
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
  }) => XpLog(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    source: source ?? this.source,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  XpLog copyWithCompanion(XpLogsCompanion data) {
    return XpLog(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      source: data.source.present ? data.source.value : this.source,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('XpLog(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('source: $source, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, source, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is XpLog &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.source == this.source &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class XpLogsCompanion extends UpdateCompanion<XpLog> {
  final Value<String> id;
  final Value<int> amount;
  final Value<String> source;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const XpLogsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.source = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  XpLogsCompanion.insert({
    required String id,
    required int amount,
    required String source,
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       amount = Value(amount),
       source = Value(source),
       createdAt = Value(createdAt);
  static Insertable<XpLog> custom({
    Expression<String>? id,
    Expression<int>? amount,
    Expression<String>? source,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (source != null) 'source': source,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  XpLogsCompanion copyWith({
    Value<String>? id,
    Value<int>? amount,
    Value<String>? source,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return XpLogsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      source: source ?? this.source,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('XpLogsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('source: $source, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LevelsTable extends Levels with TableInfo<$LevelsTable, Level> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requiredXpMeta = const VerificationMeta(
    'requiredXp',
  );
  @override
  late final GeneratedColumn<int> requiredXp = GeneratedColumn<int>(
    'required_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, level, title, requiredXp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'levels';
  @override
  VerificationContext validateIntegrity(
    Insertable<Level> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('required_xp')) {
      context.handle(
        _requiredXpMeta,
        requiredXp.isAcceptableOrUnknown(data['required_xp']!, _requiredXpMeta),
      );
    } else if (isInserting) {
      context.missing(_requiredXpMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Level map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Level(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      requiredXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}required_xp'],
      )!,
    );
  }

  @override
  $LevelsTable createAlias(String alias) {
    return $LevelsTable(attachedDatabase, alias);
  }
}

class Level extends DataClass implements Insertable<Level> {
  final String id;
  final int level;
  final String title;
  final int requiredXp;
  const Level({
    required this.id,
    required this.level,
    required this.title,
    required this.requiredXp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['level'] = Variable<int>(level);
    map['title'] = Variable<String>(title);
    map['required_xp'] = Variable<int>(requiredXp);
    return map;
  }

  LevelsCompanion toCompanion(bool nullToAbsent) {
    return LevelsCompanion(
      id: Value(id),
      level: Value(level),
      title: Value(title),
      requiredXp: Value(requiredXp),
    );
  }

  factory Level.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Level(
      id: serializer.fromJson<String>(json['id']),
      level: serializer.fromJson<int>(json['level']),
      title: serializer.fromJson<String>(json['title']),
      requiredXp: serializer.fromJson<int>(json['requiredXp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'level': serializer.toJson<int>(level),
      'title': serializer.toJson<String>(title),
      'requiredXp': serializer.toJson<int>(requiredXp),
    };
  }

  Level copyWith({String? id, int? level, String? title, int? requiredXp}) =>
      Level(
        id: id ?? this.id,
        level: level ?? this.level,
        title: title ?? this.title,
        requiredXp: requiredXp ?? this.requiredXp,
      );
  Level copyWithCompanion(LevelsCompanion data) {
    return Level(
      id: data.id.present ? data.id.value : this.id,
      level: data.level.present ? data.level.value : this.level,
      title: data.title.present ? data.title.value : this.title,
      requiredXp: data.requiredXp.present
          ? data.requiredXp.value
          : this.requiredXp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Level(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('title: $title, ')
          ..write('requiredXp: $requiredXp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, level, title, requiredXp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Level &&
          other.id == this.id &&
          other.level == this.level &&
          other.title == this.title &&
          other.requiredXp == this.requiredXp);
}

class LevelsCompanion extends UpdateCompanion<Level> {
  final Value<String> id;
  final Value<int> level;
  final Value<String> title;
  final Value<int> requiredXp;
  final Value<int> rowid;
  const LevelsCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.title = const Value.absent(),
    this.requiredXp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LevelsCompanion.insert({
    required String id,
    required int level,
    required String title,
    required int requiredXp,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       level = Value(level),
       title = Value(title),
       requiredXp = Value(requiredXp);
  static Insertable<Level> custom({
    Expression<String>? id,
    Expression<int>? level,
    Expression<String>? title,
    Expression<int>? requiredXp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (title != null) 'title': title,
      if (requiredXp != null) 'required_xp': requiredXp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LevelsCompanion copyWith({
    Value<String>? id,
    Value<int>? level,
    Value<String>? title,
    Value<int>? requiredXp,
    Value<int>? rowid,
  }) {
    return LevelsCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      title: title ?? this.title,
      requiredXp: requiredXp ?? this.requiredXp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (requiredXp.present) {
      map['required_xp'] = Variable<int>(requiredXp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelsCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('title: $title, ')
          ..write('requiredXp: $requiredXp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, Achievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _xpRewardMeta = const VerificationMeta(
    'xpReward',
  );
  @override
  late final GeneratedColumn<int> xpReward = GeneratedColumn<int>(
    'xp_reward',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, icon, xpReward];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Achievement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('xp_reward')) {
      context.handle(
        _xpRewardMeta,
        xpReward.isAcceptableOrUnknown(data['xp_reward']!, _xpRewardMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Achievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Achievement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      xpReward: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_reward'],
      )!,
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }
}

class Achievement extends DataClass implements Insertable<Achievement> {
  final String id;
  final String name;
  final String description;
  final String? icon;
  final int xpReward;
  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    this.icon,
    required this.xpReward,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['xp_reward'] = Variable<int>(xpReward);
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      xpReward: Value(xpReward),
    );
  }

  factory Achievement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Achievement(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      icon: serializer.fromJson<String?>(json['icon']),
      xpReward: serializer.fromJson<int>(json['xpReward']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<String?>(icon),
      'xpReward': serializer.toJson<int>(xpReward),
    };
  }

  Achievement copyWith({
    String? id,
    String? name,
    String? description,
    Value<String?> icon = const Value.absent(),
    int? xpReward,
  }) => Achievement(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    icon: icon.present ? icon.value : this.icon,
    xpReward: xpReward ?? this.xpReward,
  );
  Achievement copyWithCompanion(AchievementsCompanion data) {
    return Achievement(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      icon: data.icon.present ? data.icon.value : this.icon,
      xpReward: data.xpReward.present ? data.xpReward.value : this.xpReward,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Achievement(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('xpReward: $xpReward')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, icon, xpReward);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achievement &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.xpReward == this.xpReward);
}

class AchievementsCompanion extends UpdateCompanion<Achievement> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String?> icon;
  final Value<int> xpReward;
  final Value<int> rowid;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementsCompanion.insert({
    required String id,
    required String name,
    required String description,
    this.icon = const Value.absent(),
    this.xpReward = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description);
  static Insertable<Achievement> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<int>? xpReward,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (xpReward != null) 'xp_reward': xpReward,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String?>? icon,
    Value<int>? xpReward,
    Value<int>? rowid,
  }) {
    return AchievementsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      xpReward: xpReward ?? this.xpReward,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (xpReward.present) {
      map['xp_reward'] = Variable<int>(xpReward.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('xpReward: $xpReward, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AchievementUnlocksTable extends AchievementUnlocks
    with TableInfo<$AchievementUnlocksTable, AchievementUnlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementUnlocksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _achievementIdMeta = const VerificationMeta(
    'achievementId',
  );
  @override
  late final GeneratedColumn<String> achievementId = GeneratedColumn<String>(
    'achievement_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, achievementId, unlockedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievement_unlocks';
  @override
  VerificationContext validateIntegrity(
    Insertable<AchievementUnlock> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('achievement_id')) {
      context.handle(
        _achievementIdMeta,
        achievementId.isAcceptableOrUnknown(
          data['achievement_id']!,
          _achievementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_achievementIdMeta);
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_unlockedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AchievementUnlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AchievementUnlock(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      achievementId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement_id'],
      )!,
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      )!,
    );
  }

  @override
  $AchievementUnlocksTable createAlias(String alias) {
    return $AchievementUnlocksTable(attachedDatabase, alias);
  }
}

class AchievementUnlock extends DataClass
    implements Insertable<AchievementUnlock> {
  final String id;
  final String achievementId;
  final DateTime unlockedAt;
  const AchievementUnlock({
    required this.id,
    required this.achievementId,
    required this.unlockedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['achievement_id'] = Variable<String>(achievementId);
    map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    return map;
  }

  AchievementUnlocksCompanion toCompanion(bool nullToAbsent) {
    return AchievementUnlocksCompanion(
      id: Value(id),
      achievementId: Value(achievementId),
      unlockedAt: Value(unlockedAt),
    );
  }

  factory AchievementUnlock.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AchievementUnlock(
      id: serializer.fromJson<String>(json['id']),
      achievementId: serializer.fromJson<String>(json['achievementId']),
      unlockedAt: serializer.fromJson<DateTime>(json['unlockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'achievementId': serializer.toJson<String>(achievementId),
      'unlockedAt': serializer.toJson<DateTime>(unlockedAt),
    };
  }

  AchievementUnlock copyWith({
    String? id,
    String? achievementId,
    DateTime? unlockedAt,
  }) => AchievementUnlock(
    id: id ?? this.id,
    achievementId: achievementId ?? this.achievementId,
    unlockedAt: unlockedAt ?? this.unlockedAt,
  );
  AchievementUnlock copyWithCompanion(AchievementUnlocksCompanion data) {
    return AchievementUnlock(
      id: data.id.present ? data.id.value : this.id,
      achievementId: data.achievementId.present
          ? data.achievementId.value
          : this.achievementId,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AchievementUnlock(')
          ..write('id: $id, ')
          ..write('achievementId: $achievementId, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, achievementId, unlockedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AchievementUnlock &&
          other.id == this.id &&
          other.achievementId == this.achievementId &&
          other.unlockedAt == this.unlockedAt);
}

class AchievementUnlocksCompanion extends UpdateCompanion<AchievementUnlock> {
  final Value<String> id;
  final Value<String> achievementId;
  final Value<DateTime> unlockedAt;
  final Value<int> rowid;
  const AchievementUnlocksCompanion({
    this.id = const Value.absent(),
    this.achievementId = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementUnlocksCompanion.insert({
    required String id,
    required String achievementId,
    required DateTime unlockedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       achievementId = Value(achievementId),
       unlockedAt = Value(unlockedAt);
  static Insertable<AchievementUnlock> custom({
    Expression<String>? id,
    Expression<String>? achievementId,
    Expression<DateTime>? unlockedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (achievementId != null) 'achievement_id': achievementId,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementUnlocksCompanion copyWith({
    Value<String>? id,
    Value<String>? achievementId,
    Value<DateTime>? unlockedAt,
    Value<int>? rowid,
  }) {
    return AchievementUnlocksCompanion(
      id: id ?? this.id,
      achievementId: achievementId ?? this.achievementId,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (achievementId.present) {
      map['achievement_id'] = Variable<String>(achievementId.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementUnlocksCompanion(')
          ..write('id: $id, ')
          ..write('achievementId: $achievementId, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserPreferencesTable extends UserPreferences
    with TableInfo<$UserPreferencesTable, UserPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserPreference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserPreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPreference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserPreferencesTable createAlias(String alias) {
    return $UserPreferencesTable(attachedDatabase, alias);
  }
}

class UserPreference extends DataClass implements Insertable<UserPreference> {
  final String id;
  final String key;
  final String value;
  final DateTime updatedAt;
  const UserPreference({
    required this.id,
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserPreferencesCompanion toCompanion(bool nullToAbsent) {
    return UserPreferencesCompanion(
      id: Value(id),
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserPreference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPreference(
      id: serializer.fromJson<String>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserPreference copyWith({
    String? id,
    String? key,
    String? value,
    DateTime? updatedAt,
  }) => UserPreference(
    id: id ?? this.id,
    key: key ?? this.key,
    value: value ?? this.value,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserPreference copyWithCompanion(UserPreferencesCompanion data) {
    return UserPreference(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserPreference(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPreference &&
          other.id == this.id &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class UserPreferencesCompanion extends UpdateCompanion<UserPreference> {
  final Value<String> id;
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserPreferencesCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPreferencesCompanion.insert({
    required String id,
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<UserPreference> custom({
    Expression<String>? id,
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPreferencesCompanion copyWith({
    Value<String>? id,
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UserPreferencesCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiHistoryEntriesTable extends AiHistoryEntries
    with TableInfo<$AiHistoryEntriesTable, AiHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userMessageMeta = const VerificationMeta(
    'userMessage',
  );
  @override
  late final GeneratedColumn<String> userMessage = GeneratedColumn<String>(
    'user_message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aiResponseMeta = const VerificationMeta(
    'aiResponse',
  );
  @override
  late final GeneratedColumn<String> aiResponse = GeneratedColumn<String>(
    'ai_response',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moduleMeta = const VerificationMeta('module');
  @override
  late final GeneratedColumn<String> module = GeneratedColumn<String>(
    'module',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metadataJsonMeta = const VerificationMeta(
    'metadataJson',
  );
  @override
  late final GeneratedColumn<String> metadataJson = GeneratedColumn<String>(
    'metadata_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userMessage,
    aiResponse,
    actionType,
    module,
    metadataJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_history_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiHistoryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_message')) {
      context.handle(
        _userMessageMeta,
        userMessage.isAcceptableOrUnknown(
          data['user_message']!,
          _userMessageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userMessageMeta);
    }
    if (data.containsKey('ai_response')) {
      context.handle(
        _aiResponseMeta,
        aiResponse.isAcceptableOrUnknown(data['ai_response']!, _aiResponseMeta),
      );
    } else if (isInserting) {
      context.missing(_aiResponseMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('module')) {
      context.handle(
        _moduleMeta,
        module.isAcceptableOrUnknown(data['module']!, _moduleMeta),
      );
    } else if (isInserting) {
      context.missing(_moduleMeta);
    }
    if (data.containsKey('metadata_json')) {
      context.handle(
        _metadataJsonMeta,
        metadataJson.isAcceptableOrUnknown(
          data['metadata_json']!,
          _metadataJsonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiHistoryEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_message'],
      )!,
      aiResponse: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ai_response'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_type'],
      )!,
      module: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module'],
      )!,
      metadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AiHistoryEntriesTable createAlias(String alias) {
    return $AiHistoryEntriesTable(attachedDatabase, alias);
  }
}

class AiHistoryEntry extends DataClass implements Insertable<AiHistoryEntry> {
  final String id;
  final String userMessage;
  final String aiResponse;
  final String actionType;
  final String module;
  final String? metadataJson;
  final DateTime createdAt;
  const AiHistoryEntry({
    required this.id,
    required this.userMessage,
    required this.aiResponse,
    required this.actionType,
    required this.module,
    this.metadataJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_message'] = Variable<String>(userMessage);
    map['ai_response'] = Variable<String>(aiResponse);
    map['action_type'] = Variable<String>(actionType);
    map['module'] = Variable<String>(module);
    if (!nullToAbsent || metadataJson != null) {
      map['metadata_json'] = Variable<String>(metadataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AiHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return AiHistoryEntriesCompanion(
      id: Value(id),
      userMessage: Value(userMessage),
      aiResponse: Value(aiResponse),
      actionType: Value(actionType),
      module: Value(module),
      metadataJson: metadataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(metadataJson),
      createdAt: Value(createdAt),
    );
  }

  factory AiHistoryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiHistoryEntry(
      id: serializer.fromJson<String>(json['id']),
      userMessage: serializer.fromJson<String>(json['userMessage']),
      aiResponse: serializer.fromJson<String>(json['aiResponse']),
      actionType: serializer.fromJson<String>(json['actionType']),
      module: serializer.fromJson<String>(json['module']),
      metadataJson: serializer.fromJson<String?>(json['metadataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userMessage': serializer.toJson<String>(userMessage),
      'aiResponse': serializer.toJson<String>(aiResponse),
      'actionType': serializer.toJson<String>(actionType),
      'module': serializer.toJson<String>(module),
      'metadataJson': serializer.toJson<String?>(metadataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AiHistoryEntry copyWith({
    String? id,
    String? userMessage,
    String? aiResponse,
    String? actionType,
    String? module,
    Value<String?> metadataJson = const Value.absent(),
    DateTime? createdAt,
  }) => AiHistoryEntry(
    id: id ?? this.id,
    userMessage: userMessage ?? this.userMessage,
    aiResponse: aiResponse ?? this.aiResponse,
    actionType: actionType ?? this.actionType,
    module: module ?? this.module,
    metadataJson: metadataJson.present ? metadataJson.value : this.metadataJson,
    createdAt: createdAt ?? this.createdAt,
  );
  AiHistoryEntry copyWithCompanion(AiHistoryEntriesCompanion data) {
    return AiHistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      userMessage: data.userMessage.present
          ? data.userMessage.value
          : this.userMessage,
      aiResponse: data.aiResponse.present
          ? data.aiResponse.value
          : this.aiResponse,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      module: data.module.present ? data.module.value : this.module,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiHistoryEntry(')
          ..write('id: $id, ')
          ..write('userMessage: $userMessage, ')
          ..write('aiResponse: $aiResponse, ')
          ..write('actionType: $actionType, ')
          ..write('module: $module, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userMessage,
    aiResponse,
    actionType,
    module,
    metadataJson,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiHistoryEntry &&
          other.id == this.id &&
          other.userMessage == this.userMessage &&
          other.aiResponse == this.aiResponse &&
          other.actionType == this.actionType &&
          other.module == this.module &&
          other.metadataJson == this.metadataJson &&
          other.createdAt == this.createdAt);
}

class AiHistoryEntriesCompanion extends UpdateCompanion<AiHistoryEntry> {
  final Value<String> id;
  final Value<String> userMessage;
  final Value<String> aiResponse;
  final Value<String> actionType;
  final Value<String> module;
  final Value<String?> metadataJson;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AiHistoryEntriesCompanion({
    this.id = const Value.absent(),
    this.userMessage = const Value.absent(),
    this.aiResponse = const Value.absent(),
    this.actionType = const Value.absent(),
    this.module = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AiHistoryEntriesCompanion.insert({
    required String id,
    required String userMessage,
    required String aiResponse,
    required String actionType,
    required String module,
    this.metadataJson = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userMessage = Value(userMessage),
       aiResponse = Value(aiResponse),
       actionType = Value(actionType),
       module = Value(module),
       createdAt = Value(createdAt);
  static Insertable<AiHistoryEntry> custom({
    Expression<String>? id,
    Expression<String>? userMessage,
    Expression<String>? aiResponse,
    Expression<String>? actionType,
    Expression<String>? module,
    Expression<String>? metadataJson,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userMessage != null) 'user_message': userMessage,
      if (aiResponse != null) 'ai_response': aiResponse,
      if (actionType != null) 'action_type': actionType,
      if (module != null) 'module': module,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AiHistoryEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? userMessage,
    Value<String>? aiResponse,
    Value<String>? actionType,
    Value<String>? module,
    Value<String?>? metadataJson,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AiHistoryEntriesCompanion(
      id: id ?? this.id,
      userMessage: userMessage ?? this.userMessage,
      aiResponse: aiResponse ?? this.aiResponse,
      actionType: actionType ?? this.actionType,
      module: module ?? this.module,
      metadataJson: metadataJson ?? this.metadataJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userMessage.present) {
      map['user_message'] = Variable<String>(userMessage.value);
    }
    if (aiResponse.present) {
      map['ai_response'] = Variable<String>(aiResponse.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (module.present) {
      map['module'] = Variable<String>(module.value);
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(metadataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiHistoryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userMessage: $userMessage, ')
          ..write('aiResponse: $aiResponse, ')
          ..write('actionType: $actionType, ')
          ..write('module: $module, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiNotesTable extends AiNotes with TableInfo<$AiNotesTable, AiNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiNote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiNote(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AiNotesTable createAlias(String alias) {
    return $AiNotesTable(attachedDatabase, alias);
  }
}

class AiNote extends DataClass implements Insertable<AiNote> {
  final String id;
  final String content;
  final DateTime createdAt;
  const AiNote({
    required this.id,
    required this.content,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AiNotesCompanion toCompanion(bool nullToAbsent) {
    return AiNotesCompanion(
      id: Value(id),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory AiNote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiNote(
      id: serializer.fromJson<String>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AiNote copyWith({String? id, String? content, DateTime? createdAt}) => AiNote(
    id: id ?? this.id,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );
  AiNote copyWithCompanion(AiNotesCompanion data) {
    return AiNote(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiNote(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiNote &&
          other.id == this.id &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class AiNotesCompanion extends UpdateCompanion<AiNote> {
  final Value<String> id;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AiNotesCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AiNotesCompanion.insert({
    required String id,
    required String content,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       content = Value(content),
       createdAt = Value(createdAt);
  static Insertable<AiNote> custom({
    Expression<String>? id,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AiNotesCompanion copyWith({
    Value<String>? id,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AiNotesCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiNotesCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RoutineTemplatesTable routineTemplates = $RoutineTemplatesTable(
    this,
  );
  late final $RoutineEventsTable routineEvents = $RoutineEventsTable(this);
  late final $RoutineOverridesTable routineOverrides = $RoutineOverridesTable(
    this,
  );
  late final $RoutineEventLogsTable routineEventLogs = $RoutineEventLogsTable(
    this,
  );
  late final $DailyMissionsTable dailyMissions = $DailyMissionsTable(this);
  late final $MissionTasksTable missionTasks = $MissionTasksTable(this);
  late final $MissionLogsTable missionLogs = $MissionLogsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $TaskCategoriesTable taskCategories = $TaskCategoriesTable(this);
  late final $TaskLogsTable taskLogs = $TaskLogsTable(this);
  late final $FoodsTable foods = $FoodsTable(this);
  late final $FoodLogsTable foodLogs = $FoodLogsTable(this);
  late final $WaterLogsTable waterLogs = $WaterLogsTable(this);
  late final $NutritionGoalsTable nutritionGoals = $NutritionGoalsTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $WorkoutSessionsTable workoutSessions = $WorkoutSessionsTable(
    this,
  );
  late final $WorkoutSessionStepsTable workoutSessionSteps =
      $WorkoutSessionStepsTable(this);
  late final $WorkoutLogsTable workoutLogs = $WorkoutLogsTable(this);
  late final $StudySubjectsTable studySubjects = $StudySubjectsTable(this);
  late final $StudyUnitsTable studyUnits = $StudyUnitsTable(this);
  late final $StudySessionsTable studySessions = $StudySessionsTable(this);
  late final $StudyReviewsTable studyReviews = $StudyReviewsTable(this);
  late final $FinanceCategoriesTable financeCategories =
      $FinanceCategoriesTable(this);
  late final $FinanceTransactionsTable financeTransactions =
      $FinanceTransactionsTable(this);
  late final $FixedExpensesTable fixedExpenses = $FixedExpensesTable(this);
  late final $FinancialGoalsTable financialGoals = $FinancialGoalsTable(this);
  late final $ReceiptImagesTable receiptImages = $ReceiptImagesTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $ProjectTasksTable projectTasks = $ProjectTasksTable(this);
  late final $ProjectNotesTable projectNotes = $ProjectNotesTable(this);
  late final $ProjectTimeLogsTable projectTimeLogs = $ProjectTimeLogsTable(
    this,
  );
  late final $DiaryEntriesTable diaryEntries = $DiaryEntriesTable(this);
  late final $MoodLogsTable moodLogs = $MoodLogsTable(this);
  late final $EnergyLogsTable energyLogs = $EnergyLogsTable(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $HabitLogsTable habitLogs = $HabitLogsTable(this);
  late final $LifeAreasTable lifeAreas = $LifeAreasTable(this);
  late final $LifeAreaScoresTable lifeAreaScores = $LifeAreaScoresTable(this);
  late final $XpLogsTable xpLogs = $XpLogsTable(this);
  late final $LevelsTable levels = $LevelsTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $AchievementUnlocksTable achievementUnlocks =
      $AchievementUnlocksTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $UserPreferencesTable userPreferences = $UserPreferencesTable(
    this,
  );
  late final $AiHistoryEntriesTable aiHistoryEntries = $AiHistoryEntriesTable(
    this,
  );
  late final $AiNotesTable aiNotes = $AiNotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    routineTemplates,
    routineEvents,
    routineOverrides,
    routineEventLogs,
    dailyMissions,
    missionTasks,
    missionLogs,
    tasks,
    taskCategories,
    taskLogs,
    foods,
    foodLogs,
    waterLogs,
    nutritionGoals,
    exercises,
    workouts,
    workoutSessions,
    workoutSessionSteps,
    workoutLogs,
    studySubjects,
    studyUnits,
    studySessions,
    studyReviews,
    financeCategories,
    financeTransactions,
    fixedExpenses,
    financialGoals,
    receiptImages,
    projects,
    projectTasks,
    projectNotes,
    projectTimeLogs,
    diaryEntries,
    moodLogs,
    energyLogs,
    habits,
    habitLogs,
    lifeAreas,
    lifeAreaScores,
    xpLogs,
    levels,
    achievements,
    achievementUnlocks,
    appSettings,
    userPreferences,
    aiHistoryEntries,
    aiNotes,
  ];
}

typedef $$RoutineTemplatesTableCreateCompanionBuilder =
    RoutineTemplatesCompanion Function({
      required String id,
      required String name,
      required int weekday,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$RoutineTemplatesTableUpdateCompanionBuilder =
    RoutineTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> weekday,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$RoutineTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineTemplatesTable> {
  $$RoutineTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutineTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineTemplatesTable> {
  $$RoutineTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutineTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineTemplatesTable> {
  $$RoutineTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RoutineTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineTemplatesTable,
          RoutineTemplate,
          $$RoutineTemplatesTableFilterComposer,
          $$RoutineTemplatesTableOrderingComposer,
          $$RoutineTemplatesTableAnnotationComposer,
          $$RoutineTemplatesTableCreateCompanionBuilder,
          $$RoutineTemplatesTableUpdateCompanionBuilder,
          (
            RoutineTemplate,
            BaseReferences<
              _$AppDatabase,
              $RoutineTemplatesTable,
              RoutineTemplate
            >,
          ),
          RoutineTemplate,
          PrefetchHooks Function()
        > {
  $$RoutineTemplatesTableTableManager(
    _$AppDatabase db,
    $RoutineTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> weekday = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineTemplatesCompanion(
                id: id,
                name: name,
                weekday: weekday,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int weekday,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutineTemplatesCompanion.insert(
                id: id,
                name: name,
                weekday: weekday,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutineTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineTemplatesTable,
      RoutineTemplate,
      $$RoutineTemplatesTableFilterComposer,
      $$RoutineTemplatesTableOrderingComposer,
      $$RoutineTemplatesTableAnnotationComposer,
      $$RoutineTemplatesTableCreateCompanionBuilder,
      $$RoutineTemplatesTableUpdateCompanionBuilder,
      (
        RoutineTemplate,
        BaseReferences<_$AppDatabase, $RoutineTemplatesTable, RoutineTemplate>,
      ),
      RoutineTemplate,
      PrefetchHooks Function()
    >;
typedef $$RoutineEventsTableCreateCompanionBuilder =
    RoutineEventsCompanion Function({
      required String id,
      Value<String?> templateId,
      required String title,
      required String type,
      required int weekday,
      required int startMinutes,
      required int endMinutes,
      Value<String> areaTags,
      Value<bool> notify,
      Value<String?> description,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$RoutineEventsTableUpdateCompanionBuilder =
    RoutineEventsCompanion Function({
      Value<String> id,
      Value<String?> templateId,
      Value<String> title,
      Value<String> type,
      Value<int> weekday,
      Value<int> startMinutes,
      Value<int> endMinutes,
      Value<String> areaTags,
      Value<bool> notify,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$RoutineEventsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineEventsTable> {
  $$RoutineEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areaTags => $composableBuilder(
    column: $table.areaTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notify => $composableBuilder(
    column: $table.notify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutineEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineEventsTable> {
  $$RoutineEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areaTags => $composableBuilder(
    column: $table.areaTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notify => $composableBuilder(
    column: $table.notify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutineEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineEventsTable> {
  $$RoutineEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get areaTags =>
      $composableBuilder(column: $table.areaTags, builder: (column) => column);

  GeneratedColumn<bool> get notify =>
      $composableBuilder(column: $table.notify, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RoutineEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineEventsTable,
          RoutineEvent,
          $$RoutineEventsTableFilterComposer,
          $$RoutineEventsTableOrderingComposer,
          $$RoutineEventsTableAnnotationComposer,
          $$RoutineEventsTableCreateCompanionBuilder,
          $$RoutineEventsTableUpdateCompanionBuilder,
          (
            RoutineEvent,
            BaseReferences<_$AppDatabase, $RoutineEventsTable, RoutineEvent>,
          ),
          RoutineEvent,
          PrefetchHooks Function()
        > {
  $$RoutineEventsTableTableManager(_$AppDatabase db, $RoutineEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> templateId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> weekday = const Value.absent(),
                Value<int> startMinutes = const Value.absent(),
                Value<int> endMinutes = const Value.absent(),
                Value<String> areaTags = const Value.absent(),
                Value<bool> notify = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineEventsCompanion(
                id: id,
                templateId: templateId,
                title: title,
                type: type,
                weekday: weekday,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                areaTags: areaTags,
                notify: notify,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> templateId = const Value.absent(),
                required String title,
                required String type,
                required int weekday,
                required int startMinutes,
                required int endMinutes,
                Value<String> areaTags = const Value.absent(),
                Value<bool> notify = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutineEventsCompanion.insert(
                id: id,
                templateId: templateId,
                title: title,
                type: type,
                weekday: weekday,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                areaTags: areaTags,
                notify: notify,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutineEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineEventsTable,
      RoutineEvent,
      $$RoutineEventsTableFilterComposer,
      $$RoutineEventsTableOrderingComposer,
      $$RoutineEventsTableAnnotationComposer,
      $$RoutineEventsTableCreateCompanionBuilder,
      $$RoutineEventsTableUpdateCompanionBuilder,
      (
        RoutineEvent,
        BaseReferences<_$AppDatabase, $RoutineEventsTable, RoutineEvent>,
      ),
      RoutineEvent,
      PrefetchHooks Function()
    >;
typedef $$RoutineOverridesTableCreateCompanionBuilder =
    RoutineOverridesCompanion Function({
      required String id,
      Value<String?> routineEventId,
      required DateTime date,
      Value<String> scope,
      Value<String?> title,
      Value<int?> startMinutes,
      Value<int?> endMinutes,
      Value<bool> isDeleted,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$RoutineOverridesTableUpdateCompanionBuilder =
    RoutineOverridesCompanion Function({
      Value<String> id,
      Value<String?> routineEventId,
      Value<DateTime> date,
      Value<String> scope,
      Value<String?> title,
      Value<int?> startMinutes,
      Value<int?> endMinutes,
      Value<bool> isDeleted,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$RoutineOverridesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineOverridesTable> {
  $$RoutineOverridesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routineEventId => $composableBuilder(
    column: $table.routineEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutineOverridesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineOverridesTable> {
  $$RoutineOverridesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routineEventId => $composableBuilder(
    column: $table.routineEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutineOverridesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineOverridesTable> {
  $$RoutineOverridesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get routineEventId => $composableBuilder(
    column: $table.routineEventId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RoutineOverridesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineOverridesTable,
          RoutineOverride,
          $$RoutineOverridesTableFilterComposer,
          $$RoutineOverridesTableOrderingComposer,
          $$RoutineOverridesTableAnnotationComposer,
          $$RoutineOverridesTableCreateCompanionBuilder,
          $$RoutineOverridesTableUpdateCompanionBuilder,
          (
            RoutineOverride,
            BaseReferences<
              _$AppDatabase,
              $RoutineOverridesTable,
              RoutineOverride
            >,
          ),
          RoutineOverride,
          PrefetchHooks Function()
        > {
  $$RoutineOverridesTableTableManager(
    _$AppDatabase db,
    $RoutineOverridesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineOverridesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineOverridesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineOverridesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> routineEventId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<int?> startMinutes = const Value.absent(),
                Value<int?> endMinutes = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineOverridesCompanion(
                id: id,
                routineEventId: routineEventId,
                date: date,
                scope: scope,
                title: title,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                isDeleted: isDeleted,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> routineEventId = const Value.absent(),
                required DateTime date,
                Value<String> scope = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<int?> startMinutes = const Value.absent(),
                Value<int?> endMinutes = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutineOverridesCompanion.insert(
                id: id,
                routineEventId: routineEventId,
                date: date,
                scope: scope,
                title: title,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                isDeleted: isDeleted,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutineOverridesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineOverridesTable,
      RoutineOverride,
      $$RoutineOverridesTableFilterComposer,
      $$RoutineOverridesTableOrderingComposer,
      $$RoutineOverridesTableAnnotationComposer,
      $$RoutineOverridesTableCreateCompanionBuilder,
      $$RoutineOverridesTableUpdateCompanionBuilder,
      (
        RoutineOverride,
        BaseReferences<_$AppDatabase, $RoutineOverridesTable, RoutineOverride>,
      ),
      RoutineOverride,
      PrefetchHooks Function()
    >;
typedef $$RoutineEventLogsTableCreateCompanionBuilder =
    RoutineEventLogsCompanion Function({
      required String id,
      required String routineEventId,
      required DateTime date,
      required String status,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$RoutineEventLogsTableUpdateCompanionBuilder =
    RoutineEventLogsCompanion Function({
      Value<String> id,
      Value<String> routineEventId,
      Value<DateTime> date,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$RoutineEventLogsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineEventLogsTable> {
  $$RoutineEventLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routineEventId => $composableBuilder(
    column: $table.routineEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutineEventLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineEventLogsTable> {
  $$RoutineEventLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routineEventId => $composableBuilder(
    column: $table.routineEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutineEventLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineEventLogsTable> {
  $$RoutineEventLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get routineEventId => $composableBuilder(
    column: $table.routineEventId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RoutineEventLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineEventLogsTable,
          RoutineEventLog,
          $$RoutineEventLogsTableFilterComposer,
          $$RoutineEventLogsTableOrderingComposer,
          $$RoutineEventLogsTableAnnotationComposer,
          $$RoutineEventLogsTableCreateCompanionBuilder,
          $$RoutineEventLogsTableUpdateCompanionBuilder,
          (
            RoutineEventLog,
            BaseReferences<
              _$AppDatabase,
              $RoutineEventLogsTable,
              RoutineEventLog
            >,
          ),
          RoutineEventLog,
          PrefetchHooks Function()
        > {
  $$RoutineEventLogsTableTableManager(
    _$AppDatabase db,
    $RoutineEventLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineEventLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineEventLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineEventLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> routineEventId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineEventLogsCompanion(
                id: id,
                routineEventId: routineEventId,
                date: date,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String routineEventId,
                required DateTime date,
                required String status,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutineEventLogsCompanion.insert(
                id: id,
                routineEventId: routineEventId,
                date: date,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutineEventLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineEventLogsTable,
      RoutineEventLog,
      $$RoutineEventLogsTableFilterComposer,
      $$RoutineEventLogsTableOrderingComposer,
      $$RoutineEventLogsTableAnnotationComposer,
      $$RoutineEventLogsTableCreateCompanionBuilder,
      $$RoutineEventLogsTableUpdateCompanionBuilder,
      (
        RoutineEventLog,
        BaseReferences<_$AppDatabase, $RoutineEventLogsTable, RoutineEventLog>,
      ),
      RoutineEventLog,
      PrefetchHooks Function()
    >;
typedef $$DailyMissionsTableCreateCompanionBuilder =
    DailyMissionsCompanion Function({
      required String id,
      required DateTime date,
      required String title,
      Value<String?> description,
      Value<String> status,
      Value<int> xpReward,
      required DateTime createdAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$DailyMissionsTableUpdateCompanionBuilder =
    DailyMissionsCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<String> title,
      Value<String?> description,
      Value<String> status,
      Value<int> xpReward,
      Value<DateTime> createdAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$DailyMissionsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyMissionsTable> {
  $$DailyMissionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyMissionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyMissionsTable> {
  $$DailyMissionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyMissionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyMissionsTable> {
  $$DailyMissionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get xpReward =>
      $composableBuilder(column: $table.xpReward, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$DailyMissionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyMissionsTable,
          DailyMission,
          $$DailyMissionsTableFilterComposer,
          $$DailyMissionsTableOrderingComposer,
          $$DailyMissionsTableAnnotationComposer,
          $$DailyMissionsTableCreateCompanionBuilder,
          $$DailyMissionsTableUpdateCompanionBuilder,
          (
            DailyMission,
            BaseReferences<_$AppDatabase, $DailyMissionsTable, DailyMission>,
          ),
          DailyMission,
          PrefetchHooks Function()
        > {
  $$DailyMissionsTableTableManager(_$AppDatabase db, $DailyMissionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyMissionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyMissionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyMissionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyMissionsCompanion(
                id: id,
                date: date,
                title: title,
                description: description,
                status: status,
                xpReward: xpReward,
                createdAt: createdAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyMissionsCompanion.insert(
                id: id,
                date: date,
                title: title,
                description: description,
                status: status,
                xpReward: xpReward,
                createdAt: createdAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyMissionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyMissionsTable,
      DailyMission,
      $$DailyMissionsTableFilterComposer,
      $$DailyMissionsTableOrderingComposer,
      $$DailyMissionsTableAnnotationComposer,
      $$DailyMissionsTableCreateCompanionBuilder,
      $$DailyMissionsTableUpdateCompanionBuilder,
      (
        DailyMission,
        BaseReferences<_$AppDatabase, $DailyMissionsTable, DailyMission>,
      ),
      DailyMission,
      PrefetchHooks Function()
    >;
typedef $$MissionTasksTableCreateCompanionBuilder =
    MissionTasksCompanion Function({
      required String id,
      required String missionId,
      required String title,
      Value<bool> isDone,
      Value<int> xpReward,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$MissionTasksTableUpdateCompanionBuilder =
    MissionTasksCompanion Function({
      Value<String> id,
      Value<String> missionId,
      Value<String> title,
      Value<bool> isDone,
      Value<int> xpReward,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$MissionTasksTableFilterComposer
    extends Composer<_$AppDatabase, $MissionTasksTable> {
  $$MissionTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get missionId => $composableBuilder(
    column: $table.missionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MissionTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $MissionTasksTable> {
  $$MissionTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get missionId => $composableBuilder(
    column: $table.missionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MissionTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $MissionTasksTable> {
  $$MissionTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get missionId =>
      $composableBuilder(column: $table.missionId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<int> get xpReward =>
      $composableBuilder(column: $table.xpReward, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$MissionTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MissionTasksTable,
          MissionTask,
          $$MissionTasksTableFilterComposer,
          $$MissionTasksTableOrderingComposer,
          $$MissionTasksTableAnnotationComposer,
          $$MissionTasksTableCreateCompanionBuilder,
          $$MissionTasksTableUpdateCompanionBuilder,
          (
            MissionTask,
            BaseReferences<_$AppDatabase, $MissionTasksTable, MissionTask>,
          ),
          MissionTask,
          PrefetchHooks Function()
        > {
  $$MissionTasksTableTableManager(_$AppDatabase db, $MissionTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MissionTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MissionTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MissionTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> missionId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MissionTasksCompanion(
                id: id,
                missionId: missionId,
                title: title,
                isDone: isDone,
                xpReward: xpReward,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String missionId,
                required String title,
                Value<bool> isDone = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MissionTasksCompanion.insert(
                id: id,
                missionId: missionId,
                title: title,
                isDone: isDone,
                xpReward: xpReward,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MissionTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MissionTasksTable,
      MissionTask,
      $$MissionTasksTableFilterComposer,
      $$MissionTasksTableOrderingComposer,
      $$MissionTasksTableAnnotationComposer,
      $$MissionTasksTableCreateCompanionBuilder,
      $$MissionTasksTableUpdateCompanionBuilder,
      (
        MissionTask,
        BaseReferences<_$AppDatabase, $MissionTasksTable, MissionTask>,
      ),
      MissionTask,
      PrefetchHooks Function()
    >;
typedef $$MissionLogsTableCreateCompanionBuilder =
    MissionLogsCompanion Function({
      required String id,
      required String missionId,
      required String action,
      Value<String?> note,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$MissionLogsTableUpdateCompanionBuilder =
    MissionLogsCompanion Function({
      Value<String> id,
      Value<String> missionId,
      Value<String> action,
      Value<String?> note,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$MissionLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MissionLogsTable> {
  $$MissionLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get missionId => $composableBuilder(
    column: $table.missionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MissionLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MissionLogsTable> {
  $$MissionLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get missionId => $composableBuilder(
    column: $table.missionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MissionLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MissionLogsTable> {
  $$MissionLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get missionId =>
      $composableBuilder(column: $table.missionId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$MissionLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MissionLogsTable,
          MissionLog,
          $$MissionLogsTableFilterComposer,
          $$MissionLogsTableOrderingComposer,
          $$MissionLogsTableAnnotationComposer,
          $$MissionLogsTableCreateCompanionBuilder,
          $$MissionLogsTableUpdateCompanionBuilder,
          (
            MissionLog,
            BaseReferences<_$AppDatabase, $MissionLogsTable, MissionLog>,
          ),
          MissionLog,
          PrefetchHooks Function()
        > {
  $$MissionLogsTableTableManager(_$AppDatabase db, $MissionLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MissionLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MissionLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MissionLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> missionId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MissionLogsCompanion(
                id: id,
                missionId: missionId,
                action: action,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String missionId,
                required String action,
                Value<String?> note = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MissionLogsCompanion.insert(
                id: id,
                missionId: missionId,
                action: action,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MissionLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MissionLogsTable,
      MissionLog,
      $$MissionLogsTableFilterComposer,
      $$MissionLogsTableOrderingComposer,
      $$MissionLogsTableAnnotationComposer,
      $$MissionLogsTableCreateCompanionBuilder,
      $$MissionLogsTableUpdateCompanionBuilder,
      (
        MissionLog,
        BaseReferences<_$AppDatabase, $MissionLogsTable, MissionLog>,
      ),
      MissionLog,
      PrefetchHooks Function()
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      required String id,
      required String title,
      Value<String?> categoryId,
      Value<String> status,
      Value<String> priority,
      Value<DateTime?> dueDate,
      Value<int> xpReward,
      required DateTime createdAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> categoryId,
      Value<String> status,
      Value<String> priority,
      Value<DateTime?> dueDate,
      Value<int> xpReward,
      Value<DateTime> createdAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get xpReward =>
      $composableBuilder(column: $table.xpReward, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
          Task,
          PrefetchHooks Function()
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                title: title,
                categoryId: categoryId,
                status: status,
                priority: priority,
                dueDate: dueDate,
                xpReward: xpReward,
                createdAt: createdAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> categoryId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                title: title,
                categoryId: categoryId,
                status: status,
                priority: priority,
                dueDate: dueDate,
                xpReward: xpReward,
                createdAt: createdAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
      Task,
      PrefetchHooks Function()
    >;
typedef $$TaskCategoriesTableCreateCompanionBuilder =
    TaskCategoriesCompanion Function({
      required String id,
      required String name,
      Value<String?> lifeArea,
      Value<String?> colorHex,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TaskCategoriesTableUpdateCompanionBuilder =
    TaskCategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> lifeArea,
      Value<String?> colorHex,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$TaskCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $TaskCategoriesTable> {
  $$TaskCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifeArea => $composableBuilder(
    column: $table.lifeArea,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaskCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskCategoriesTable> {
  $$TaskCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifeArea => $composableBuilder(
    column: $table.lifeArea,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaskCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskCategoriesTable> {
  $$TaskCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lifeArea =>
      $composableBuilder(column: $table.lifeArea, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TaskCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskCategoriesTable,
          TaskCategory,
          $$TaskCategoriesTableFilterComposer,
          $$TaskCategoriesTableOrderingComposer,
          $$TaskCategoriesTableAnnotationComposer,
          $$TaskCategoriesTableCreateCompanionBuilder,
          $$TaskCategoriesTableUpdateCompanionBuilder,
          (
            TaskCategory,
            BaseReferences<_$AppDatabase, $TaskCategoriesTable, TaskCategory>,
          ),
          TaskCategory,
          PrefetchHooks Function()
        > {
  $$TaskCategoriesTableTableManager(
    _$AppDatabase db,
    $TaskCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> lifeArea = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskCategoriesCompanion(
                id: id,
                name: name,
                lifeArea: lifeArea,
                colorHex: colorHex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> lifeArea = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TaskCategoriesCompanion.insert(
                id: id,
                name: name,
                lifeArea: lifeArea,
                colorHex: colorHex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaskCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskCategoriesTable,
      TaskCategory,
      $$TaskCategoriesTableFilterComposer,
      $$TaskCategoriesTableOrderingComposer,
      $$TaskCategoriesTableAnnotationComposer,
      $$TaskCategoriesTableCreateCompanionBuilder,
      $$TaskCategoriesTableUpdateCompanionBuilder,
      (
        TaskCategory,
        BaseReferences<_$AppDatabase, $TaskCategoriesTable, TaskCategory>,
      ),
      TaskCategory,
      PrefetchHooks Function()
    >;
typedef $$TaskLogsTableCreateCompanionBuilder =
    TaskLogsCompanion Function({
      required String id,
      required String taskId,
      required String action,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TaskLogsTableUpdateCompanionBuilder =
    TaskLogsCompanion Function({
      Value<String> id,
      Value<String> taskId,
      Value<String> action,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$TaskLogsTableFilterComposer
    extends Composer<_$AppDatabase, $TaskLogsTable> {
  $$TaskLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaskLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskLogsTable> {
  $$TaskLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaskLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskLogsTable> {
  $$TaskLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TaskLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskLogsTable,
          TaskLog,
          $$TaskLogsTableFilterComposer,
          $$TaskLogsTableOrderingComposer,
          $$TaskLogsTableAnnotationComposer,
          $$TaskLogsTableCreateCompanionBuilder,
          $$TaskLogsTableUpdateCompanionBuilder,
          (TaskLog, BaseReferences<_$AppDatabase, $TaskLogsTable, TaskLog>),
          TaskLog,
          PrefetchHooks Function()
        > {
  $$TaskLogsTableTableManager(_$AppDatabase db, $TaskLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskLogsCompanion(
                id: id,
                taskId: taskId,
                action: action,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taskId,
                required String action,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TaskLogsCompanion.insert(
                id: id,
                taskId: taskId,
                action: action,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaskLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskLogsTable,
      TaskLog,
      $$TaskLogsTableFilterComposer,
      $$TaskLogsTableOrderingComposer,
      $$TaskLogsTableAnnotationComposer,
      $$TaskLogsTableCreateCompanionBuilder,
      $$TaskLogsTableUpdateCompanionBuilder,
      (TaskLog, BaseReferences<_$AppDatabase, $TaskLogsTable, TaskLog>),
      TaskLog,
      PrefetchHooks Function()
    >;
typedef $$FoodsTableCreateCompanionBuilder =
    FoodsCompanion Function({
      required String id,
      required String name,
      Value<double> calories,
      Value<double> sugar,
      Value<double> salt,
      Value<double> protein,
      Value<double> fat,
      Value<double> carbs,
      Value<String?> category,
      Value<String?> portion,
      Value<bool> favorite,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FoodsTableUpdateCompanionBuilder =
    FoodsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> calories,
      Value<double> sugar,
      Value<double> salt,
      Value<double> protein,
      Value<double> fat,
      Value<double> carbs,
      Value<String?> category,
      Value<String?> portion,
      Value<bool> favorite,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FoodsTableFilterComposer extends Composer<_$AppDatabase, $FoodsTable> {
  $$FoodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugar => $composableBuilder(
    column: $table.sugar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get portion => $composableBuilder(
    column: $table.portion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FoodsTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodsTable> {
  $$FoodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugar => $composableBuilder(
    column: $table.sugar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get portion => $composableBuilder(
    column: $table.portion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FoodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodsTable> {
  $$FoodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get sugar =>
      $composableBuilder(column: $table.sugar, builder: (column) => column);

  GeneratedColumn<double> get salt =>
      $composableBuilder(column: $table.salt, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get portion =>
      $composableBuilder(column: $table.portion, builder: (column) => column);

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FoodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodsTable,
          Food,
          $$FoodsTableFilterComposer,
          $$FoodsTableOrderingComposer,
          $$FoodsTableAnnotationComposer,
          $$FoodsTableCreateCompanionBuilder,
          $$FoodsTableUpdateCompanionBuilder,
          (Food, BaseReferences<_$AppDatabase, $FoodsTable, Food>),
          Food,
          PrefetchHooks Function()
        > {
  $$FoodsTableTableManager(_$AppDatabase db, $FoodsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> calories = const Value.absent(),
                Value<double> sugar = const Value.absent(),
                Value<double> salt = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> portion = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoodsCompanion(
                id: id,
                name: name,
                calories: calories,
                sugar: sugar,
                salt: salt,
                protein: protein,
                fat: fat,
                carbs: carbs,
                category: category,
                portion: portion,
                favorite: favorite,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<double> calories = const Value.absent(),
                Value<double> sugar = const Value.absent(),
                Value<double> salt = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> portion = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FoodsCompanion.insert(
                id: id,
                name: name,
                calories: calories,
                sugar: sugar,
                salt: salt,
                protein: protein,
                fat: fat,
                carbs: carbs,
                category: category,
                portion: portion,
                favorite: favorite,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FoodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodsTable,
      Food,
      $$FoodsTableFilterComposer,
      $$FoodsTableOrderingComposer,
      $$FoodsTableAnnotationComposer,
      $$FoodsTableCreateCompanionBuilder,
      $$FoodsTableUpdateCompanionBuilder,
      (Food, BaseReferences<_$AppDatabase, $FoodsTable, Food>),
      Food,
      PrefetchHooks Function()
    >;
typedef $$FoodLogsTableCreateCompanionBuilder =
    FoodLogsCompanion Function({
      required String id,
      Value<String?> foodId,
      required String name,
      Value<double> quantity,
      Value<double> calories,
      Value<double> sugar,
      Value<double> salt,
      Value<double> protein,
      Value<double> fat,
      Value<double> carbs,
      required DateTime loggedAt,
      Value<int> rowid,
    });
typedef $$FoodLogsTableUpdateCompanionBuilder =
    FoodLogsCompanion Function({
      Value<String> id,
      Value<String?> foodId,
      Value<String> name,
      Value<double> quantity,
      Value<double> calories,
      Value<double> sugar,
      Value<double> salt,
      Value<double> protein,
      Value<double> fat,
      Value<double> carbs,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

class $$FoodLogsTableFilterComposer
    extends Composer<_$AppDatabase, $FoodLogsTable> {
  $$FoodLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foodId => $composableBuilder(
    column: $table.foodId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugar => $composableBuilder(
    column: $table.sugar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FoodLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodLogsTable> {
  $$FoodLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foodId => $composableBuilder(
    column: $table.foodId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugar => $composableBuilder(
    column: $table.sugar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FoodLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodLogsTable> {
  $$FoodLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get foodId =>
      $composableBuilder(column: $table.foodId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get sugar =>
      $composableBuilder(column: $table.sugar, builder: (column) => column);

  GeneratedColumn<double> get salt =>
      $composableBuilder(column: $table.salt, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$FoodLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodLogsTable,
          FoodLog,
          $$FoodLogsTableFilterComposer,
          $$FoodLogsTableOrderingComposer,
          $$FoodLogsTableAnnotationComposer,
          $$FoodLogsTableCreateCompanionBuilder,
          $$FoodLogsTableUpdateCompanionBuilder,
          (FoodLog, BaseReferences<_$AppDatabase, $FoodLogsTable, FoodLog>),
          FoodLog,
          PrefetchHooks Function()
        > {
  $$FoodLogsTableTableManager(_$AppDatabase db, $FoodLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> foodId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double> calories = const Value.absent(),
                Value<double> sugar = const Value.absent(),
                Value<double> salt = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoodLogsCompanion(
                id: id,
                foodId: foodId,
                name: name,
                quantity: quantity,
                calories: calories,
                sugar: sugar,
                salt: salt,
                protein: protein,
                fat: fat,
                carbs: carbs,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> foodId = const Value.absent(),
                required String name,
                Value<double> quantity = const Value.absent(),
                Value<double> calories = const Value.absent(),
                Value<double> sugar = const Value.absent(),
                Value<double> salt = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                required DateTime loggedAt,
                Value<int> rowid = const Value.absent(),
              }) => FoodLogsCompanion.insert(
                id: id,
                foodId: foodId,
                name: name,
                quantity: quantity,
                calories: calories,
                sugar: sugar,
                salt: salt,
                protein: protein,
                fat: fat,
                carbs: carbs,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FoodLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodLogsTable,
      FoodLog,
      $$FoodLogsTableFilterComposer,
      $$FoodLogsTableOrderingComposer,
      $$FoodLogsTableAnnotationComposer,
      $$FoodLogsTableCreateCompanionBuilder,
      $$FoodLogsTableUpdateCompanionBuilder,
      (FoodLog, BaseReferences<_$AppDatabase, $FoodLogsTable, FoodLog>),
      FoodLog,
      PrefetchHooks Function()
    >;
typedef $$WaterLogsTableCreateCompanionBuilder =
    WaterLogsCompanion Function({
      required String id,
      required int amountMl,
      required DateTime loggedAt,
      Value<int> rowid,
    });
typedef $$WaterLogsTableUpdateCompanionBuilder =
    WaterLogsCompanion Function({
      Value<String> id,
      Value<int> amountMl,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

class $$WaterLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMl => $composableBuilder(
    column: $table.amountMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WaterLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMl => $composableBuilder(
    column: $table.amountMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WaterLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountMl =>
      $composableBuilder(column: $table.amountMl, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$WaterLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WaterLogsTable,
          WaterLog,
          $$WaterLogsTableFilterComposer,
          $$WaterLogsTableOrderingComposer,
          $$WaterLogsTableAnnotationComposer,
          $$WaterLogsTableCreateCompanionBuilder,
          $$WaterLogsTableUpdateCompanionBuilder,
          (WaterLog, BaseReferences<_$AppDatabase, $WaterLogsTable, WaterLog>),
          WaterLog,
          PrefetchHooks Function()
        > {
  $$WaterLogsTableTableManager(_$AppDatabase db, $WaterLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaterLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaterLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaterLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> amountMl = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WaterLogsCompanion(
                id: id,
                amountMl: amountMl,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int amountMl,
                required DateTime loggedAt,
                Value<int> rowid = const Value.absent(),
              }) => WaterLogsCompanion.insert(
                id: id,
                amountMl: amountMl,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WaterLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WaterLogsTable,
      WaterLog,
      $$WaterLogsTableFilterComposer,
      $$WaterLogsTableOrderingComposer,
      $$WaterLogsTableAnnotationComposer,
      $$WaterLogsTableCreateCompanionBuilder,
      $$WaterLogsTableUpdateCompanionBuilder,
      (WaterLog, BaseReferences<_$AppDatabase, $WaterLogsTable, WaterLog>),
      WaterLog,
      PrefetchHooks Function()
    >;
typedef $$NutritionGoalsTableCreateCompanionBuilder =
    NutritionGoalsCompanion Function({
      required String id,
      Value<int> waterMl,
      Value<double?> calories,
      Value<double?> protein,
      Value<double?> sugarLimit,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$NutritionGoalsTableUpdateCompanionBuilder =
    NutritionGoalsCompanion Function({
      Value<String> id,
      Value<int> waterMl,
      Value<double?> calories,
      Value<double?> protein,
      Value<double?> sugarLimit,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$NutritionGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $NutritionGoalsTable> {
  $$NutritionGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waterMl => $composableBuilder(
    column: $table.waterMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarLimit => $composableBuilder(
    column: $table.sugarLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NutritionGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $NutritionGoalsTable> {
  $$NutritionGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waterMl => $composableBuilder(
    column: $table.waterMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarLimit => $composableBuilder(
    column: $table.sugarLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NutritionGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutritionGoalsTable> {
  $$NutritionGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get waterMl =>
      $composableBuilder(column: $table.waterMl, builder: (column) => column);

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get sugarLimit => $composableBuilder(
    column: $table.sugarLimit,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$NutritionGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NutritionGoalsTable,
          NutritionGoal,
          $$NutritionGoalsTableFilterComposer,
          $$NutritionGoalsTableOrderingComposer,
          $$NutritionGoalsTableAnnotationComposer,
          $$NutritionGoalsTableCreateCompanionBuilder,
          $$NutritionGoalsTableUpdateCompanionBuilder,
          (
            NutritionGoal,
            BaseReferences<_$AppDatabase, $NutritionGoalsTable, NutritionGoal>,
          ),
          NutritionGoal,
          PrefetchHooks Function()
        > {
  $$NutritionGoalsTableTableManager(
    _$AppDatabase db,
    $NutritionGoalsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutritionGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutritionGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NutritionGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> waterMl = const Value.absent(),
                Value<double?> calories = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> sugarLimit = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NutritionGoalsCompanion(
                id: id,
                waterMl: waterMl,
                calories: calories,
                protein: protein,
                sugarLimit: sugarLimit,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int> waterMl = const Value.absent(),
                Value<double?> calories = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> sugarLimit = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => NutritionGoalsCompanion.insert(
                id: id,
                waterMl: waterMl,
                calories: calories,
                protein: protein,
                sugarLimit: sugarLimit,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NutritionGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NutritionGoalsTable,
      NutritionGoal,
      $$NutritionGoalsTableFilterComposer,
      $$NutritionGoalsTableOrderingComposer,
      $$NutritionGoalsTableAnnotationComposer,
      $$NutritionGoalsTableCreateCompanionBuilder,
      $$NutritionGoalsTableUpdateCompanionBuilder,
      (
        NutritionGoal,
        BaseReferences<_$AppDatabase, $NutritionGoalsTable, NutritionGoal>,
      ),
      NutritionGoal,
      PrefetchHooks Function()
    >;
typedef $$ExercisesTableCreateCompanionBuilder =
    ExercisesCompanion Function({
      required String id,
      required String category,
      Value<String?> subcategory,
      required String name,
      Value<String?> objective,
      Value<String?> description,
      Value<String> level,
      Value<int> averageMinutes,
      Value<String?> metrics,
      Value<String?> precautions,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ExercisesTableUpdateCompanionBuilder =
    ExercisesCompanion Function({
      Value<String> id,
      Value<String> category,
      Value<String?> subcategory,
      Value<String> name,
      Value<String?> objective,
      Value<String?> description,
      Value<String> level,
      Value<int> averageMinutes,
      Value<String?> metrics,
      Value<String?> precautions,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subcategory => $composableBuilder(
    column: $table.subcategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get averageMinutes => $composableBuilder(
    column: $table.averageMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metrics => $composableBuilder(
    column: $table.metrics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get precautions => $composableBuilder(
    column: $table.precautions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subcategory => $composableBuilder(
    column: $table.subcategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get averageMinutes => $composableBuilder(
    column: $table.averageMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metrics => $composableBuilder(
    column: $table.metrics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get precautions => $composableBuilder(
    column: $table.precautions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get subcategory => $composableBuilder(
    column: $table.subcategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get objective =>
      $composableBuilder(column: $table.objective, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get averageMinutes => $composableBuilder(
    column: $table.averageMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metrics =>
      $composableBuilder(column: $table.metrics, builder: (column) => column);

  GeneratedColumn<String> get precautions => $composableBuilder(
    column: $table.precautions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          Exercise,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (Exercise, BaseReferences<_$AppDatabase, $ExercisesTable, Exercise>),
          Exercise,
          PrefetchHooks Function()
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> subcategory = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> objective = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> level = const Value.absent(),
                Value<int> averageMinutes = const Value.absent(),
                Value<String?> metrics = const Value.absent(),
                Value<String?> precautions = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion(
                id: id,
                category: category,
                subcategory: subcategory,
                name: name,
                objective: objective,
                description: description,
                level: level,
                averageMinutes: averageMinutes,
                metrics: metrics,
                precautions: precautions,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String category,
                Value<String?> subcategory = const Value.absent(),
                required String name,
                Value<String?> objective = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> level = const Value.absent(),
                Value<int> averageMinutes = const Value.absent(),
                Value<String?> metrics = const Value.absent(),
                Value<String?> precautions = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion.insert(
                id: id,
                category: category,
                subcategory: subcategory,
                name: name,
                objective: objective,
                description: description,
                level: level,
                averageMinutes: averageMinutes,
                metrics: metrics,
                precautions: precautions,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      Exercise,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (Exercise, BaseReferences<_$AppDatabase, $ExercisesTable, Exercise>),
      Exercise,
      PrefetchHooks Function()
    >;
typedef $$WorkoutsTableCreateCompanionBuilder =
    WorkoutsCompanion Function({
      required String id,
      required String name,
      required String type,
      required int durationMinutes,
      Value<String> intensity,
      Value<String?> objective,
      Value<String?> templateJson,
      Value<String> status,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$WorkoutsTableUpdateCompanionBuilder =
    WorkoutsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<int> durationMinutes,
      Value<String> intensity,
      Value<String?> objective,
      Value<String?> templateJson,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$WorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateJson => $composableBuilder(
    column: $table.templateJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateJson => $composableBuilder(
    column: $table.templateJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get intensity =>
      $composableBuilder(column: $table.intensity, builder: (column) => column);

  GeneratedColumn<String> get objective =>
      $composableBuilder(column: $table.objective, builder: (column) => column);

  GeneratedColumn<String> get templateJson => $composableBuilder(
    column: $table.templateJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WorkoutsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutsTable,
          Workout,
          $$WorkoutsTableFilterComposer,
          $$WorkoutsTableOrderingComposer,
          $$WorkoutsTableAnnotationComposer,
          $$WorkoutsTableCreateCompanionBuilder,
          $$WorkoutsTableUpdateCompanionBuilder,
          (Workout, BaseReferences<_$AppDatabase, $WorkoutsTable, Workout>),
          Workout,
          PrefetchHooks Function()
        > {
  $$WorkoutsTableTableManager(_$AppDatabase db, $WorkoutsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<String> intensity = const Value.absent(),
                Value<String?> objective = const Value.absent(),
                Value<String?> templateJson = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutsCompanion(
                id: id,
                name: name,
                type: type,
                durationMinutes: durationMinutes,
                intensity: intensity,
                objective: objective,
                templateJson: templateJson,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String type,
                required int durationMinutes,
                Value<String> intensity = const Value.absent(),
                Value<String?> objective = const Value.absent(),
                Value<String?> templateJson = const Value.absent(),
                Value<String> status = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => WorkoutsCompanion.insert(
                id: id,
                name: name,
                type: type,
                durationMinutes: durationMinutes,
                intensity: intensity,
                objective: objective,
                templateJson: templateJson,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutsTable,
      Workout,
      $$WorkoutsTableFilterComposer,
      $$WorkoutsTableOrderingComposer,
      $$WorkoutsTableAnnotationComposer,
      $$WorkoutsTableCreateCompanionBuilder,
      $$WorkoutsTableUpdateCompanionBuilder,
      (Workout, BaseReferences<_$AppDatabase, $WorkoutsTable, Workout>),
      Workout,
      PrefetchHooks Function()
    >;
typedef $$WorkoutSessionsTableCreateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      required String id,
      Value<String?> workoutId,
      required DateTime startedAt,
      Value<DateTime?> finishedAt,
      Value<String> status,
      Value<int> xpReward,
      Value<int> rowid,
    });
typedef $$WorkoutSessionsTableUpdateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<String> id,
      Value<String?> workoutId,
      Value<DateTime> startedAt,
      Value<DateTime?> finishedAt,
      Value<String> status,
      Value<int> xpReward,
      Value<int> rowid,
    });

class $$WorkoutSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workoutId => $composableBuilder(
    column: $table.workoutId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workoutId => $composableBuilder(
    column: $table.workoutId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workoutId =>
      $composableBuilder(column: $table.workoutId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get xpReward =>
      $composableBuilder(column: $table.xpReward, builder: (column) => column);
}

class $$WorkoutSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionsTable,
          WorkoutSession,
          $$WorkoutSessionsTableFilterComposer,
          $$WorkoutSessionsTableOrderingComposer,
          $$WorkoutSessionsTableAnnotationComposer,
          $$WorkoutSessionsTableCreateCompanionBuilder,
          $$WorkoutSessionsTableUpdateCompanionBuilder,
          (
            WorkoutSession,
            BaseReferences<
              _$AppDatabase,
              $WorkoutSessionsTable,
              WorkoutSession
            >,
          ),
          WorkoutSession,
          PrefetchHooks Function()
        > {
  $$WorkoutSessionsTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> workoutId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsCompanion(
                id: id,
                workoutId: workoutId,
                startedAt: startedAt,
                finishedAt: finishedAt,
                status: status,
                xpReward: xpReward,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> workoutId = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsCompanion.insert(
                id: id,
                workoutId: workoutId,
                startedAt: startedAt,
                finishedAt: finishedAt,
                status: status,
                xpReward: xpReward,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionsTable,
      WorkoutSession,
      $$WorkoutSessionsTableFilterComposer,
      $$WorkoutSessionsTableOrderingComposer,
      $$WorkoutSessionsTableAnnotationComposer,
      $$WorkoutSessionsTableCreateCompanionBuilder,
      $$WorkoutSessionsTableUpdateCompanionBuilder,
      (
        WorkoutSession,
        BaseReferences<_$AppDatabase, $WorkoutSessionsTable, WorkoutSession>,
      ),
      WorkoutSession,
      PrefetchHooks Function()
    >;
typedef $$WorkoutSessionStepsTableCreateCompanionBuilder =
    WorkoutSessionStepsCompanion Function({
      required String id,
      required String sessionId,
      Value<String?> exerciseId,
      required String title,
      required int orderIndex,
      Value<int?> durationSeconds,
      Value<int?> repetitions,
      Value<int> sets,
      Value<int> restSeconds,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$WorkoutSessionStepsTableUpdateCompanionBuilder =
    WorkoutSessionStepsCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<String?> exerciseId,
      Value<String> title,
      Value<int> orderIndex,
      Value<int?> durationSeconds,
      Value<int?> repetitions,
      Value<int> sets,
      Value<int> restSeconds,
      Value<String> status,
      Value<int> rowid,
    });

class $$WorkoutSessionStepsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionStepsTable> {
  $$WorkoutSessionStepsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutSessionStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionStepsTable> {
  $$WorkoutSessionStepsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutSessionStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionStepsTable> {
  $$WorkoutSessionStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$WorkoutSessionStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionStepsTable,
          WorkoutSessionStep,
          $$WorkoutSessionStepsTableFilterComposer,
          $$WorkoutSessionStepsTableOrderingComposer,
          $$WorkoutSessionStepsTableAnnotationComposer,
          $$WorkoutSessionStepsTableCreateCompanionBuilder,
          $$WorkoutSessionStepsTableUpdateCompanionBuilder,
          (
            WorkoutSessionStep,
            BaseReferences<
              _$AppDatabase,
              $WorkoutSessionStepsTable,
              WorkoutSessionStep
            >,
          ),
          WorkoutSessionStep,
          PrefetchHooks Function()
        > {
  $$WorkoutSessionStepsTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionStepsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionStepsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkoutSessionStepsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String?> exerciseId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> repetitions = const Value.absent(),
                Value<int> sets = const Value.absent(),
                Value<int> restSeconds = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionStepsCompanion(
                id: id,
                sessionId: sessionId,
                exerciseId: exerciseId,
                title: title,
                orderIndex: orderIndex,
                durationSeconds: durationSeconds,
                repetitions: repetitions,
                sets: sets,
                restSeconds: restSeconds,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                Value<String?> exerciseId = const Value.absent(),
                required String title,
                required int orderIndex,
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> repetitions = const Value.absent(),
                Value<int> sets = const Value.absent(),
                Value<int> restSeconds = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionStepsCompanion.insert(
                id: id,
                sessionId: sessionId,
                exerciseId: exerciseId,
                title: title,
                orderIndex: orderIndex,
                durationSeconds: durationSeconds,
                repetitions: repetitions,
                sets: sets,
                restSeconds: restSeconds,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutSessionStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionStepsTable,
      WorkoutSessionStep,
      $$WorkoutSessionStepsTableFilterComposer,
      $$WorkoutSessionStepsTableOrderingComposer,
      $$WorkoutSessionStepsTableAnnotationComposer,
      $$WorkoutSessionStepsTableCreateCompanionBuilder,
      $$WorkoutSessionStepsTableUpdateCompanionBuilder,
      (
        WorkoutSessionStep,
        BaseReferences<
          _$AppDatabase,
          $WorkoutSessionStepsTable,
          WorkoutSessionStep
        >,
      ),
      WorkoutSessionStep,
      PrefetchHooks Function()
    >;
typedef $$WorkoutLogsTableCreateCompanionBuilder =
    WorkoutLogsCompanion Function({
      required String id,
      required String sessionId,
      Value<String?> note,
      Value<int?> fatigue,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$WorkoutLogsTableUpdateCompanionBuilder =
    WorkoutLogsCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<String?> note,
      Value<int?> fatigue,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$WorkoutLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fatigue => $composableBuilder(
    column: $table.fatigue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fatigue => $composableBuilder(
    column: $table.fatigue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get fatigue =>
      $composableBuilder(column: $table.fatigue, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WorkoutLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutLogsTable,
          WorkoutLog,
          $$WorkoutLogsTableFilterComposer,
          $$WorkoutLogsTableOrderingComposer,
          $$WorkoutLogsTableAnnotationComposer,
          $$WorkoutLogsTableCreateCompanionBuilder,
          $$WorkoutLogsTableUpdateCompanionBuilder,
          (
            WorkoutLog,
            BaseReferences<_$AppDatabase, $WorkoutLogsTable, WorkoutLog>,
          ),
          WorkoutLog,
          PrefetchHooks Function()
        > {
  $$WorkoutLogsTableTableManager(_$AppDatabase db, $WorkoutLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> fatigue = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutLogsCompanion(
                id: id,
                sessionId: sessionId,
                note: note,
                fatigue: fatigue,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                Value<String?> note = const Value.absent(),
                Value<int?> fatigue = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => WorkoutLogsCompanion.insert(
                id: id,
                sessionId: sessionId,
                note: note,
                fatigue: fatigue,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutLogsTable,
      WorkoutLog,
      $$WorkoutLogsTableFilterComposer,
      $$WorkoutLogsTableOrderingComposer,
      $$WorkoutLogsTableAnnotationComposer,
      $$WorkoutLogsTableCreateCompanionBuilder,
      $$WorkoutLogsTableUpdateCompanionBuilder,
      (
        WorkoutLog,
        BaseReferences<_$AppDatabase, $WorkoutLogsTable, WorkoutLog>,
      ),
      WorkoutLog,
      PrefetchHooks Function()
    >;
typedef $$StudySubjectsTableCreateCompanionBuilder =
    StudySubjectsCompanion Function({
      required String id,
      required String name,
      Value<String?> colorHex,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$StudySubjectsTableUpdateCompanionBuilder =
    StudySubjectsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> colorHex,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$StudySubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $StudySubjectsTable> {
  $$StudySubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudySubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudySubjectsTable> {
  $$StudySubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudySubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudySubjectsTable> {
  $$StudySubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StudySubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudySubjectsTable,
          StudySubject,
          $$StudySubjectsTableFilterComposer,
          $$StudySubjectsTableOrderingComposer,
          $$StudySubjectsTableAnnotationComposer,
          $$StudySubjectsTableCreateCompanionBuilder,
          $$StudySubjectsTableUpdateCompanionBuilder,
          (
            StudySubject,
            BaseReferences<_$AppDatabase, $StudySubjectsTable, StudySubject>,
          ),
          StudySubject,
          PrefetchHooks Function()
        > {
  $$StudySubjectsTableTableManager(_$AppDatabase db, $StudySubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudySubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudySubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudySubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudySubjectsCompanion(
                id: id,
                name: name,
                colorHex: colorHex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> colorHex = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => StudySubjectsCompanion.insert(
                id: id,
                name: name,
                colorHex: colorHex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudySubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudySubjectsTable,
      StudySubject,
      $$StudySubjectsTableFilterComposer,
      $$StudySubjectsTableOrderingComposer,
      $$StudySubjectsTableAnnotationComposer,
      $$StudySubjectsTableCreateCompanionBuilder,
      $$StudySubjectsTableUpdateCompanionBuilder,
      (
        StudySubject,
        BaseReferences<_$AppDatabase, $StudySubjectsTable, StudySubject>,
      ),
      StudySubject,
      PrefetchHooks Function()
    >;
typedef $$StudyUnitsTableCreateCompanionBuilder =
    StudyUnitsCompanion Function({
      required String id,
      required String subjectId,
      required String title,
      Value<String?> objective,
      Value<String> difficulty,
      Value<String> priority,
      Value<int> estimatedMinutes,
      Value<int> mastery,
      Value<DateTime?> examDate,
      Value<DateTime?> lastReviewAt,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$StudyUnitsTableUpdateCompanionBuilder =
    StudyUnitsCompanion Function({
      Value<String> id,
      Value<String> subjectId,
      Value<String> title,
      Value<String?> objective,
      Value<String> difficulty,
      Value<String> priority,
      Value<int> estimatedMinutes,
      Value<int> mastery,
      Value<DateTime?> examDate,
      Value<DateTime?> lastReviewAt,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$StudyUnitsTableFilterComposer
    extends Composer<_$AppDatabase, $StudyUnitsTable> {
  $$StudyUnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mastery => $composableBuilder(
    column: $table.mastery,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get examDate => $composableBuilder(
    column: $table.examDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewAt => $composableBuilder(
    column: $table.lastReviewAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudyUnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudyUnitsTable> {
  $$StudyUnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mastery => $composableBuilder(
    column: $table.mastery,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get examDate => $composableBuilder(
    column: $table.examDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewAt => $composableBuilder(
    column: $table.lastReviewAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudyUnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudyUnitsTable> {
  $$StudyUnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get objective =>
      $composableBuilder(column: $table.objective, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mastery =>
      $composableBuilder(column: $table.mastery, builder: (column) => column);

  GeneratedColumn<DateTime> get examDate =>
      $composableBuilder(column: $table.examDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewAt => $composableBuilder(
    column: $table.lastReviewAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StudyUnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudyUnitsTable,
          StudyUnit,
          $$StudyUnitsTableFilterComposer,
          $$StudyUnitsTableOrderingComposer,
          $$StudyUnitsTableAnnotationComposer,
          $$StudyUnitsTableCreateCompanionBuilder,
          $$StudyUnitsTableUpdateCompanionBuilder,
          (
            StudyUnit,
            BaseReferences<_$AppDatabase, $StudyUnitsTable, StudyUnit>,
          ),
          StudyUnit,
          PrefetchHooks Function()
        > {
  $$StudyUnitsTableTableManager(_$AppDatabase db, $StudyUnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudyUnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudyUnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudyUnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> objective = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<int> estimatedMinutes = const Value.absent(),
                Value<int> mastery = const Value.absent(),
                Value<DateTime?> examDate = const Value.absent(),
                Value<DateTime?> lastReviewAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyUnitsCompanion(
                id: id,
                subjectId: subjectId,
                title: title,
                objective: objective,
                difficulty: difficulty,
                priority: priority,
                estimatedMinutes: estimatedMinutes,
                mastery: mastery,
                examDate: examDate,
                lastReviewAt: lastReviewAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectId,
                required String title,
                Value<String?> objective = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<int> estimatedMinutes = const Value.absent(),
                Value<int> mastery = const Value.absent(),
                Value<DateTime?> examDate = const Value.absent(),
                Value<DateTime?> lastReviewAt = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => StudyUnitsCompanion.insert(
                id: id,
                subjectId: subjectId,
                title: title,
                objective: objective,
                difficulty: difficulty,
                priority: priority,
                estimatedMinutes: estimatedMinutes,
                mastery: mastery,
                examDate: examDate,
                lastReviewAt: lastReviewAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudyUnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudyUnitsTable,
      StudyUnit,
      $$StudyUnitsTableFilterComposer,
      $$StudyUnitsTableOrderingComposer,
      $$StudyUnitsTableAnnotationComposer,
      $$StudyUnitsTableCreateCompanionBuilder,
      $$StudyUnitsTableUpdateCompanionBuilder,
      (StudyUnit, BaseReferences<_$AppDatabase, $StudyUnitsTable, StudyUnit>),
      StudyUnit,
      PrefetchHooks Function()
    >;
typedef $$StudySessionsTableCreateCompanionBuilder =
    StudySessionsCompanion Function({
      required String id,
      Value<String?> unitId,
      required String sessionType,
      required int minutes,
      Value<String?> notes,
      required DateTime startedAt,
      Value<DateTime?> finishedAt,
      Value<int> rowid,
    });
typedef $$StudySessionsTableUpdateCompanionBuilder =
    StudySessionsCompanion Function({
      Value<String> id,
      Value<String?> unitId,
      Value<String> sessionType,
      Value<int> minutes,
      Value<String?> notes,
      Value<DateTime> startedAt,
      Value<DateTime?> finishedAt,
      Value<int> rowid,
    });

class $$StudySessionsTableFilterComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionType => $composableBuilder(
    column: $table.sessionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudySessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionType => $composableBuilder(
    column: $table.sessionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudySessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get sessionType => $composableBuilder(
    column: $table.sessionType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get minutes =>
      $composableBuilder(column: $table.minutes, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => column,
  );
}

class $$StudySessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudySessionsTable,
          StudySession,
          $$StudySessionsTableFilterComposer,
          $$StudySessionsTableOrderingComposer,
          $$StudySessionsTableAnnotationComposer,
          $$StudySessionsTableCreateCompanionBuilder,
          $$StudySessionsTableUpdateCompanionBuilder,
          (
            StudySession,
            BaseReferences<_$AppDatabase, $StudySessionsTable, StudySession>,
          ),
          StudySession,
          PrefetchHooks Function()
        > {
  $$StudySessionsTableTableManager(_$AppDatabase db, $StudySessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudySessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudySessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudySessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String> sessionType = const Value.absent(),
                Value<int> minutes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudySessionsCompanion(
                id: id,
                unitId: unitId,
                sessionType: sessionType,
                minutes: minutes,
                notes: notes,
                startedAt: startedAt,
                finishedAt: finishedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> unitId = const Value.absent(),
                required String sessionType,
                required int minutes,
                Value<String?> notes = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudySessionsCompanion.insert(
                id: id,
                unitId: unitId,
                sessionType: sessionType,
                minutes: minutes,
                notes: notes,
                startedAt: startedAt,
                finishedAt: finishedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudySessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudySessionsTable,
      StudySession,
      $$StudySessionsTableFilterComposer,
      $$StudySessionsTableOrderingComposer,
      $$StudySessionsTableAnnotationComposer,
      $$StudySessionsTableCreateCompanionBuilder,
      $$StudySessionsTableUpdateCompanionBuilder,
      (
        StudySession,
        BaseReferences<_$AppDatabase, $StudySessionsTable, StudySession>,
      ),
      StudySession,
      PrefetchHooks Function()
    >;
typedef $$StudyReviewsTableCreateCompanionBuilder =
    StudyReviewsCompanion Function({
      required String id,
      required String unitId,
      required DateTime dueAt,
      Value<DateTime?> completedAt,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$StudyReviewsTableUpdateCompanionBuilder =
    StudyReviewsCompanion Function({
      Value<String> id,
      Value<String> unitId,
      Value<DateTime> dueAt,
      Value<DateTime?> completedAt,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$StudyReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $StudyReviewsTable> {
  $$StudyReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudyReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudyReviewsTable> {
  $$StudyReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudyReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudyReviewsTable> {
  $$StudyReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<DateTime> get dueAt =>
      $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$StudyReviewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudyReviewsTable,
          StudyReview,
          $$StudyReviewsTableFilterComposer,
          $$StudyReviewsTableOrderingComposer,
          $$StudyReviewsTableAnnotationComposer,
          $$StudyReviewsTableCreateCompanionBuilder,
          $$StudyReviewsTableUpdateCompanionBuilder,
          (
            StudyReview,
            BaseReferences<_$AppDatabase, $StudyReviewsTable, StudyReview>,
          ),
          StudyReview,
          PrefetchHooks Function()
        > {
  $$StudyReviewsTableTableManager(_$AppDatabase db, $StudyReviewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudyReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudyReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudyReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<DateTime> dueAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyReviewsCompanion(
                id: id,
                unitId: unitId,
                dueAt: dueAt,
                completedAt: completedAt,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String unitId,
                required DateTime dueAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyReviewsCompanion.insert(
                id: id,
                unitId: unitId,
                dueAt: dueAt,
                completedAt: completedAt,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudyReviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudyReviewsTable,
      StudyReview,
      $$StudyReviewsTableFilterComposer,
      $$StudyReviewsTableOrderingComposer,
      $$StudyReviewsTableAnnotationComposer,
      $$StudyReviewsTableCreateCompanionBuilder,
      $$StudyReviewsTableUpdateCompanionBuilder,
      (
        StudyReview,
        BaseReferences<_$AppDatabase, $StudyReviewsTable, StudyReview>,
      ),
      StudyReview,
      PrefetchHooks Function()
    >;
typedef $$FinanceCategoriesTableCreateCompanionBuilder =
    FinanceCategoriesCompanion Function({
      required String id,
      required String name,
      required String nature,
      Value<String?> description,
      Value<bool> acceptsRecurrence,
      Value<String?> alertRule,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FinanceCategoriesTableUpdateCompanionBuilder =
    FinanceCategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> nature,
      Value<String?> description,
      Value<bool> acceptsRecurrence,
      Value<String?> alertRule,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FinanceCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $FinanceCategoriesTable> {
  $$FinanceCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nature => $composableBuilder(
    column: $table.nature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get acceptsRecurrence => $composableBuilder(
    column: $table.acceptsRecurrence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alertRule => $composableBuilder(
    column: $table.alertRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FinanceCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $FinanceCategoriesTable> {
  $$FinanceCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nature => $composableBuilder(
    column: $table.nature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get acceptsRecurrence => $composableBuilder(
    column: $table.acceptsRecurrence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alertRule => $composableBuilder(
    column: $table.alertRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FinanceCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FinanceCategoriesTable> {
  $$FinanceCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nature =>
      $composableBuilder(column: $table.nature, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get acceptsRecurrence => $composableBuilder(
    column: $table.acceptsRecurrence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get alertRule =>
      $composableBuilder(column: $table.alertRule, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FinanceCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FinanceCategoriesTable,
          FinanceCategory,
          $$FinanceCategoriesTableFilterComposer,
          $$FinanceCategoriesTableOrderingComposer,
          $$FinanceCategoriesTableAnnotationComposer,
          $$FinanceCategoriesTableCreateCompanionBuilder,
          $$FinanceCategoriesTableUpdateCompanionBuilder,
          (
            FinanceCategory,
            BaseReferences<
              _$AppDatabase,
              $FinanceCategoriesTable,
              FinanceCategory
            >,
          ),
          FinanceCategory,
          PrefetchHooks Function()
        > {
  $$FinanceCategoriesTableTableManager(
    _$AppDatabase db,
    $FinanceCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FinanceCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FinanceCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FinanceCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nature = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> acceptsRecurrence = const Value.absent(),
                Value<String?> alertRule = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FinanceCategoriesCompanion(
                id: id,
                name: name,
                nature: nature,
                description: description,
                acceptsRecurrence: acceptsRecurrence,
                alertRule: alertRule,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String nature,
                Value<String?> description = const Value.absent(),
                Value<bool> acceptsRecurrence = const Value.absent(),
                Value<String?> alertRule = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FinanceCategoriesCompanion.insert(
                id: id,
                name: name,
                nature: nature,
                description: description,
                acceptsRecurrence: acceptsRecurrence,
                alertRule: alertRule,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FinanceCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FinanceCategoriesTable,
      FinanceCategory,
      $$FinanceCategoriesTableFilterComposer,
      $$FinanceCategoriesTableOrderingComposer,
      $$FinanceCategoriesTableAnnotationComposer,
      $$FinanceCategoriesTableCreateCompanionBuilder,
      $$FinanceCategoriesTableUpdateCompanionBuilder,
      (
        FinanceCategory,
        BaseReferences<_$AppDatabase, $FinanceCategoriesTable, FinanceCategory>,
      ),
      FinanceCategory,
      PrefetchHooks Function()
    >;
typedef $$FinanceTransactionsTableCreateCompanionBuilder =
    FinanceTransactionsCompanion Function({
      required String id,
      required double amount,
      required String type,
      Value<String?> categoryId,
      Value<String?> description,
      Value<String?> paymentMethod,
      Value<bool> fixed,
      required DateTime date,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FinanceTransactionsTableUpdateCompanionBuilder =
    FinanceTransactionsCompanion Function({
      Value<String> id,
      Value<double> amount,
      Value<String> type,
      Value<String?> categoryId,
      Value<String?> description,
      Value<String?> paymentMethod,
      Value<bool> fixed,
      Value<DateTime> date,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FinanceTransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $FinanceTransactionsTable> {
  $$FinanceTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get fixed => $composableBuilder(
    column: $table.fixed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FinanceTransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FinanceTransactionsTable> {
  $$FinanceTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get fixed => $composableBuilder(
    column: $table.fixed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FinanceTransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FinanceTransactionsTable> {
  $$FinanceTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get fixed =>
      $composableBuilder(column: $table.fixed, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FinanceTransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FinanceTransactionsTable,
          FinanceTransaction,
          $$FinanceTransactionsTableFilterComposer,
          $$FinanceTransactionsTableOrderingComposer,
          $$FinanceTransactionsTableAnnotationComposer,
          $$FinanceTransactionsTableCreateCompanionBuilder,
          $$FinanceTransactionsTableUpdateCompanionBuilder,
          (
            FinanceTransaction,
            BaseReferences<
              _$AppDatabase,
              $FinanceTransactionsTable,
              FinanceTransaction
            >,
          ),
          FinanceTransaction,
          PrefetchHooks Function()
        > {
  $$FinanceTransactionsTableTableManager(
    _$AppDatabase db,
    $FinanceTransactionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FinanceTransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FinanceTransactionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FinanceTransactionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<bool> fixed = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FinanceTransactionsCompanion(
                id: id,
                amount: amount,
                type: type,
                categoryId: categoryId,
                description: description,
                paymentMethod: paymentMethod,
                fixed: fixed,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double amount,
                required String type,
                Value<String?> categoryId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<bool> fixed = const Value.absent(),
                required DateTime date,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FinanceTransactionsCompanion.insert(
                id: id,
                amount: amount,
                type: type,
                categoryId: categoryId,
                description: description,
                paymentMethod: paymentMethod,
                fixed: fixed,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FinanceTransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FinanceTransactionsTable,
      FinanceTransaction,
      $$FinanceTransactionsTableFilterComposer,
      $$FinanceTransactionsTableOrderingComposer,
      $$FinanceTransactionsTableAnnotationComposer,
      $$FinanceTransactionsTableCreateCompanionBuilder,
      $$FinanceTransactionsTableUpdateCompanionBuilder,
      (
        FinanceTransaction,
        BaseReferences<
          _$AppDatabase,
          $FinanceTransactionsTable,
          FinanceTransaction
        >,
      ),
      FinanceTransaction,
      PrefetchHooks Function()
    >;
typedef $$FixedExpensesTableCreateCompanionBuilder =
    FixedExpensesCompanion Function({
      required String id,
      required String name,
      required double amount,
      Value<String?> categoryId,
      required int dueDay,
      Value<String> recurrence,
      Value<bool> active,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FixedExpensesTableUpdateCompanionBuilder =
    FixedExpensesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> amount,
      Value<String?> categoryId,
      Value<int> dueDay,
      Value<String> recurrence,
      Value<bool> active,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FixedExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $FixedExpensesTable> {
  $$FixedExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDay => $composableBuilder(
    column: $table.dueDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrence => $composableBuilder(
    column: $table.recurrence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FixedExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $FixedExpensesTable> {
  $$FixedExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDay => $composableBuilder(
    column: $table.dueDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrence => $composableBuilder(
    column: $table.recurrence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FixedExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FixedExpensesTable> {
  $$FixedExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dueDay =>
      $composableBuilder(column: $table.dueDay, builder: (column) => column);

  GeneratedColumn<String> get recurrence => $composableBuilder(
    column: $table.recurrence,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FixedExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FixedExpensesTable,
          FixedExpense,
          $$FixedExpensesTableFilterComposer,
          $$FixedExpensesTableOrderingComposer,
          $$FixedExpensesTableAnnotationComposer,
          $$FixedExpensesTableCreateCompanionBuilder,
          $$FixedExpensesTableUpdateCompanionBuilder,
          (
            FixedExpense,
            BaseReferences<_$AppDatabase, $FixedExpensesTable, FixedExpense>,
          ),
          FixedExpense,
          PrefetchHooks Function()
        > {
  $$FixedExpensesTableTableManager(_$AppDatabase db, $FixedExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FixedExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FixedExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FixedExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<int> dueDay = const Value.absent(),
                Value<String> recurrence = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FixedExpensesCompanion(
                id: id,
                name: name,
                amount: amount,
                categoryId: categoryId,
                dueDay: dueDay,
                recurrence: recurrence,
                active: active,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required double amount,
                Value<String?> categoryId = const Value.absent(),
                required int dueDay,
                Value<String> recurrence = const Value.absent(),
                Value<bool> active = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FixedExpensesCompanion.insert(
                id: id,
                name: name,
                amount: amount,
                categoryId: categoryId,
                dueDay: dueDay,
                recurrence: recurrence,
                active: active,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FixedExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FixedExpensesTable,
      FixedExpense,
      $$FixedExpensesTableFilterComposer,
      $$FixedExpensesTableOrderingComposer,
      $$FixedExpensesTableAnnotationComposer,
      $$FixedExpensesTableCreateCompanionBuilder,
      $$FixedExpensesTableUpdateCompanionBuilder,
      (
        FixedExpense,
        BaseReferences<_$AppDatabase, $FixedExpensesTable, FixedExpense>,
      ),
      FixedExpense,
      PrefetchHooks Function()
    >;
typedef $$FinancialGoalsTableCreateCompanionBuilder =
    FinancialGoalsCompanion Function({
      required String id,
      required String name,
      required double targetAmount,
      Value<double> currentAmount,
      Value<DateTime?> deadline,
      Value<String?> category,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FinancialGoalsTableUpdateCompanionBuilder =
    FinancialGoalsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> targetAmount,
      Value<double> currentAmount,
      Value<DateTime?> deadline,
      Value<String?> category,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FinancialGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $FinancialGoalsTable> {
  $$FinancialGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetAmount => $composableBuilder(
    column: $table.targetAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentAmount => $composableBuilder(
    column: $table.currentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FinancialGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $FinancialGoalsTable> {
  $$FinancialGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetAmount => $composableBuilder(
    column: $table.targetAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentAmount => $composableBuilder(
    column: $table.currentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FinancialGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FinancialGoalsTable> {
  $$FinancialGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get targetAmount => $composableBuilder(
    column: $table.targetAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentAmount => $composableBuilder(
    column: $table.currentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FinancialGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FinancialGoalsTable,
          FinancialGoal,
          $$FinancialGoalsTableFilterComposer,
          $$FinancialGoalsTableOrderingComposer,
          $$FinancialGoalsTableAnnotationComposer,
          $$FinancialGoalsTableCreateCompanionBuilder,
          $$FinancialGoalsTableUpdateCompanionBuilder,
          (
            FinancialGoal,
            BaseReferences<_$AppDatabase, $FinancialGoalsTable, FinancialGoal>,
          ),
          FinancialGoal,
          PrefetchHooks Function()
        > {
  $$FinancialGoalsTableTableManager(
    _$AppDatabase db,
    $FinancialGoalsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FinancialGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FinancialGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FinancialGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> targetAmount = const Value.absent(),
                Value<double> currentAmount = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FinancialGoalsCompanion(
                id: id,
                name: name,
                targetAmount: targetAmount,
                currentAmount: currentAmount,
                deadline: deadline,
                category: category,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required double targetAmount,
                Value<double> currentAmount = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String?> category = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FinancialGoalsCompanion.insert(
                id: id,
                name: name,
                targetAmount: targetAmount,
                currentAmount: currentAmount,
                deadline: deadline,
                category: category,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FinancialGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FinancialGoalsTable,
      FinancialGoal,
      $$FinancialGoalsTableFilterComposer,
      $$FinancialGoalsTableOrderingComposer,
      $$FinancialGoalsTableAnnotationComposer,
      $$FinancialGoalsTableCreateCompanionBuilder,
      $$FinancialGoalsTableUpdateCompanionBuilder,
      (
        FinancialGoal,
        BaseReferences<_$AppDatabase, $FinancialGoalsTable, FinancialGoal>,
      ),
      FinancialGoal,
      PrefetchHooks Function()
    >;
typedef $$ReceiptImagesTableCreateCompanionBuilder =
    ReceiptImagesCompanion Function({
      required String id,
      required String transactionId,
      required String path,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ReceiptImagesTableUpdateCompanionBuilder =
    ReceiptImagesCompanion Function({
      Value<String> id,
      Value<String> transactionId,
      Value<String> path,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ReceiptImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptImagesTable> {
  $$ReceiptImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReceiptImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptImagesTable> {
  $$ReceiptImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReceiptImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptImagesTable> {
  $$ReceiptImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ReceiptImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReceiptImagesTable,
          ReceiptImage,
          $$ReceiptImagesTableFilterComposer,
          $$ReceiptImagesTableOrderingComposer,
          $$ReceiptImagesTableAnnotationComposer,
          $$ReceiptImagesTableCreateCompanionBuilder,
          $$ReceiptImagesTableUpdateCompanionBuilder,
          (
            ReceiptImage,
            BaseReferences<_$AppDatabase, $ReceiptImagesTable, ReceiptImage>,
          ),
          ReceiptImage,
          PrefetchHooks Function()
        > {
  $$ReceiptImagesTableTableManager(_$AppDatabase db, $ReceiptImagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> transactionId = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReceiptImagesCompanion(
                id: id,
                transactionId: transactionId,
                path: path,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String transactionId,
                required String path,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ReceiptImagesCompanion.insert(
                id: id,
                transactionId: transactionId,
                path: path,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReceiptImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReceiptImagesTable,
      ReceiptImage,
      $$ReceiptImagesTableFilterComposer,
      $$ReceiptImagesTableOrderingComposer,
      $$ReceiptImagesTableAnnotationComposer,
      $$ReceiptImagesTableCreateCompanionBuilder,
      $$ReceiptImagesTableUpdateCompanionBuilder,
      (
        ReceiptImage,
        BaseReferences<_$AppDatabase, $ReceiptImagesTable, ReceiptImage>,
      ),
      ReceiptImage,
      PrefetchHooks Function()
    >;
typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String> status,
      Value<String> priority,
      Value<int> progress,
      Value<String?> nextTask,
      Value<String> area,
      Value<int> investedMinutes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> status,
      Value<String> priority,
      Value<int> progress,
      Value<String?> nextTask,
      Value<String> area,
      Value<int> investedMinutes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextTask => $composableBuilder(
    column: $table.nextTask,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get investedMinutes => $composableBuilder(
    column: $table.investedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextTask => $composableBuilder(
    column: $table.nextTask,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get investedMinutes => $composableBuilder(
    column: $table.investedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get nextTask =>
      $composableBuilder(column: $table.nextTask, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<int> get investedMinutes => $composableBuilder(
    column: $table.investedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTable,
          Project,
          $$ProjectsTableFilterComposer,
          $$ProjectsTableOrderingComposer,
          $$ProjectsTableAnnotationComposer,
          $$ProjectsTableCreateCompanionBuilder,
          $$ProjectsTableUpdateCompanionBuilder,
          (Project, BaseReferences<_$AppDatabase, $ProjectsTable, Project>),
          Project,
          PrefetchHooks Function()
        > {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<String?> nextTask = const Value.absent(),
                Value<String> area = const Value.absent(),
                Value<int> investedMinutes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                name: name,
                description: description,
                status: status,
                priority: priority,
                progress: progress,
                nextTask: nextTask,
                area: area,
                investedMinutes: investedMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<String?> nextTask = const Value.absent(),
                Value<String> area = const Value.absent(),
                Value<int> investedMinutes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                name: name,
                description: description,
                status: status,
                priority: priority,
                progress: progress,
                nextTask: nextTask,
                area: area,
                investedMinutes: investedMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTable,
      Project,
      $$ProjectsTableFilterComposer,
      $$ProjectsTableOrderingComposer,
      $$ProjectsTableAnnotationComposer,
      $$ProjectsTableCreateCompanionBuilder,
      $$ProjectsTableUpdateCompanionBuilder,
      (Project, BaseReferences<_$AppDatabase, $ProjectsTable, Project>),
      Project,
      PrefetchHooks Function()
    >;
typedef $$ProjectTasksTableCreateCompanionBuilder =
    ProjectTasksCompanion Function({
      required String id,
      required String projectId,
      required String title,
      Value<bool> isDone,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ProjectTasksTableUpdateCompanionBuilder =
    ProjectTasksCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> title,
      Value<bool> isDone,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ProjectTasksTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectTasksTable> {
  $$ProjectTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectTasksTable> {
  $$ProjectTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectTasksTable> {
  $$ProjectTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProjectTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectTasksTable,
          ProjectTask,
          $$ProjectTasksTableFilterComposer,
          $$ProjectTasksTableOrderingComposer,
          $$ProjectTasksTableAnnotationComposer,
          $$ProjectTasksTableCreateCompanionBuilder,
          $$ProjectTasksTableUpdateCompanionBuilder,
          (
            ProjectTask,
            BaseReferences<_$AppDatabase, $ProjectTasksTable, ProjectTask>,
          ),
          ProjectTask,
          PrefetchHooks Function()
        > {
  $$ProjectTasksTableTableManager(_$AppDatabase db, $ProjectTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectTasksCompanion(
                id: id,
                projectId: projectId,
                title: title,
                isDone: isDone,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String title,
                Value<bool> isDone = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProjectTasksCompanion.insert(
                id: id,
                projectId: projectId,
                title: title,
                isDone: isDone,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectTasksTable,
      ProjectTask,
      $$ProjectTasksTableFilterComposer,
      $$ProjectTasksTableOrderingComposer,
      $$ProjectTasksTableAnnotationComposer,
      $$ProjectTasksTableCreateCompanionBuilder,
      $$ProjectTasksTableUpdateCompanionBuilder,
      (
        ProjectTask,
        BaseReferences<_$AppDatabase, $ProjectTasksTable, ProjectTask>,
      ),
      ProjectTask,
      PrefetchHooks Function()
    >;
typedef $$ProjectNotesTableCreateCompanionBuilder =
    ProjectNotesCompanion Function({
      required String id,
      required String projectId,
      required String note,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ProjectNotesTableUpdateCompanionBuilder =
    ProjectNotesCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> note,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ProjectNotesTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectNotesTable> {
  $$ProjectNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectNotesTable> {
  $$ProjectNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectNotesTable> {
  $$ProjectNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProjectNotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectNotesTable,
          ProjectNote,
          $$ProjectNotesTableFilterComposer,
          $$ProjectNotesTableOrderingComposer,
          $$ProjectNotesTableAnnotationComposer,
          $$ProjectNotesTableCreateCompanionBuilder,
          $$ProjectNotesTableUpdateCompanionBuilder,
          (
            ProjectNote,
            BaseReferences<_$AppDatabase, $ProjectNotesTable, ProjectNote>,
          ),
          ProjectNote,
          PrefetchHooks Function()
        > {
  $$ProjectNotesTableTableManager(_$AppDatabase db, $ProjectNotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectNotesCompanion(
                id: id,
                projectId: projectId,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String note,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProjectNotesCompanion.insert(
                id: id,
                projectId: projectId,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectNotesTable,
      ProjectNote,
      $$ProjectNotesTableFilterComposer,
      $$ProjectNotesTableOrderingComposer,
      $$ProjectNotesTableAnnotationComposer,
      $$ProjectNotesTableCreateCompanionBuilder,
      $$ProjectNotesTableUpdateCompanionBuilder,
      (
        ProjectNote,
        BaseReferences<_$AppDatabase, $ProjectNotesTable, ProjectNote>,
      ),
      ProjectNote,
      PrefetchHooks Function()
    >;
typedef $$ProjectTimeLogsTableCreateCompanionBuilder =
    ProjectTimeLogsCompanion Function({
      required String id,
      required String projectId,
      required int minutes,
      Value<String?> note,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ProjectTimeLogsTableUpdateCompanionBuilder =
    ProjectTimeLogsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<int> minutes,
      Value<String?> note,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ProjectTimeLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectTimeLogsTable> {
  $$ProjectTimeLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectTimeLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectTimeLogsTable> {
  $$ProjectTimeLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectTimeLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectTimeLogsTable> {
  $$ProjectTimeLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<int> get minutes =>
      $composableBuilder(column: $table.minutes, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProjectTimeLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectTimeLogsTable,
          ProjectTimeLog,
          $$ProjectTimeLogsTableFilterComposer,
          $$ProjectTimeLogsTableOrderingComposer,
          $$ProjectTimeLogsTableAnnotationComposer,
          $$ProjectTimeLogsTableCreateCompanionBuilder,
          $$ProjectTimeLogsTableUpdateCompanionBuilder,
          (
            ProjectTimeLog,
            BaseReferences<
              _$AppDatabase,
              $ProjectTimeLogsTable,
              ProjectTimeLog
            >,
          ),
          ProjectTimeLog,
          PrefetchHooks Function()
        > {
  $$ProjectTimeLogsTableTableManager(
    _$AppDatabase db,
    $ProjectTimeLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectTimeLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectTimeLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectTimeLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<int> minutes = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectTimeLogsCompanion(
                id: id,
                projectId: projectId,
                minutes: minutes,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required int minutes,
                Value<String?> note = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProjectTimeLogsCompanion.insert(
                id: id,
                projectId: projectId,
                minutes: minutes,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectTimeLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectTimeLogsTable,
      ProjectTimeLog,
      $$ProjectTimeLogsTableFilterComposer,
      $$ProjectTimeLogsTableOrderingComposer,
      $$ProjectTimeLogsTableAnnotationComposer,
      $$ProjectTimeLogsTableCreateCompanionBuilder,
      $$ProjectTimeLogsTableUpdateCompanionBuilder,
      (
        ProjectTimeLog,
        BaseReferences<_$AppDatabase, $ProjectTimeLogsTable, ProjectTimeLog>,
      ),
      ProjectTimeLog,
      PrefetchHooks Function()
    >;
typedef $$DiaryEntriesTableCreateCompanionBuilder =
    DiaryEntriesCompanion Function({
      required String id,
      required DateTime date,
      Value<int?> mood,
      Value<int?> energy,
      Value<int?> productivity,
      Value<String?> sleep,
      Value<String?> nutrition,
      Value<String?> training,
      Value<String?> studies,
      Value<String?> finances,
      Value<String?> victory,
      Value<String?> mistake,
      Value<String?> learning,
      Value<String?> freeNote,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$DiaryEntriesTableUpdateCompanionBuilder =
    DiaryEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<int?> mood,
      Value<int?> energy,
      Value<int?> productivity,
      Value<String?> sleep,
      Value<String?> nutrition,
      Value<String?> training,
      Value<String?> studies,
      Value<String?> finances,
      Value<String?> victory,
      Value<String?> mistake,
      Value<String?> learning,
      Value<String?> freeNote,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$DiaryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productivity => $composableBuilder(
    column: $table.productivity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sleep => $composableBuilder(
    column: $table.sleep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nutrition => $composableBuilder(
    column: $table.nutrition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get training => $composableBuilder(
    column: $table.training,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studies => $composableBuilder(
    column: $table.studies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get finances => $composableBuilder(
    column: $table.finances,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get victory => $composableBuilder(
    column: $table.victory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mistake => $composableBuilder(
    column: $table.mistake,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get learning => $composableBuilder(
    column: $table.learning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get freeNote => $composableBuilder(
    column: $table.freeNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiaryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productivity => $composableBuilder(
    column: $table.productivity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sleep => $composableBuilder(
    column: $table.sleep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nutrition => $composableBuilder(
    column: $table.nutrition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get training => $composableBuilder(
    column: $table.training,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studies => $composableBuilder(
    column: $table.studies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get finances => $composableBuilder(
    column: $table.finances,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get victory => $composableBuilder(
    column: $table.victory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mistake => $composableBuilder(
    column: $table.mistake,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get learning => $composableBuilder(
    column: $table.learning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get freeNote => $composableBuilder(
    column: $table.freeNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiaryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<int> get energy =>
      $composableBuilder(column: $table.energy, builder: (column) => column);

  GeneratedColumn<int> get productivity => $composableBuilder(
    column: $table.productivity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sleep =>
      $composableBuilder(column: $table.sleep, builder: (column) => column);

  GeneratedColumn<String> get nutrition =>
      $composableBuilder(column: $table.nutrition, builder: (column) => column);

  GeneratedColumn<String> get training =>
      $composableBuilder(column: $table.training, builder: (column) => column);

  GeneratedColumn<String> get studies =>
      $composableBuilder(column: $table.studies, builder: (column) => column);

  GeneratedColumn<String> get finances =>
      $composableBuilder(column: $table.finances, builder: (column) => column);

  GeneratedColumn<String> get victory =>
      $composableBuilder(column: $table.victory, builder: (column) => column);

  GeneratedColumn<String> get mistake =>
      $composableBuilder(column: $table.mistake, builder: (column) => column);

  GeneratedColumn<String> get learning =>
      $composableBuilder(column: $table.learning, builder: (column) => column);

  GeneratedColumn<String> get freeNote =>
      $composableBuilder(column: $table.freeNote, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DiaryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiaryEntriesTable,
          DiaryEntry,
          $$DiaryEntriesTableFilterComposer,
          $$DiaryEntriesTableOrderingComposer,
          $$DiaryEntriesTableAnnotationComposer,
          $$DiaryEntriesTableCreateCompanionBuilder,
          $$DiaryEntriesTableUpdateCompanionBuilder,
          (
            DiaryEntry,
            BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntry>,
          ),
          DiaryEntry,
          PrefetchHooks Function()
        > {
  $$DiaryEntriesTableTableManager(_$AppDatabase db, $DiaryEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiaryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiaryEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiaryEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int?> mood = const Value.absent(),
                Value<int?> energy = const Value.absent(),
                Value<int?> productivity = const Value.absent(),
                Value<String?> sleep = const Value.absent(),
                Value<String?> nutrition = const Value.absent(),
                Value<String?> training = const Value.absent(),
                Value<String?> studies = const Value.absent(),
                Value<String?> finances = const Value.absent(),
                Value<String?> victory = const Value.absent(),
                Value<String?> mistake = const Value.absent(),
                Value<String?> learning = const Value.absent(),
                Value<String?> freeNote = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiaryEntriesCompanion(
                id: id,
                date: date,
                mood: mood,
                energy: energy,
                productivity: productivity,
                sleep: sleep,
                nutrition: nutrition,
                training: training,
                studies: studies,
                finances: finances,
                victory: victory,
                mistake: mistake,
                learning: learning,
                freeNote: freeNote,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                Value<int?> mood = const Value.absent(),
                Value<int?> energy = const Value.absent(),
                Value<int?> productivity = const Value.absent(),
                Value<String?> sleep = const Value.absent(),
                Value<String?> nutrition = const Value.absent(),
                Value<String?> training = const Value.absent(),
                Value<String?> studies = const Value.absent(),
                Value<String?> finances = const Value.absent(),
                Value<String?> victory = const Value.absent(),
                Value<String?> mistake = const Value.absent(),
                Value<String?> learning = const Value.absent(),
                Value<String?> freeNote = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DiaryEntriesCompanion.insert(
                id: id,
                date: date,
                mood: mood,
                energy: energy,
                productivity: productivity,
                sleep: sleep,
                nutrition: nutrition,
                training: training,
                studies: studies,
                finances: finances,
                victory: victory,
                mistake: mistake,
                learning: learning,
                freeNote: freeNote,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiaryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiaryEntriesTable,
      DiaryEntry,
      $$DiaryEntriesTableFilterComposer,
      $$DiaryEntriesTableOrderingComposer,
      $$DiaryEntriesTableAnnotationComposer,
      $$DiaryEntriesTableCreateCompanionBuilder,
      $$DiaryEntriesTableUpdateCompanionBuilder,
      (
        DiaryEntry,
        BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntry>,
      ),
      DiaryEntry,
      PrefetchHooks Function()
    >;
typedef $$MoodLogsTableCreateCompanionBuilder =
    MoodLogsCompanion Function({
      required String id,
      required int value,
      Value<String?> note,
      required DateTime loggedAt,
      Value<int> rowid,
    });
typedef $$MoodLogsTableUpdateCompanionBuilder =
    MoodLogsCompanion Function({
      Value<String> id,
      Value<int> value,
      Value<String?> note,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

class $$MoodLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MoodLogsTable> {
  $$MoodLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MoodLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MoodLogsTable> {
  $$MoodLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MoodLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MoodLogsTable> {
  $$MoodLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$MoodLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MoodLogsTable,
          MoodLog,
          $$MoodLogsTableFilterComposer,
          $$MoodLogsTableOrderingComposer,
          $$MoodLogsTableAnnotationComposer,
          $$MoodLogsTableCreateCompanionBuilder,
          $$MoodLogsTableUpdateCompanionBuilder,
          (MoodLog, BaseReferences<_$AppDatabase, $MoodLogsTable, MoodLog>),
          MoodLog,
          PrefetchHooks Function()
        > {
  $$MoodLogsTableTableManager(_$AppDatabase db, $MoodLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoodLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoodLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoodLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MoodLogsCompanion(
                id: id,
                value: value,
                note: note,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int value,
                Value<String?> note = const Value.absent(),
                required DateTime loggedAt,
                Value<int> rowid = const Value.absent(),
              }) => MoodLogsCompanion.insert(
                id: id,
                value: value,
                note: note,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MoodLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MoodLogsTable,
      MoodLog,
      $$MoodLogsTableFilterComposer,
      $$MoodLogsTableOrderingComposer,
      $$MoodLogsTableAnnotationComposer,
      $$MoodLogsTableCreateCompanionBuilder,
      $$MoodLogsTableUpdateCompanionBuilder,
      (MoodLog, BaseReferences<_$AppDatabase, $MoodLogsTable, MoodLog>),
      MoodLog,
      PrefetchHooks Function()
    >;
typedef $$EnergyLogsTableCreateCompanionBuilder =
    EnergyLogsCompanion Function({
      required String id,
      required int value,
      Value<String?> note,
      required DateTime loggedAt,
      Value<int> rowid,
    });
typedef $$EnergyLogsTableUpdateCompanionBuilder =
    EnergyLogsCompanion Function({
      Value<String> id,
      Value<int> value,
      Value<String?> note,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

class $$EnergyLogsTableFilterComposer
    extends Composer<_$AppDatabase, $EnergyLogsTable> {
  $$EnergyLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EnergyLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $EnergyLogsTable> {
  $$EnergyLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnergyLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnergyLogsTable> {
  $$EnergyLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$EnergyLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnergyLogsTable,
          EnergyLog,
          $$EnergyLogsTableFilterComposer,
          $$EnergyLogsTableOrderingComposer,
          $$EnergyLogsTableAnnotationComposer,
          $$EnergyLogsTableCreateCompanionBuilder,
          $$EnergyLogsTableUpdateCompanionBuilder,
          (
            EnergyLog,
            BaseReferences<_$AppDatabase, $EnergyLogsTable, EnergyLog>,
          ),
          EnergyLog,
          PrefetchHooks Function()
        > {
  $$EnergyLogsTableTableManager(_$AppDatabase db, $EnergyLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnergyLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnergyLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnergyLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnergyLogsCompanion(
                id: id,
                value: value,
                note: note,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int value,
                Value<String?> note = const Value.absent(),
                required DateTime loggedAt,
                Value<int> rowid = const Value.absent(),
              }) => EnergyLogsCompanion.insert(
                id: id,
                value: value,
                note: note,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EnergyLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnergyLogsTable,
      EnergyLog,
      $$EnergyLogsTableFilterComposer,
      $$EnergyLogsTableOrderingComposer,
      $$EnergyLogsTableAnnotationComposer,
      $$EnergyLogsTableCreateCompanionBuilder,
      $$EnergyLogsTableUpdateCompanionBuilder,
      (EnergyLog, BaseReferences<_$AppDatabase, $EnergyLogsTable, EnergyLog>),
      EnergyLog,
      PrefetchHooks Function()
    >;
typedef $$HabitsTableCreateCompanionBuilder =
    HabitsCompanion Function({
      required String id,
      required String name,
      Value<String?> lifeArea,
      Value<String> frequency,
      Value<String?> trigger,
      Value<String?> action,
      Value<String?> metric,
      Value<int> xpReward,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$HabitsTableUpdateCompanionBuilder =
    HabitsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> lifeArea,
      Value<String> frequency,
      Value<String?> trigger,
      Value<String?> action,
      Value<String?> metric,
      Value<int> xpReward,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifeArea => $composableBuilder(
    column: $table.lifeArea,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metric => $composableBuilder(
    column: $table.metric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifeArea => $composableBuilder(
    column: $table.lifeArea,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metric => $composableBuilder(
    column: $table.metric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lifeArea =>
      $composableBuilder(column: $table.lifeArea, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get metric =>
      $composableBuilder(column: $table.metric, builder: (column) => column);

  GeneratedColumn<int> get xpReward =>
      $composableBuilder(column: $table.xpReward, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HabitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitsTable,
          Habit,
          $$HabitsTableFilterComposer,
          $$HabitsTableOrderingComposer,
          $$HabitsTableAnnotationComposer,
          $$HabitsTableCreateCompanionBuilder,
          $$HabitsTableUpdateCompanionBuilder,
          (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
          Habit,
          PrefetchHooks Function()
        > {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> lifeArea = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String?> trigger = const Value.absent(),
                Value<String?> action = const Value.absent(),
                Value<String?> metric = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitsCompanion(
                id: id,
                name: name,
                lifeArea: lifeArea,
                frequency: frequency,
                trigger: trigger,
                action: action,
                metric: metric,
                xpReward: xpReward,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> lifeArea = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String?> trigger = const Value.absent(),
                Value<String?> action = const Value.absent(),
                Value<String?> metric = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => HabitsCompanion.insert(
                id: id,
                name: name,
                lifeArea: lifeArea,
                frequency: frequency,
                trigger: trigger,
                action: action,
                metric: metric,
                xpReward: xpReward,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HabitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitsTable,
      Habit,
      $$HabitsTableFilterComposer,
      $$HabitsTableOrderingComposer,
      $$HabitsTableAnnotationComposer,
      $$HabitsTableCreateCompanionBuilder,
      $$HabitsTableUpdateCompanionBuilder,
      (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
      Habit,
      PrefetchHooks Function()
    >;
typedef $$HabitLogsTableCreateCompanionBuilder =
    HabitLogsCompanion Function({
      required String id,
      required String habitId,
      required DateTime date,
      Value<bool> isDone,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$HabitLogsTableUpdateCompanionBuilder =
    HabitLogsCompanion Function({
      Value<String> id,
      Value<String> habitId,
      Value<DateTime> date,
      Value<bool> isDone,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$HabitLogsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get habitId => $composableBuilder(
    column: $table.habitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HabitLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get habitId => $composableBuilder(
    column: $table.habitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get habitId =>
      $composableBuilder(column: $table.habitId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HabitLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitLogsTable,
          HabitLog,
          $$HabitLogsTableFilterComposer,
          $$HabitLogsTableOrderingComposer,
          $$HabitLogsTableAnnotationComposer,
          $$HabitLogsTableCreateCompanionBuilder,
          $$HabitLogsTableUpdateCompanionBuilder,
          (HabitLog, BaseReferences<_$AppDatabase, $HabitLogsTable, HabitLog>),
          HabitLog,
          PrefetchHooks Function()
        > {
  $$HabitLogsTableTableManager(_$AppDatabase db, $HabitLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> habitId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitLogsCompanion(
                id: id,
                habitId: habitId,
                date: date,
                isDone: isDone,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String habitId,
                required DateTime date,
                Value<bool> isDone = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => HabitLogsCompanion.insert(
                id: id,
                habitId: habitId,
                date: date,
                isDone: isDone,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HabitLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitLogsTable,
      HabitLog,
      $$HabitLogsTableFilterComposer,
      $$HabitLogsTableOrderingComposer,
      $$HabitLogsTableAnnotationComposer,
      $$HabitLogsTableCreateCompanionBuilder,
      $$HabitLogsTableUpdateCompanionBuilder,
      (HabitLog, BaseReferences<_$AppDatabase, $HabitLogsTable, HabitLog>),
      HabitLog,
      PrefetchHooks Function()
    >;
typedef $$LifeAreasTableCreateCompanionBuilder =
    LifeAreasCompanion Function({
      required String id,
      required String name,
      Value<String?> colorHex,
      Value<int> sortOrder,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$LifeAreasTableUpdateCompanionBuilder =
    LifeAreasCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> colorHex,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$LifeAreasTableFilterComposer
    extends Composer<_$AppDatabase, $LifeAreasTable> {
  $$LifeAreasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LifeAreasTableOrderingComposer
    extends Composer<_$AppDatabase, $LifeAreasTable> {
  $$LifeAreasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LifeAreasTableAnnotationComposer
    extends Composer<_$AppDatabase, $LifeAreasTable> {
  $$LifeAreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LifeAreasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LifeAreasTable,
          LifeArea,
          $$LifeAreasTableFilterComposer,
          $$LifeAreasTableOrderingComposer,
          $$LifeAreasTableAnnotationComposer,
          $$LifeAreasTableCreateCompanionBuilder,
          $$LifeAreasTableUpdateCompanionBuilder,
          (LifeArea, BaseReferences<_$AppDatabase, $LifeAreasTable, LifeArea>),
          LifeArea,
          PrefetchHooks Function()
        > {
  $$LifeAreasTableTableManager(_$AppDatabase db, $LifeAreasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LifeAreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LifeAreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LifeAreasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LifeAreasCompanion(
                id: id,
                name: name,
                colorHex: colorHex,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> colorHex = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => LifeAreasCompanion.insert(
                id: id,
                name: name,
                colorHex: colorHex,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LifeAreasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LifeAreasTable,
      LifeArea,
      $$LifeAreasTableFilterComposer,
      $$LifeAreasTableOrderingComposer,
      $$LifeAreasTableAnnotationComposer,
      $$LifeAreasTableCreateCompanionBuilder,
      $$LifeAreasTableUpdateCompanionBuilder,
      (LifeArea, BaseReferences<_$AppDatabase, $LifeAreasTable, LifeArea>),
      LifeArea,
      PrefetchHooks Function()
    >;
typedef $$LifeAreaScoresTableCreateCompanionBuilder =
    LifeAreaScoresCompanion Function({
      required String id,
      required String lifeAreaId,
      required DateTime weekStart,
      required int score,
      Value<String?> source,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$LifeAreaScoresTableUpdateCompanionBuilder =
    LifeAreaScoresCompanion Function({
      Value<String> id,
      Value<String> lifeAreaId,
      Value<DateTime> weekStart,
      Value<int> score,
      Value<String?> source,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$LifeAreaScoresTableFilterComposer
    extends Composer<_$AppDatabase, $LifeAreaScoresTable> {
  $$LifeAreaScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifeAreaId => $composableBuilder(
    column: $table.lifeAreaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weekStart => $composableBuilder(
    column: $table.weekStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LifeAreaScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $LifeAreaScoresTable> {
  $$LifeAreaScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifeAreaId => $composableBuilder(
    column: $table.lifeAreaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weekStart => $composableBuilder(
    column: $table.weekStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LifeAreaScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $LifeAreaScoresTable> {
  $$LifeAreaScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lifeAreaId => $composableBuilder(
    column: $table.lifeAreaId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get weekStart =>
      $composableBuilder(column: $table.weekStart, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LifeAreaScoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LifeAreaScoresTable,
          LifeAreaScore,
          $$LifeAreaScoresTableFilterComposer,
          $$LifeAreaScoresTableOrderingComposer,
          $$LifeAreaScoresTableAnnotationComposer,
          $$LifeAreaScoresTableCreateCompanionBuilder,
          $$LifeAreaScoresTableUpdateCompanionBuilder,
          (
            LifeAreaScore,
            BaseReferences<_$AppDatabase, $LifeAreaScoresTable, LifeAreaScore>,
          ),
          LifeAreaScore,
          PrefetchHooks Function()
        > {
  $$LifeAreaScoresTableTableManager(
    _$AppDatabase db,
    $LifeAreaScoresTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LifeAreaScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LifeAreaScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LifeAreaScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> lifeAreaId = const Value.absent(),
                Value<DateTime> weekStart = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LifeAreaScoresCompanion(
                id: id,
                lifeAreaId: lifeAreaId,
                weekStart: weekStart,
                score: score,
                source: source,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String lifeAreaId,
                required DateTime weekStart,
                required int score,
                Value<String?> source = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => LifeAreaScoresCompanion.insert(
                id: id,
                lifeAreaId: lifeAreaId,
                weekStart: weekStart,
                score: score,
                source: source,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LifeAreaScoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LifeAreaScoresTable,
      LifeAreaScore,
      $$LifeAreaScoresTableFilterComposer,
      $$LifeAreaScoresTableOrderingComposer,
      $$LifeAreaScoresTableAnnotationComposer,
      $$LifeAreaScoresTableCreateCompanionBuilder,
      $$LifeAreaScoresTableUpdateCompanionBuilder,
      (
        LifeAreaScore,
        BaseReferences<_$AppDatabase, $LifeAreaScoresTable, LifeAreaScore>,
      ),
      LifeAreaScore,
      PrefetchHooks Function()
    >;
typedef $$XpLogsTableCreateCompanionBuilder =
    XpLogsCompanion Function({
      required String id,
      required int amount,
      required String source,
      Value<String?> note,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$XpLogsTableUpdateCompanionBuilder =
    XpLogsCompanion Function({
      Value<String> id,
      Value<int> amount,
      Value<String> source,
      Value<String?> note,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$XpLogsTableFilterComposer
    extends Composer<_$AppDatabase, $XpLogsTable> {
  $$XpLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$XpLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $XpLogsTable> {
  $$XpLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$XpLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $XpLogsTable> {
  $$XpLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$XpLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $XpLogsTable,
          XpLog,
          $$XpLogsTableFilterComposer,
          $$XpLogsTableOrderingComposer,
          $$XpLogsTableAnnotationComposer,
          $$XpLogsTableCreateCompanionBuilder,
          $$XpLogsTableUpdateCompanionBuilder,
          (XpLog, BaseReferences<_$AppDatabase, $XpLogsTable, XpLog>),
          XpLog,
          PrefetchHooks Function()
        > {
  $$XpLogsTableTableManager(_$AppDatabase db, $XpLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$XpLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$XpLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$XpLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => XpLogsCompanion(
                id: id,
                amount: amount,
                source: source,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int amount,
                required String source,
                Value<String?> note = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => XpLogsCompanion.insert(
                id: id,
                amount: amount,
                source: source,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$XpLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $XpLogsTable,
      XpLog,
      $$XpLogsTableFilterComposer,
      $$XpLogsTableOrderingComposer,
      $$XpLogsTableAnnotationComposer,
      $$XpLogsTableCreateCompanionBuilder,
      $$XpLogsTableUpdateCompanionBuilder,
      (XpLog, BaseReferences<_$AppDatabase, $XpLogsTable, XpLog>),
      XpLog,
      PrefetchHooks Function()
    >;
typedef $$LevelsTableCreateCompanionBuilder =
    LevelsCompanion Function({
      required String id,
      required int level,
      required String title,
      required int requiredXp,
      Value<int> rowid,
    });
typedef $$LevelsTableUpdateCompanionBuilder =
    LevelsCompanion Function({
      Value<String> id,
      Value<int> level,
      Value<String> title,
      Value<int> requiredXp,
      Value<int> rowid,
    });

class $$LevelsTableFilterComposer
    extends Composer<_$AppDatabase, $LevelsTable> {
  $$LevelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requiredXp => $composableBuilder(
    column: $table.requiredXp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LevelsTableOrderingComposer
    extends Composer<_$AppDatabase, $LevelsTable> {
  $$LevelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requiredXp => $composableBuilder(
    column: $table.requiredXp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LevelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LevelsTable> {
  $$LevelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get requiredXp => $composableBuilder(
    column: $table.requiredXp,
    builder: (column) => column,
  );
}

class $$LevelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LevelsTable,
          Level,
          $$LevelsTableFilterComposer,
          $$LevelsTableOrderingComposer,
          $$LevelsTableAnnotationComposer,
          $$LevelsTableCreateCompanionBuilder,
          $$LevelsTableUpdateCompanionBuilder,
          (Level, BaseReferences<_$AppDatabase, $LevelsTable, Level>),
          Level,
          PrefetchHooks Function()
        > {
  $$LevelsTableTableManager(_$AppDatabase db, $LevelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LevelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LevelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LevelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> requiredXp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LevelsCompanion(
                id: id,
                level: level,
                title: title,
                requiredXp: requiredXp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int level,
                required String title,
                required int requiredXp,
                Value<int> rowid = const Value.absent(),
              }) => LevelsCompanion.insert(
                id: id,
                level: level,
                title: title,
                requiredXp: requiredXp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LevelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LevelsTable,
      Level,
      $$LevelsTableFilterComposer,
      $$LevelsTableOrderingComposer,
      $$LevelsTableAnnotationComposer,
      $$LevelsTableCreateCompanionBuilder,
      $$LevelsTableUpdateCompanionBuilder,
      (Level, BaseReferences<_$AppDatabase, $LevelsTable, Level>),
      Level,
      PrefetchHooks Function()
    >;
typedef $$AchievementsTableCreateCompanionBuilder =
    AchievementsCompanion Function({
      required String id,
      required String name,
      required String description,
      Value<String?> icon,
      Value<int> xpReward,
      Value<int> rowid,
    });
typedef $$AchievementsTableUpdateCompanionBuilder =
    AchievementsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<String?> icon,
      Value<int> xpReward,
      Value<int> rowid,
    });

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpReward => $composableBuilder(
    column: $table.xpReward,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<int> get xpReward =>
      $composableBuilder(column: $table.xpReward, builder: (column) => column);
}

class $$AchievementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementsTable,
          Achievement,
          $$AchievementsTableFilterComposer,
          $$AchievementsTableOrderingComposer,
          $$AchievementsTableAnnotationComposer,
          $$AchievementsTableCreateCompanionBuilder,
          $$AchievementsTableUpdateCompanionBuilder,
          (
            Achievement,
            BaseReferences<_$AppDatabase, $AchievementsTable, Achievement>,
          ),
          Achievement,
          PrefetchHooks Function()
        > {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion(
                id: id,
                name: name,
                description: description,
                icon: icon,
                xpReward: xpReward,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                Value<String?> icon = const Value.absent(),
                Value<int> xpReward = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion.insert(
                id: id,
                name: name,
                description: description,
                icon: icon,
                xpReward: xpReward,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AchievementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementsTable,
      Achievement,
      $$AchievementsTableFilterComposer,
      $$AchievementsTableOrderingComposer,
      $$AchievementsTableAnnotationComposer,
      $$AchievementsTableCreateCompanionBuilder,
      $$AchievementsTableUpdateCompanionBuilder,
      (
        Achievement,
        BaseReferences<_$AppDatabase, $AchievementsTable, Achievement>,
      ),
      Achievement,
      PrefetchHooks Function()
    >;
typedef $$AchievementUnlocksTableCreateCompanionBuilder =
    AchievementUnlocksCompanion Function({
      required String id,
      required String achievementId,
      required DateTime unlockedAt,
      Value<int> rowid,
    });
typedef $$AchievementUnlocksTableUpdateCompanionBuilder =
    AchievementUnlocksCompanion Function({
      Value<String> id,
      Value<String> achievementId,
      Value<DateTime> unlockedAt,
      Value<int> rowid,
    });

class $$AchievementUnlocksTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementUnlocksTable> {
  $$AchievementUnlocksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AchievementUnlocksTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementUnlocksTable> {
  $$AchievementUnlocksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AchievementUnlocksTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementUnlocksTable> {
  $$AchievementUnlocksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );
}

class $$AchievementUnlocksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementUnlocksTable,
          AchievementUnlock,
          $$AchievementUnlocksTableFilterComposer,
          $$AchievementUnlocksTableOrderingComposer,
          $$AchievementUnlocksTableAnnotationComposer,
          $$AchievementUnlocksTableCreateCompanionBuilder,
          $$AchievementUnlocksTableUpdateCompanionBuilder,
          (
            AchievementUnlock,
            BaseReferences<
              _$AppDatabase,
              $AchievementUnlocksTable,
              AchievementUnlock
            >,
          ),
          AchievementUnlock,
          PrefetchHooks Function()
        > {
  $$AchievementUnlocksTableTableManager(
    _$AppDatabase db,
    $AchievementUnlocksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementUnlocksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementUnlocksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementUnlocksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> achievementId = const Value.absent(),
                Value<DateTime> unlockedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementUnlocksCompanion(
                id: id,
                achievementId: achievementId,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String achievementId,
                required DateTime unlockedAt,
                Value<int> rowid = const Value.absent(),
              }) => AchievementUnlocksCompanion.insert(
                id: id,
                achievementId: achievementId,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AchievementUnlocksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementUnlocksTable,
      AchievementUnlock,
      $$AchievementUnlocksTableFilterComposer,
      $$AchievementUnlocksTableOrderingComposer,
      $$AchievementUnlocksTableAnnotationComposer,
      $$AchievementUnlocksTableCreateCompanionBuilder,
      $$AchievementUnlocksTableUpdateCompanionBuilder,
      (
        AchievementUnlock,
        BaseReferences<
          _$AppDatabase,
          $AchievementUnlocksTable,
          AchievementUnlock
        >,
      ),
      AchievementUnlock,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$UserPreferencesTableCreateCompanionBuilder =
    UserPreferencesCompanion Function({
      required String id,
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UserPreferencesTableUpdateCompanionBuilder =
    UserPreferencesCompanion Function({
      Value<String> id,
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$UserPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $UserPreferencesTable> {
  $$UserPreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserPreferencesTable> {
  $$UserPreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserPreferencesTable> {
  $$UserPreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserPreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserPreferencesTable,
          UserPreference,
          $$UserPreferencesTableFilterComposer,
          $$UserPreferencesTableOrderingComposer,
          $$UserPreferencesTableAnnotationComposer,
          $$UserPreferencesTableCreateCompanionBuilder,
          $$UserPreferencesTableUpdateCompanionBuilder,
          (
            UserPreference,
            BaseReferences<
              _$AppDatabase,
              $UserPreferencesTable,
              UserPreference
            >,
          ),
          UserPreference,
          PrefetchHooks Function()
        > {
  $$UserPreferencesTableTableManager(
    _$AppDatabase db,
    $UserPreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserPreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserPreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserPreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserPreferencesCompanion(
                id: id,
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserPreferencesCompanion.insert(
                id: id,
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserPreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserPreferencesTable,
      UserPreference,
      $$UserPreferencesTableFilterComposer,
      $$UserPreferencesTableOrderingComposer,
      $$UserPreferencesTableAnnotationComposer,
      $$UserPreferencesTableCreateCompanionBuilder,
      $$UserPreferencesTableUpdateCompanionBuilder,
      (
        UserPreference,
        BaseReferences<_$AppDatabase, $UserPreferencesTable, UserPreference>,
      ),
      UserPreference,
      PrefetchHooks Function()
    >;
typedef $$AiHistoryEntriesTableCreateCompanionBuilder =
    AiHistoryEntriesCompanion Function({
      required String id,
      required String userMessage,
      required String aiResponse,
      required String actionType,
      required String module,
      Value<String?> metadataJson,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AiHistoryEntriesTableUpdateCompanionBuilder =
    AiHistoryEntriesCompanion Function({
      Value<String> id,
      Value<String> userMessage,
      Value<String> aiResponse,
      Value<String> actionType,
      Value<String> module,
      Value<String?> metadataJson,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$AiHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $AiHistoryEntriesTable> {
  $$AiHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userMessage => $composableBuilder(
    column: $table.userMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aiResponse => $composableBuilder(
    column: $table.aiResponse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get module => $composableBuilder(
    column: $table.module,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AiHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AiHistoryEntriesTable> {
  $$AiHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userMessage => $composableBuilder(
    column: $table.userMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aiResponse => $composableBuilder(
    column: $table.aiResponse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get module => $composableBuilder(
    column: $table.module,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AiHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiHistoryEntriesTable> {
  $$AiHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userMessage => $composableBuilder(
    column: $table.userMessage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get aiResponse => $composableBuilder(
    column: $table.aiResponse,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get module =>
      $composableBuilder(column: $table.module, builder: (column) => column);

  GeneratedColumn<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AiHistoryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiHistoryEntriesTable,
          AiHistoryEntry,
          $$AiHistoryEntriesTableFilterComposer,
          $$AiHistoryEntriesTableOrderingComposer,
          $$AiHistoryEntriesTableAnnotationComposer,
          $$AiHistoryEntriesTableCreateCompanionBuilder,
          $$AiHistoryEntriesTableUpdateCompanionBuilder,
          (
            AiHistoryEntry,
            BaseReferences<
              _$AppDatabase,
              $AiHistoryEntriesTable,
              AiHistoryEntry
            >,
          ),
          AiHistoryEntry,
          PrefetchHooks Function()
        > {
  $$AiHistoryEntriesTableTableManager(
    _$AppDatabase db,
    $AiHistoryEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiHistoryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiHistoryEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiHistoryEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userMessage = const Value.absent(),
                Value<String> aiResponse = const Value.absent(),
                Value<String> actionType = const Value.absent(),
                Value<String> module = const Value.absent(),
                Value<String?> metadataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AiHistoryEntriesCompanion(
                id: id,
                userMessage: userMessage,
                aiResponse: aiResponse,
                actionType: actionType,
                module: module,
                metadataJson: metadataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userMessage,
                required String aiResponse,
                required String actionType,
                required String module,
                Value<String?> metadataJson = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AiHistoryEntriesCompanion.insert(
                id: id,
                userMessage: userMessage,
                aiResponse: aiResponse,
                actionType: actionType,
                module: module,
                metadataJson: metadataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AiHistoryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiHistoryEntriesTable,
      AiHistoryEntry,
      $$AiHistoryEntriesTableFilterComposer,
      $$AiHistoryEntriesTableOrderingComposer,
      $$AiHistoryEntriesTableAnnotationComposer,
      $$AiHistoryEntriesTableCreateCompanionBuilder,
      $$AiHistoryEntriesTableUpdateCompanionBuilder,
      (
        AiHistoryEntry,
        BaseReferences<_$AppDatabase, $AiHistoryEntriesTable, AiHistoryEntry>,
      ),
      AiHistoryEntry,
      PrefetchHooks Function()
    >;
typedef $$AiNotesTableCreateCompanionBuilder =
    AiNotesCompanion Function({
      required String id,
      required String content,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AiNotesTableUpdateCompanionBuilder =
    AiNotesCompanion Function({
      Value<String> id,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$AiNotesTableFilterComposer
    extends Composer<_$AppDatabase, $AiNotesTable> {
  $$AiNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AiNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $AiNotesTable> {
  $$AiNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AiNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiNotesTable> {
  $$AiNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AiNotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiNotesTable,
          AiNote,
          $$AiNotesTableFilterComposer,
          $$AiNotesTableOrderingComposer,
          $$AiNotesTableAnnotationComposer,
          $$AiNotesTableCreateCompanionBuilder,
          $$AiNotesTableUpdateCompanionBuilder,
          (AiNote, BaseReferences<_$AppDatabase, $AiNotesTable, AiNote>),
          AiNote,
          PrefetchHooks Function()
        > {
  $$AiNotesTableTableManager(_$AppDatabase db, $AiNotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AiNotesCompanion(
                id: id,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String content,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AiNotesCompanion.insert(
                id: id,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AiNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiNotesTable,
      AiNote,
      $$AiNotesTableFilterComposer,
      $$AiNotesTableOrderingComposer,
      $$AiNotesTableAnnotationComposer,
      $$AiNotesTableCreateCompanionBuilder,
      $$AiNotesTableUpdateCompanionBuilder,
      (AiNote, BaseReferences<_$AppDatabase, $AiNotesTable, AiNote>),
      AiNote,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RoutineTemplatesTableTableManager get routineTemplates =>
      $$RoutineTemplatesTableTableManager(_db, _db.routineTemplates);
  $$RoutineEventsTableTableManager get routineEvents =>
      $$RoutineEventsTableTableManager(_db, _db.routineEvents);
  $$RoutineOverridesTableTableManager get routineOverrides =>
      $$RoutineOverridesTableTableManager(_db, _db.routineOverrides);
  $$RoutineEventLogsTableTableManager get routineEventLogs =>
      $$RoutineEventLogsTableTableManager(_db, _db.routineEventLogs);
  $$DailyMissionsTableTableManager get dailyMissions =>
      $$DailyMissionsTableTableManager(_db, _db.dailyMissions);
  $$MissionTasksTableTableManager get missionTasks =>
      $$MissionTasksTableTableManager(_db, _db.missionTasks);
  $$MissionLogsTableTableManager get missionLogs =>
      $$MissionLogsTableTableManager(_db, _db.missionLogs);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$TaskCategoriesTableTableManager get taskCategories =>
      $$TaskCategoriesTableTableManager(_db, _db.taskCategories);
  $$TaskLogsTableTableManager get taskLogs =>
      $$TaskLogsTableTableManager(_db, _db.taskLogs);
  $$FoodsTableTableManager get foods =>
      $$FoodsTableTableManager(_db, _db.foods);
  $$FoodLogsTableTableManager get foodLogs =>
      $$FoodLogsTableTableManager(_db, _db.foodLogs);
  $$WaterLogsTableTableManager get waterLogs =>
      $$WaterLogsTableTableManager(_db, _db.waterLogs);
  $$NutritionGoalsTableTableManager get nutritionGoals =>
      $$NutritionGoalsTableTableManager(_db, _db.nutritionGoals);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db, _db.workouts);
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(_db, _db.workoutSessions);
  $$WorkoutSessionStepsTableTableManager get workoutSessionSteps =>
      $$WorkoutSessionStepsTableTableManager(_db, _db.workoutSessionSteps);
  $$WorkoutLogsTableTableManager get workoutLogs =>
      $$WorkoutLogsTableTableManager(_db, _db.workoutLogs);
  $$StudySubjectsTableTableManager get studySubjects =>
      $$StudySubjectsTableTableManager(_db, _db.studySubjects);
  $$StudyUnitsTableTableManager get studyUnits =>
      $$StudyUnitsTableTableManager(_db, _db.studyUnits);
  $$StudySessionsTableTableManager get studySessions =>
      $$StudySessionsTableTableManager(_db, _db.studySessions);
  $$StudyReviewsTableTableManager get studyReviews =>
      $$StudyReviewsTableTableManager(_db, _db.studyReviews);
  $$FinanceCategoriesTableTableManager get financeCategories =>
      $$FinanceCategoriesTableTableManager(_db, _db.financeCategories);
  $$FinanceTransactionsTableTableManager get financeTransactions =>
      $$FinanceTransactionsTableTableManager(_db, _db.financeTransactions);
  $$FixedExpensesTableTableManager get fixedExpenses =>
      $$FixedExpensesTableTableManager(_db, _db.fixedExpenses);
  $$FinancialGoalsTableTableManager get financialGoals =>
      $$FinancialGoalsTableTableManager(_db, _db.financialGoals);
  $$ReceiptImagesTableTableManager get receiptImages =>
      $$ReceiptImagesTableTableManager(_db, _db.receiptImages);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$ProjectTasksTableTableManager get projectTasks =>
      $$ProjectTasksTableTableManager(_db, _db.projectTasks);
  $$ProjectNotesTableTableManager get projectNotes =>
      $$ProjectNotesTableTableManager(_db, _db.projectNotes);
  $$ProjectTimeLogsTableTableManager get projectTimeLogs =>
      $$ProjectTimeLogsTableTableManager(_db, _db.projectTimeLogs);
  $$DiaryEntriesTableTableManager get diaryEntries =>
      $$DiaryEntriesTableTableManager(_db, _db.diaryEntries);
  $$MoodLogsTableTableManager get moodLogs =>
      $$MoodLogsTableTableManager(_db, _db.moodLogs);
  $$EnergyLogsTableTableManager get energyLogs =>
      $$EnergyLogsTableTableManager(_db, _db.energyLogs);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$HabitLogsTableTableManager get habitLogs =>
      $$HabitLogsTableTableManager(_db, _db.habitLogs);
  $$LifeAreasTableTableManager get lifeAreas =>
      $$LifeAreasTableTableManager(_db, _db.lifeAreas);
  $$LifeAreaScoresTableTableManager get lifeAreaScores =>
      $$LifeAreaScoresTableTableManager(_db, _db.lifeAreaScores);
  $$XpLogsTableTableManager get xpLogs =>
      $$XpLogsTableTableManager(_db, _db.xpLogs);
  $$LevelsTableTableManager get levels =>
      $$LevelsTableTableManager(_db, _db.levels);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$AchievementUnlocksTableTableManager get achievementUnlocks =>
      $$AchievementUnlocksTableTableManager(_db, _db.achievementUnlocks);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$UserPreferencesTableTableManager get userPreferences =>
      $$UserPreferencesTableTableManager(_db, _db.userPreferences);
  $$AiHistoryEntriesTableTableManager get aiHistoryEntries =>
      $$AiHistoryEntriesTableTableManager(_db, _db.aiHistoryEntries);
  $$AiNotesTableTableManager get aiNotes =>
      $$AiNotesTableTableManager(_db, _db.aiNotes);
}
