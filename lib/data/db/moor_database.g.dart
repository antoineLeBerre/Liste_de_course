// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Liste extends DataClass implements Insertable<Liste> {
  final int id;
  final String title;
  Liste({required this.id, required this.title});
  factory Liste.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Liste(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  ListesCompanion toCompanion(bool nullToAbsent) {
    return ListesCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Liste.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Liste(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Liste copyWith({int? id, String? title}) => Liste(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Liste(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, title.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Liste && other.id == this.id && other.title == this.title);
}

class ListesCompanion extends UpdateCompanion<Liste> {
  final Value<int> id;
  final Value<String> title;
  const ListesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  ListesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<Liste> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  ListesCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return ListesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $ListesTable extends Listes with TableInfo<$ListesTable, Liste> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ListesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'listes';
  @override
  String get actualTableName => 'listes';
  @override
  VerificationContext validateIntegrity(Insertable<Liste> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Liste map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Liste.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ListesTable createAlias(String alias) {
    return $ListesTable(_db, alias);
  }
}

class Element extends DataClass implements Insertable<Element> {
  final int id;
  final String title;
  final bool checked;
  Element({required this.id, required this.title, required this.checked});
  factory Element.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Element(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      checked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}checked'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['checked'] = Variable<bool>(checked);
    return map;
  }

  ElementsCompanion toCompanion(bool nullToAbsent) {
    return ElementsCompanion(
      id: Value(id),
      title: Value(title),
      checked: Value(checked),
    );
  }

  factory Element.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Element(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      checked: serializer.fromJson<bool>(json['checked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'checked': serializer.toJson<bool>(checked),
    };
  }

  Element copyWith({int? id, String? title, bool? checked}) => Element(
        id: id ?? this.id,
        title: title ?? this.title,
        checked: checked ?? this.checked,
      );
  @override
  String toString() {
    return (StringBuffer('Element(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(title.hashCode, checked.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Element &&
          other.id == this.id &&
          other.title == this.title &&
          other.checked == this.checked);
}

class ElementsCompanion extends UpdateCompanion<Element> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> checked;
  const ElementsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.checked = const Value.absent(),
  });
  ElementsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.checked = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Element> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? checked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (checked != null) 'checked': checked,
    });
  }

  ElementsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<bool>? checked}) {
    return ElementsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      checked: checked ?? this.checked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (checked.present) {
      map['checked'] = Variable<bool>(checked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ElementsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }
}

class $ElementsTable extends Elements with TableInfo<$ElementsTable, Element> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ElementsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _checkedMeta = const VerificationMeta('checked');
  late final GeneratedColumn<bool?> checked = GeneratedColumn<bool?>(
      'checked', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (checked IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, title, checked];
  @override
  String get aliasedName => _alias ?? 'elements';
  @override
  String get actualTableName => 'elements';
  @override
  VerificationContext validateIntegrity(Insertable<Element> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('checked')) {
      context.handle(_checkedMeta,
          checked.isAcceptableOrUnknown(data['checked']!, _checkedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Element map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Element.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ElementsTable createAlias(String alias) {
    return $ElementsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ListesTable listes = $ListesTable(this);
  late final $ElementsTable elements = $ElementsTable(this);
  late final ListeDao listeDao = ListeDao(this as AppDatabase);
  late final ElementDao elementDao = ElementDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [listes, elements];
}
