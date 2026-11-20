// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DbmsTableTable extends DbmsTable
    with TableInfo<$DbmsTableTable, DbmsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbmsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'desc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, desc, imagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dbms_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbmsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['desc']!, _descMeta),
      );
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbmsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbmsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
    );
  }

  @override
  $DbmsTableTable createAlias(String alias) {
    return $DbmsTableTable(attachedDatabase, alias);
  }
}

class DbmsRow extends DataClass implements Insertable<DbmsRow> {
  final int id;
  final String name;
  final String desc;
  final String imagePath;
  const DbmsRow({
    required this.id,
    required this.name,
    required this.desc,
    required this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    map['image_path'] = Variable<String>(imagePath);
    return map;
  }

  DbmsTableCompanion toCompanion(bool nullToAbsent) {
    return DbmsTableCompanion(
      id: Value(id),
      name: Value(name),
      desc: Value(desc),
      imagePath: Value(imagePath),
    );
  }

  factory DbmsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbmsRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'imagePath': serializer.toJson<String>(imagePath),
    };
  }

  DbmsRow copyWith({int? id, String? name, String? desc, String? imagePath}) =>
      DbmsRow(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        imagePath: imagePath ?? this.imagePath,
      );
  DbmsRow copyWithCompanion(DbmsTableCompanion data) {
    return DbmsRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbmsRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, desc, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbmsRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.imagePath == this.imagePath);
}

class DbmsTableCompanion extends UpdateCompanion<DbmsRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> desc;
  final Value<String> imagePath;
  const DbmsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  DbmsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String desc,
    required String imagePath,
  }) : name = Value(name),
       desc = Value(desc),
       imagePath = Value(imagePath);
  static Insertable<DbmsRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  DbmsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? desc,
    Value<String>? imagePath,
  }) {
    return DbmsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbmsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DbmsTableTable dbmsTable = $DbmsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbmsTable];
}

typedef $$DbmsTableTableCreateCompanionBuilder = DbmsTableCompanion Function({
  Value<int> id,
  required String name,
  required String desc,
  required String imagePath,
});
typedef $$DbmsTableTableUpdateCompanionBuilder = DbmsTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> desc,
  Value<String> imagePath,
});

class $$DbmsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DbmsTableTable> {
  $$DbmsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DbmsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DbmsTableTable> {
  $$DbmsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbmsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbmsTableTable> {
  $$DbmsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);
}

class $$DbmsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbmsTableTable,
          DbmsRow,
          $$DbmsTableTableFilterComposer,
          $$DbmsTableTableOrderingComposer,
          $$DbmsTableTableAnnotationComposer,
          $$DbmsTableTableCreateCompanionBuilder,
          $$DbmsTableTableUpdateCompanionBuilder,
          (DbmsRow, BaseReferences<_$AppDatabase, $DbmsTableTable, DbmsRow>),
          DbmsRow,
          PrefetchHooks Function()
        > {
  $$DbmsTableTableTableManager(_$AppDatabase db, $DbmsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbmsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbmsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbmsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> desc = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
              }) => DbmsTableCompanion(
                id: id,
                name: name,
                desc: desc,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String desc,
                required String imagePath,
              }) => DbmsTableCompanion.insert(
                id: id,
                name: name,
                desc: desc,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DbmsTableTable, DbmsRow>(table),
                  BaseReferences<_$AppDatabase, $DbmsTableTable, DbmsRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DbmsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbmsTableTable,
      DbmsRow,
      $$DbmsTableTableFilterComposer,
      $$DbmsTableTableOrderingComposer,
      $$DbmsTableTableAnnotationComposer,
      $$DbmsTableTableCreateCompanionBuilder,
      $$DbmsTableTableUpdateCompanionBuilder,
      (DbmsRow, BaseReferences<_$AppDatabase, $DbmsTableTable, DbmsRow>),
      DbmsRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbmsTableTableTableManager get dbmsTable =>
      $$DbmsTableTableTableManager(_db, _db.dbmsTable);
}
